#![cfg_attr(not(feature = "std"), no_std, no_main)]

mod agreement_status;
mod campaign;

mod investor;
mod startup;

use ink_lang as ink;

#[ink::contract]
mod my_contract {
    use ink::prelude::string::String;
    use ink::storage::Mapping;
    use ink_storage::traits::{SpreadLayout, PackedLayout};
    use parity_scale_codec::{Encode, Decode};

    #[derive(Debug, Clone, PartialEq, Encode, Decode, SpreadLayout, PackedLayout)]
    #[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
    pub struct Agreement {
        id: u64,
        terms: String,
        status: AgreementStatus,
        pub startup_id: u64,
        pub investor_id: u64,
        pub campaign_id: u64,
    }

    #[derive(Debug, Clone, PartialEq, Encode, Decode)]
    pub enum AgreementStatus {
        Pending,
        Accepted,
        Rejected,
    }

    impl Default for AgreementStatus {
        fn default() -> Self {
            AgreementStatus::Pending
        }
    }

    impl Default for Agreement {
        fn default() -> Self {
            Self {
                id: 0,
                terms: Default::default(),
                status: Default::default(),
                startup_id: 0,
                investor_id: 0,
                campaign_id: 0,
            }
        }
    }

    #[derive(Default)]
    pub struct InvestmentAgreement {
        agreements: Mapping<u64, Agreement>,
        agreement_counter: u64,
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

        pub fn modify_agreement<F>(&mut self, agreement_id: u64, modify_fn: F)
            where F: FnOnce(&mut Agreement) {
            if let Some(mut agreement) = self.agreements.take(agreement_id) {
                modify_fn(&mut agreement);
                self.agreements.insert(agreement_id, &agreement);
            }
        }

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

    #[ink(storage)]
    #[derive(SpreadLayout, PackedLayout)]
    pub struct MyContract {
        investment_agreement: InvestmentAgreement,
    }

    impl MyContract {
        #[ink(constructor)]
        pub fn new() -> Self {
            Self {
                investment_agreement: InvestmentAgreement::new(),
            }
        }

        #[ink(message)]
        pub fn create_agreement(
            &mut self,
            startup_id: u64,
            investor_id: u64,
            campaign_id: u64,
            terms: String,
        ) {
            self.investment_agreement.create_agreement(startup_id, investor_id, campaign_id, terms);
        }

        // Additional methods can be added here as needed
    }
}

