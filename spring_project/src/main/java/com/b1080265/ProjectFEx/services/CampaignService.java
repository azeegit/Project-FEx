package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.InvestorApplication;
import com.b1080265.ProjectFEx.security.NotFoundException;
import com.b1080265.ProjectFEx.repositories.CampaignRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.entities.Startup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.b1080265.ProjectFEx.repositories.StartupRepo;

import java.util.List;
import java.util.Optional;

// CampaignService.java

@Service
public class CampaignService {


    private static final Logger logger = LoggerFactory.getLogger(CampaignService.class);
    @Autowired
    private StartupRepo startupRepository;

    @Autowired
    private CampaignRepo campaignRepository;

    public Campaign createCampaign(Long startupId, Campaign campaign) {
        // Retrieve the startup
        logger.info("Creating campaign for startupId: {}", startupId);
        Startup startup = startupRepository.findById(startupId)
                .orElseThrow(() -> new NotFoundException("Startup not found"));

        // Set the relationship
        campaign.setStartup(startup);

        // Set other details provided by the startup
        campaign.setStatus("Pending"); // You can set an initial status
        campaign.setAmountSought(campaign.getAmountSought());
        campaign.setEquityOffered(campaign.getEquityOffered());
        campaign.setValuation(campaign.getValuation());
        // Add any other details you want to set

        // Save the campaign
        return campaignRepository.save(campaign);
    }

    public List<Campaign> getAllCampaigns(Long startupId) {
        return campaignRepository.findByStartupId(startupId);
    }

    public void processInvestorApplications(Long campaignId) {
        Campaign campaign = getCampaignById(campaignId);
        if (campaign == null) {
            throw new NotFoundException("Campaign not found");
        }

        for (InvestorApplication application : campaign.getInvestorApplications()) {
            // Process each application
            // For example, you can log or modify something
            logger.info("Processing application from investor {}", application.getInvestor().getName());
            // Add your business logic here
        }
    }

    // Service method to retrieve details of a specific campaign
    public Campaign getCampaignDetails(Long startupId, Long campaignId) {
        return campaignRepository.findByIdAndStartupId(campaignId, startupId)
                .orElseThrow(() -> new NotFoundException("Campaign not found for the given startup"));
    }

    public Campaign updateCampaign(Long startupId, Long campaignId, Campaign campaignDetails) {
        Campaign campaign = campaignRepository.findByIdAndStartupId(campaignId, startupId)
                .orElseThrow(() -> new NotFoundException("Campaign not found for the given startup"));

        // Update campaign details
        // Example: campaign.setTitle(campaignDetails.getTitle());
        // Save and return updated campaign
        return campaignRepository.save(campaign);
    }

    public boolean isCampaignOwnedByStartup(Long campaignId, Long startupId) {
        return campaignRepository.existsByIdAndStartupId(campaignId, startupId);
    }

    // In CampaignService class
    public List<Campaign> getAllCampaigns() {
        return campaignRepository.findAll(); // Assuming you have a JPA repository
    }

    public Campaign getCampaignById(Long campaignId) {
        return campaignRepository.getById(campaignId);

    }

    public boolean deleteCampaign(Long startupId, Long campaignId) {
        // Check if the campaign exists and belongs to the startup
        Optional<Campaign> campaignOptional = campaignRepository.findByIdAndStartupId(campaignId, startupId);

        if (campaignOptional.isPresent()) {
            // Perform the deletion
            campaignRepository.deleteById(campaignId);
            return true; // Return true if the campaign was successfully deleted
        } else {
            // Campaign not found or doesn't belong to the startup
            return false; // Return false otherwise
        }
    }
}
