#![cfg_attr(not(feature = "std"), no_std, no_main)]

mod agreement_status;
mod campaign;
mod investment_agreement;
mod investor;
mod startup;

use investment_agreement::InvestmentAgreement;

#[ink::contract]
mod my_contract {
    use super::*;

    #[ink(storage)]
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
            terms: ink::prelude::string::String,
        ) {
            self.investment_agreement
                .create_agreement(startup_id, investor_id, campaign_id, terms);
        }

        // Include other methods as needed...
    }
}
