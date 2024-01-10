package com.b1080265.ProjectFEx.entities;

public class AgreementDetails {
    private Long startupId;
    private Long investorId;
    private Long campaignId;
    private String terms;




    public AgreementDetails(Long startupId, Long investorId, Long campaignId, String terms) {
        this.startupId = startupId;
        this.investorId = investorId;
        this.campaignId = campaignId;
        this.terms = terms;
    }

    public Long getStartupId() {
        return startupId;
    }

    public void setStartupId(Long startupId) {
        this.startupId = startupId;
    }

    public Long getInvestorId() {
        return investorId;
    }

    public void setInvestorId(Long investorId) {
        this.investorId = investorId;
    }

    public Long getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(Long campaignId) {
        this.campaignId = campaignId;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }
}
