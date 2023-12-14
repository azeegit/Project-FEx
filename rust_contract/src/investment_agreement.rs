use super::{Startup, Investor, AgreementStatus};
use rand::{Rng, thread_rng};

fn generate_unique_id() -> u64 {
    let mut rng = thread_rng();
    rng.gen()
}

#[derive(Debug, Clone, PartialEq)]
pub struct InvestmentAgreement {
    pub id: u64,
    pub startup: Startup,
    pub investor: Investor,
    pub amount_invested: f64,
    pub equity_offered: f64,
    pub terms: String,
    pub status: AgreementStatus,
}

impl InvestmentAgreement {
    pub fn new(startup: Startup, investor: Investor, amount_invested: f64, equity_offered: f64, terms: String) -> Self {
        InvestmentAgreement {
            id: generate_unique_id(), // This function needs to be defined to generate a unique ID
            startup,
            investor,
            amount_invested,
            equity_offered,
            terms,
            status: AgreementStatus::Pending,
        }
    }

    pub fn accept(&mut self) {
        self.status = AgreementStatus::Accepted;
        // Additional logic for accepting the agreement (e.g., transferring funds) goes here
    }

    pub fn reject(&mut self) {
        self.status = AgreementStatus::Rejected;
        // Additional logic for rejecting the agreement
    }

    // Add other methods as necessary
}
