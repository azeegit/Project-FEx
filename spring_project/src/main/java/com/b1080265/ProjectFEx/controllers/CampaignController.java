package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.entities.InvestorApplication;
import com.b1080265.ProjectFEx.services.CampaignService;
import com.b1080265.ProjectFEx.services.InvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/startups/{startupId}/campaigns")
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    @Autowired
    private InvestorService investorService;

    // Endpoint to create a new campaign for a startup
    @PostMapping
//    @PreAuthorize("hasRole('STARTUP')") // Ensures only authorized startups can create campaigns
    public ResponseEntity<Campaign> createCampaign(@PathVariable Long startupId, @Valid @RequestBody Campaign campaign) {
        Campaign createdCampaign = campaignService.createCampaign(startupId, campaign);
        return ResponseEntity.ok(createdCampaign);
    }

    // Endpoint to retrieve all campaigns for a startup
    @GetMapping
    public ResponseEntity<List<Campaign>> getAllCampaigns(@PathVariable Long startupId) {
        List<Campaign> campaigns = campaignService.getAllCampaigns(startupId);
        return ResponseEntity.ok(campaigns);
    }

    // Endpoint to retrieve details of a specific campaign
    @GetMapping("/{campaignId}")
    public ResponseEntity<Campaign> getCampaignDetails(@PathVariable Long startupId, @PathVariable Long campaignId) {
        Campaign campaign = campaignService.getCampaignDetails(startupId, campaignId);
        if (campaign == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(campaign);
    }


    // Endpoint to update a campaign
    @PutMapping("/{campaignId}")
    public ResponseEntity<Campaign> updateCampaign(@PathVariable Long startupId, @PathVariable Long campaignId, @Valid @RequestBody Campaign campaign) {
        Campaign updatedCampaign = campaignService.updateCampaign(startupId, campaignId, campaign);
        return updatedCampaign != null ? ResponseEntity.ok(updatedCampaign) : ResponseEntity.notFound().build();
    }

    // Endpoint to get all applications for a campaign
    private ResponseEntity<?> createErrorResponse(String message, HttpStatus status) {
        return ResponseEntity.status(status).body(message);
    }



    @GetMapping("/{campaignId}/applications")
    public ResponseEntity<?> getCampaignApplications(@PathVariable Long startupId, @PathVariable Long campaignId) {
        if (!campaignService.isCampaignOwnedByStartup(campaignId, startupId)) {
            return createErrorResponse("Unauthorized to view applications for this campaign", HttpStatus.FORBIDDEN);
        }
        List<InvestorApplication> applications = investorService.getApplicationsForCampaign(campaignId);
        return ResponseEntity.ok(applications);
    }

    @GetMapping("/all")
    public ResponseEntity<List<Campaign>> getAllCampaigns() {
        List<Campaign> campaigns = campaignService.getAllCampaigns();
        return ResponseEntity.ok(campaigns);
    }


    @DeleteMapping("/{campaignId}")
    public ResponseEntity<?> deleteCampaign(@PathVariable Long startupId, @PathVariable Long campaignId) {
        boolean isDeleted = campaignService.deleteCampaign(startupId, campaignId);

        if (isDeleted) {
            return ResponseEntity.ok().build(); // Successfully deleted the campaign
        } else {
            return ResponseEntity.notFound().build(); // Campaign not found or couldn't be deleted
        }
    }
}
