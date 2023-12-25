#[derive(Debug, Clone, PartialEq)]
pub struct Investor {
    pub id: u64,
    pub name: String,
    pub email: String,
    pub organization: String,
    pub investment_interests: String,
}
