#[derive(Debug, Clone, PartialEq)]
pub struct Startup {
    pub id: u64,
    pub name: String,
    pub description: String,
    pub email: String,
    pub founder: String,
    pub industry: String,
    pub founding_year: u32,
    pub capital: u32,
    // Add more fields as needed, matching your Spring Boot entity
}
