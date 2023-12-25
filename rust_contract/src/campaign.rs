#[derive(Debug, Clone, PartialEq)]
pub struct Campaign {
    pub id: u64,
    pub amount_sought: u32,
    pub amount_raised: u32,
    pub equity_offered: u32,
    pub valuation: u32,
    pub description: String,
    // Add other fields as needed
}