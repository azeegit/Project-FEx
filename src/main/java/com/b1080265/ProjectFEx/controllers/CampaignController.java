package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.services.CampaignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/startups/{startupId}/campaigns")
public class CampaignController {

    @Autowired
    private CampaignService campaignService;

    // Endpoint to create a new campaign for a startup
    @PostMapping
    public ResponseEntity<Campaign> createCampaign(@PathVariable Long startupId, @RequestBody Campaign campaign) {
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
        return ResponseEntity.ok(campaign);
    }

    // Other endpoints for managing campaigns can be added here
}
