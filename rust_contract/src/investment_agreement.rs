use crate::{agreement_status::AgreementStatus, campaign, investor, startup};
use ink::prelude::string::String;
use ink::storage::Mapping;
use scale::{Encode, Decode, Error as ScaleError};

#[derive(Debug, Clone, Encode, Decode, PartialEq)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub struct Agreement {
    id: u64,
    terms: String,
    status: AgreementStatus,
    pub startup_id: u64,
    pub investor_id: u64,
    pub campaign_id: u64,
}

impl Default for Agreement {
    fn default() -> Self {
        Self {
            id: 0,
            terms: String::default(),
            status: AgreementStatus::default(), // Make sure AgreementStatus has a default value
            startup_id: 0,
            investor_id: 0,
            campaign_id: 0,
        }
    }
}

// Custom encode and decode implementations for InvestmentAgreement
#[derive(Debug)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub struct InvestmentAgreement {
    agreements: Mapping<u64, Agreement>,
    agreement_counter: u64,
}

const MAX_AGREEMENTS: u64 = 10;

impl Encode for InvestmentAgreement {
    fn encode_to<T: scale::Output + ?Sized>(&self, dest: &mut T) {
        self.agreement_counter.encode_to(dest);

        for index in 1..=MAX_AGREEMENTS {
            if let Some(agreement) = self.agreements.get(index) {
                agreement.encode_to(dest);
            } else {
                Agreement::default().encode_to(dest);
            }
        }
    }
}

impl Decode for InvestmentAgreement {
    fn decode<I: scale::Input>(input: &mut I) -> Result<Self, ScaleError> {
        let agreement_counter = u64::decode(input)?;

        let mut agreements = Mapping::new();
        for index in 1..=MAX_AGREEMENTS {
            let agreement = Agreement::decode(input)?;
            if agreement != Agreement::default() {
                agreements.insert(index, &agreement);
            }
        }

        Ok(Self {
            agreements,
            agreement_counter,
        })
    }
}

impl InvestmentAgreement {
    pub fn new() -> Self {
        Self {
            agreements: Mapping::new(),
            agreement_counter: 0,
        }
    }

    pub fn create_agreement(
        &mut self,
        startup_id: u64,
        investor_id: u64,
        campaign_id: u64,
        terms: String,
    ) {
        self.agreement_counter += 1;
        let agreement_id = self.agreement_counter;

        let new_agreement = Agreement {
            id: agreement_id,
            startup_id,
            investor_id,
            campaign_id,
            terms,
            status: AgreementStatus::Pending,
        };

        self.agreements.insert(agreement_id, &new_agreement);
    }

    // Modified to remove and reinsert the modified agreement
    pub fn modify_agreement<F>(&mut self, agreement_id: u64, modify_fn: F)
        where F: FnOnce(&mut Agreement) {
        if let Some(mut agreement) = self.agreements.take(agreement_id) {
            modify_fn(&mut agreement);
            self.agreements.insert(agreement_id, &agreement);
        }
    }
}

// Usage of `modify_agreement` for accept, reject, and update terms
impl InvestmentAgreement {
    pub fn accept_agreement(&mut self, agreement_id: u64) {
        self.modify_agreement(agreement_id, |agreement| {
            if agreement.status == AgreementStatus::Pending {
                agreement.status = AgreementStatus::Accepted;
            }
        });
    }

    pub fn reject_agreement(&mut self, agreement_id: u64) {
        self.modify_agreement(agreement_id, |agreement| {
            if agreement.status == AgreementStatus::Pending {
                agreement.status = AgreementStatus::Rejected;
            }
        });
    }

    pub fn update_terms(&mut self, agreement_id: u64, new_terms: String) {
        self.modify_agreement(agreement_id, |agreement| {
            if agreement.status == AgreementStatus::Pending {
                agreement.terms = new_terms;
            }
        });
    }
}

