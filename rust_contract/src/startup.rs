#[derive(Debug, Clone, PartialEq)]
pub struct Startup {
    pub id: u64,
    pub name: String,
    pub email: String,
    pub description: String,
    // Add more fields as needed, matching your Spring Boot entity
}
