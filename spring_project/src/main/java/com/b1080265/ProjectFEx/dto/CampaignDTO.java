package com.b1080265.ProjectFEx.dto;

import com.b1080265.ProjectFEx.entities.Campaign;


public class CampaignDTO {

    private Long id;
    private int amountSought;
    private int amountRaised;
    private int equityOffered;
    private int valuation;
    private String description;
    private Long startupId; // Only ID to avoid serialization issues

    // Constructors, Getters, and Setters

    public CampaignDTO() {
        // Default constructor
    }

    // Additional constructor to directly map entity to DTO
    public CampaignDTO(Campaign campaign) {
        this.id = campaign.getId();
        this.amountSought = campaign.getAmountSought();
        this.amountRaised = campaign.getAmountRaised();
        this.equityOffered = campaign.getEquityOffered();
        this.valuation = campaign.getValuation();
        this.description = campaign.getDescription();
        this.startupId = campaign.getStartup() != null ? campaign.getStartup().getId() : null;
    }

    // Getters and setters for all fields

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmountSought() {
        return amountSought;
    }

    public void setAmountSought(int amountSought) {
        this.amountSought = amountSought;
    }

    public int getAmountRaised() {
        return amountRaised;
    }

    public void setAmountRaised(int amountRaised) {
        this.amountRaised = amountRaised;
    }

    public int getEquityOffered() {
        return equityOffered;
    }

    public void setEquityOffered(int equityOffered) {
        this.equityOffered = equityOffered;
    }

    public int getValuation() {
        return valuation;
    }

    public void setValuation(int valuation) {
        this.valuation = valuation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getStartupId() {
        return startupId;
    }

    public void setStartupId(Long startupId) {
        this.startupId = startupId;
    }


    // ... Other getters and setters ...
}
