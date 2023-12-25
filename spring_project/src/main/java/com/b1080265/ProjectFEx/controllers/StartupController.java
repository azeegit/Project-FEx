package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.*;
import com.b1080265.ProjectFEx.security.CustomUserDetailsService;
import com.b1080265.ProjectFEx.security.JwtTokenProvider;
import com.b1080265.ProjectFEx.services.InvestorService;
import com.b1080265.ProjectFEx.services.StartupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/startups")
public class StartupController {

    @Autowired
    private StartupService startupService;

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Autowired
    private InvestorService investorService;

    // Endpoint to create a new startup
    @PostMapping
    public ResponseEntity<Startup> createStartup(@RequestBody Startup startup) {
        Startup createdStartup = startupService.saveStartup(startup);
        return ResponseEntity.ok(createdStartup);
    }

    // Endpoint to retrieve all startups
    @GetMapping
    public ResponseEntity<List<Startup>> getAllStartups() {
        List<Startup> startups = startupService.getAllStartups();
        return ResponseEntity.ok(startups);
    }

    // Endpoint to retrieve a startup by ID
    @GetMapping("/{id}")
    public ResponseEntity<Startup> getStartupById(@PathVariable Long id) {
        Optional<Startup> startup = startupService.getStartupById(id);
        return startup.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    // Endpoint to update a startup by ID
    @PutMapping("/{id}")
    public ResponseEntity<Startup> updateStartup(@PathVariable Long id, @RequestBody Startup updatedStartup) {
        Startup updated = startupService.updateStartup(id, updatedStartup);
        return updated != null ? ResponseEntity.ok(updated) : ResponseEntity.notFound().build();
    }

    // Endpoint to delete a startup by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStartup(@PathVariable Long id) {
        startupService.deleteStartup(id);
        return ResponseEntity.noContent().build();
    }

    // Endpoint for startup login
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    // Other endpoints...

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest loginRequest) {
        Startup startup = startupService.validateCredentials(loginRequest.getUsername(), loginRequest.getPassword());
        if (startup != null) {
            UserDetails userDetails = customUserDetailsService.loadUserByUsername(startup.getEmail());
            String token = tokenProvider.generateToken(userDetails);
            return ResponseEntity.ok(new LoginResponse(token,startup.getId()));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }

    @PutMapping("/{startupId}/applications/{applicationId}/accept")
    public ResponseEntity<?> acceptApplication(
            @PathVariable Long startupId,
            @PathVariable Long applicationId) {
        InvestorApplication application = investorService.getApplicationById(applicationId);
        if (application == null) {
            return ResponseEntity.notFound().build();
        }

        if (!investorService.isCampaignOwnedByStartup(application.getCampaign().getId(), startupId)) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Unauthorized to update this application");
        }

        InvestorApplication updatedApplication = investorService.updateApplicationStatus(applicationId, ApplicationStatus.ACCEPTED);
        return ResponseEntity.ok(updatedApplication);
    }

    @PutMapping("/{startupId}/applications/{applicationId}/reject")
    public ResponseEntity<?> rejectApplication(
            @PathVariable Long startupId,
            @PathVariable Long applicationId) {
        InvestorApplication application = investorService.getApplicationById(applicationId);
        if (application == null) {
            return ResponseEntity.notFound().build();
        }

        if (!investorService.isCampaignOwnedByStartup(application.getCampaign().getId(), startupId)) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Unauthorized to update this application");
        }

        InvestorApplication updatedApplication = investorService.updateApplicationStatus(applicationId, ApplicationStatus.REJECTED);
        return ResponseEntity.ok(updatedApplication);
    }
}
