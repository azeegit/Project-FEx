use near_sdk::borsh::{self, BorshDeserialize, BorshSerialize};
use near_sdk::{env, near_bindgen, PanicOnDefault};
use near_sdk::collections::UnorderedMap;
use serde::{Deserialize, Serialize};

#[near_bindgen]
#[derive(BorshDeserialize, BorshSerialize, PanicOnDefault)]
pub struct MyContract {
    campaigns: UnorderedMap<Vec<u8>, Campaign>,
    investors: UnorderedMap<Vec<u8>, Investor>,
    startups: UnorderedMap<Vec<u8>, Startup>,
    agreements: UnorderedMap<Vec<u8>, Agreement>,
    agreement_counter: u64,
}

#[derive(BorshDeserialize, BorshSerialize, Serialize, Deserialize, Debug, Clone)]
pub struct Campaign {
    pub id: u64,
    pub amount_sought: u32,
    pub amount_raised: u32,
    pub equity_offered: u32,
    pub valuation: u32,
    pub description: String,
}

#[derive(BorshDeserialize, BorshSerialize, Serialize, Deserialize, Debug, Clone)]
pub struct Investor {
    pub id: u64,
    pub name: String,
    pub email: String,
    pub organization: String,
    pub investment_interests: String,
}

#[derive(BorshDeserialize, BorshSerialize, Serialize, Deserialize, Debug, Clone)]
pub struct Startup {
    pub id: u64,
    pub name: String,
    pub description: String,
    pub email: String,
    pub founder: String,
    pub industry: String,
    pub founding_year: u32,
    pub capital: u32,
}

#[derive(BorshDeserialize, BorshSerialize, Serialize, Deserialize, Debug, Clone)]
pub struct Agreement {
    pub id: u64,
    pub terms: String,
    pub status: AgreementStatus,
    pub startup_id: u64,
    pub investor_id: u64,
    pub campaign_id: u64,
}

#[derive(BorshDeserialize, BorshSerialize, Serialize, Deserialize, Debug, Clone, PartialEq)]
pub enum AgreementStatus {
    Pending,
    Accepted,
    Rejected,
}

#[near_bindgen]
impl MyContract {
    #[init]
    pub fn new() -> Self {
        assert!(!env::state_exists(), "Already initialized");
        Self {
            campaigns: UnorderedMap::new(b"campaigns".to_vec()),
            investors: UnorderedMap::new(b"investors".to_vec()),
            startups: UnorderedMap::new(b"startups".to_vec()),
            agreements: UnorderedMap::new(b"agreements".to_vec()),
            agreement_counter: 0,
        }
    }

    pub fn create_agreement(&mut self, startup_id: u64, investor_id: u64, campaign_id: u64, terms: String) {
        let agreement_id = self.agreement_counter + 1;
        let new_agreement = Agreement {
            id: agreement_id,
            terms,
            status: AgreementStatus::Pending,
            startup_id,
            investor_id,
            campaign_id,
        };

        // Convert String key to byte slice
        let agreement_key = format!("agreement_{}", agreement_id).as_bytes().to_vec();

        // Insert the data into the UnorderedMap
        self.agreements.insert(&agreement_key, &new_agreement);

        self.agreement_counter += 1;
    }

    pub fn get_agreement(&self, agreement_id: u64) -> Option<Agreement> {
        // Convert String key to byte slice
        let agreement_key = format!("agreement_{}", agreement_id).as_bytes().to_vec();

        // Retrieve data from the UnorderedMap
        self.agreements.get(&agreement_key)
    }

    pub fn modify_agreement(&mut self, agreement_id: u64, new_terms: Option<String>, new_status: Option<AgreementStatus>) {
        let agreement_key = format!("agreement_{}", agreement_id).as_bytes().to_vec();

        if let Some(mut agreement) = self.agreements.get(&agreement_key) {
            if let Some(terms) = new_terms {
                agreement.terms = terms;
            }
            if let Some(status) = new_status {
                agreement.status = status;
            }

            // Update the data in the UnorderedMap
            self.agreements.insert(&agreement_key, &agreement);
        } else {
            env::log_str("Agreement not found");
        }
    }

    pub fn accept_agreement(&mut self, agreement_id: u64) {
        self.modify_agreement(agreement_id, None, Some(AgreementStatus::Accepted));
    }

    pub fn reject_agreement(&mut self, agreement_id: u64) {
        self.modify_agreement(agreement_id, None, Some(AgreementStatus::Rejected));
    }
}
