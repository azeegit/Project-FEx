package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.JwtTokenProvider;
import com.b1080265.ProjectFEx.entities.Investor;
import com.b1080265.ProjectFEx.entities.LoginRequest;
import com.b1080265.ProjectFEx.entities.LoginResponse;
import com.b1080265.ProjectFEx.services.InvestorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/investors")
public class InvestorController {

    @Autowired
    private InvestorService investorService;

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

    @Autowired
    private JwtTokenProvider tokenProvider;

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest loginRequest) {
        // Validate credentials (you may need to implement this method in InvestorService)
        Investor investor = investorService.validateCredentials(loginRequest.getUsername(), loginRequest.getPassword());

        if (investor != null) {
            // Generate JWT token
            String token = tokenProvider.generateToken(investor.getEmail());

            // Create and return the LoginResponse
            LoginResponse loginResponse = new LoginResponse(token);
            return ResponseEntity.ok(loginResponse);
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        }
    }
}
