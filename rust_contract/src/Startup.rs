#[derive(Debug, Clone, scale::Encode, scale::Decode, PartialEq)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub struct Startup {
    pub id: u64,
    pub name: ink::prelude::string::String,
    pub description: ink::prelude::string::String,
    pub email: ink::prelude::string::String,
    pub founder: ink::prelude::string::String,
    pub industry: ink::prelude::string::String,
    pub founding_year: u32,
    pub capital: u32,
}

// impl Startup {
//     pub fn new(
//         id: u64,
//         name: ink_prelude::string::String,
//         description: ink_prelude::string::String,
//         email: ink_prelude::string::String,
//         founder: ink_prelude::string::String,
//         industry: ink_prelude::string::String,
//         founding_year: u32,
//         capital: u32,
//     ) -> Self {
//         Self {
//             id,
//             name,
//             description,
//             email,
//             founder,
//             industry,
//             founding_year,
//             capital,
//         }
//     }
//
//     // No additional methods required if all logic is handled in the Java application
// }
