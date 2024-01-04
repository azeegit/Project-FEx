#[derive(Debug, Clone, Copy, scale::Encode, scale::Decode, PartialEq)]
#[cfg_attr(feature = "std", derive(scale_info::TypeInfo))]
pub enum AgreementStatus {
    Pending,
    Accepted,
    Rejected,
    // Add other statuses if needed
}
impl Default for AgreementStatus {
    fn default() -> Self {
        AgreementStatus::Pending
    }
}

