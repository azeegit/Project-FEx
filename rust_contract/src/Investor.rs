
#[derive(Debug, Clone, PartialEq)]
pub struct Investor {
    pub id: u64,
    pub name: String,
    pub email: String,
    pub investment_preferences: String, // Assuming a simple string representation
    // Add more fields as needed, matching your Spring Boot entity
}
