package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.*;
import com.b1080265.ProjectFEx.security.CustomUserDetailsService;
import com.b1080265.ProjectFEx.security.JwtTokenProvider;
import com.b1080265.ProjectFEx.services.BlockchainService;
import com.b1080265.ProjectFEx.services.BlockchainServiceImpl;
import com.b1080265.ProjectFEx.services.CampaignService;
import com.b1080265.ProjectFEx.services.InvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/investors")
@CrossOrigin(origins = "http://localhost:3000")
public class InvestorController {

    @Autowired
    private InvestorService investorService;

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Autowired
    private CampaignService campaignService;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    // Endpoint to create a new investor
    @PostMapping
    public ResponseEntity<Investor> createInvestor(@RequestBody Investor investor) {
        Investor createdInvestor = investorService.saveInvestor(investor);
        return ResponseEntity.ok(createdInvestor);
    }

    // Endpoint to retrieve all investors
    @GetMapping
    public ResponseEntity<List<Investor>> getAllInvestors() {
        List<Investor> investors = investorService.getAllInvestors();
        return ResponseEntity.ok(investors);
    }

    // Endpoint to retrieve an investor by ID
    @GetMapping("/{id}")
    public ResponseEntity<Investor> getInvestorById(@PathVariable Long id) {
        Optional<Investor> investor = investorService.getInvestorById(id);
        return investor.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    // Endpoint to update an investor by ID
    @PutMapping("/{id}")
    public ResponseEntity<Investor> updateInvestor(@PathVariable Long id, @RequestBody Investor updatedInvestor) {
        Investor updated = investorService.updateInvestor(id, updatedInvestor);
        return updated != null ? ResponseEntity.ok(updated) : ResponseEntity.notFound().build();
    }

    // Endpoint to delete an investor by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteInvestor(@PathVariable Long id) {
        investorService.deleteInvestor(id);
        return ResponseEntity.noContent().build();
    }


    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest loginRequest) {
        Investor investor = investorService.validateCredentials(loginRequest.getUsername(), loginRequest.getPassword());
        if (investor != null) {
            UserDetails userDetails = customUserDetailsService.loadUserByUsername(investor.getEmail());
            String token = tokenProvider.generateToken(userDetails);
            return ResponseEntity.ok(new LoginResponse(token, investor.getId()));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    // Endpoint to submit an application for a campaign
    @PostMapping("/{investorId}/campaigns/{campaignId}/apply")
    public ResponseEntity<?> applyToCampaign(
            @PathVariable Long investorId,
            @PathVariable Long campaignId,
            @RequestBody InvestorApplication application) {

        // Retrieve the campaign to get the startupId and perhaps terms
        Campaign campaign = campaignService.getCampaignById(campaignId);
        if (campaign == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Campaign not found");
        }
        Long startupId = campaign.getStartup().getId();
        String terms = campaign.getDescription(); // Assuming terms are part of the campaign description

        // Process the application
        InvestorApplication applied = investorService.applyToCampaign(investorId, campaignId, application);
        if (applied == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Application process failed");
        }

        // Create AgreementDetails and interact with the blockchain
        AgreementDetails details = new AgreementDetails(startupId, investorId, campaignId, terms);
        BlockchainService blockchainService = new BlockchainServiceImpl();
        boolean success = blockchainService.createInvestmentAgreement(details);

        if (!success) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to create agreement on blockchain");
        }

        return ResponseEntity.ok(applied);
    }


    // Endpoint to retrieve all applications submitted by an investor
    @GetMapping("/{investorId}/applications")
    public ResponseEntity<List<InvestorApplication>> getInvestorApplications(@PathVariable Long investorId) {
        List<InvestorApplication> applications = investorService.getInvestorApplications(investorId);
        return ResponseEntity.ok(applications);
    }

    // Endpoint to retrieve details of a specific application submitted by an investor
    @GetMapping("/{investorId}/applications/{applicationId}")
    public ResponseEntity<InvestorApplication> getInvestorApplicationDetails(
            @PathVariable Long investorId,
            @PathVariable Long applicationId
    ) {
        InvestorApplication application = investorService.getInvestorApplicationDetails(investorId, applicationId);
        return ResponseEntity.ok(application);
    }
}
