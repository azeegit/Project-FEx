#[derive(Debug, Clone, scale::Encode, scale::Decode, PartialEq)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub struct Campaign {
    pub id: u64,
    pub amount_sought: u32,
    pub amount_raised: u32,
    pub equity_offered: u32,
    pub valuation: u32,
    pub description: ink::prelude::string::String, // Using ink! prelude for String type
}
