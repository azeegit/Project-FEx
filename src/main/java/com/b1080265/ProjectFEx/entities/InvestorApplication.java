package com.b1080265.ProjectFEx.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

import javax.persistence.*;

@Entity
@Table(name = "investor_applications", schema = "public")
public class InvestorApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "investor_id", nullable = false)
    @JsonBackReference
    private Investor investor;

    @ManyToOne
    @JoinColumn(name = "campaign_id", nullable = false)
    private Campaign campaign;

    private int investorRequest;
    private int investorGivingAmount;
    private String investorDetailsToContact;
    private String status;

    private String businessPlan; // Path or link to the business plan
    private String pitchVideo;   // Path or link to the pitch video
    private String additionalComments; // Additional comments from the investor

    // Constructors
    public InvestorApplication() {
        // Default constructor
    }

    public InvestorApplication(
            Investor investor,
            Campaign campaign,
            int investorRequest,
            int investorGivingAmount,
            String investorDetailsToContact,
            String status,
            String businessPlan,
            String pitchVideo,
            String additionalComments
    ) {
        this.investor = investor;
        this.campaign = campaign;
        this.investorRequest = investorRequest;
        this.investorGivingAmount = investorGivingAmount;
        this.investorDetailsToContact = investorDetailsToContact;
        this.status = status;
        this.businessPlan = businessPlan;
        this.pitchVideo = pitchVideo;
        this.additionalComments = additionalComments;
    }

    // Getters and setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Investor getInvestor() {
        return investor;
    }

    public void setInvestor(Investor investor) {
        this.investor = investor;
    }

    public Campaign getCampaign() {
        return campaign;
    }

    public void setCampaign(Campaign campaign) {
        this.campaign = campaign;
    }

    public int getInvestorRequest() {
        return investorRequest;
    }

    public void setInvestorRequest(int investorRequest) {
        this.investorRequest = investorRequest;
    }

    public int getInvestorGivingAmount() {
        return investorGivingAmount;
    }

    public void setInvestorGivingAmount(int investorGivingAmount) {
        this.investorGivingAmount = investorGivingAmount;
    }

    public String getInvestorDetailsToContact() {
        return investorDetailsToContact;
    }

    public void setInvestorDetailsToContact(String investorDetailsToContact) {
        this.investorDetailsToContact = investorDetailsToContact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getBusinessPlan() {
        return businessPlan;
    }

    public void setBusinessPlan(String businessPlan) {
        this.businessPlan = businessPlan;
    }

    public String getPitchVideo() {
        return pitchVideo;
    }

    public void setPitchVideo(String pitchVideo) {
        this.pitchVideo = pitchVideo;
    }

    public String getAdditionalComments() {
        return additionalComments;
    }

    public void setAdditionalComments(String additionalComments) {
        this.additionalComments = additionalComments;
    }


}


