// Assuming 'Startup', 'Investor', 'Campaign', and 'AgreementStatus' are defined in the super module or other modules
use super::{Startup, Investor, Campaign, AgreementStatus};
use rand::{Rng, thread_rng};

fn generate_unique_id() -> u64 {
    let mut rng = thread_rng();
    rng.gen()
}

#[derive(Debug, Clone, PartialEq)]
pub struct InvestmentAgreement {
    pub id: u64,
    pub startup: Startup,      // 'Startup' is a type, so it should be PascalCase
    pub investor: Investor,    // 'Investor' is a type, so it should be PascalCase
    pub campaign: Campaign,    // 'Campaign' is a type, so it should be PascalCase
    pub terms: String,
    pub status: AgreementStatus, // 'AgreementStatus' is a type, so it should be PascalCase
}

impl InvestmentAgreement {
    pub fn new(startup: Startup, investor: Investor, campaign: Campaign, terms: String) -> Self {
        InvestmentAgreement {
            id: generate_unique_id(),
            startup,
            investor,
            campaign,
            terms,
            status: AgreementStatus::Pending, // Use the enum variant directly
        }
    }

    pub fn accept(&mut self) {
        if self.status == AgreementStatus::Pending {
            self.status = AgreementStatus::Accepted;
        }
    }

    pub fn reject(&mut self) {
        if self.status == AgreementStatus::Pending {
            self.status = AgreementStatus::Rejected;
        }
    }

    pub fn update_terms(&mut self, new_terms: String) {
        if self.status == AgreementStatus::Pending {
            self.terms = new_terms;
        }
    }
}
