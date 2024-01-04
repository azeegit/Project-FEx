#[derive(Debug, Clone, scale::Encode, scale::Decode, PartialEq)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub struct Investor {
    pub id: u64,
    pub name: ink::prelude::string::String,
    pub email: ink::prelude::string::String,
    pub organization: ink::prelude::string::String,
    pub investment_interests: ink::prelude::string::String,
}
