package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Investor;
import com.b1080265.ProjectFEx.repositories.InvestorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InvestorService {


    @Autowired
    private InvestorRepo investorRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    // Service method to save an investor
    public Investor saveInvestor(Investor investor) {
        return investorRepository.save(investor);
    }

    // Service method to retrieve all investors
    public List<Investor> getAllInvestors() {
        return investorRepository.findAll();
    }

    // Service method to retrieve an investor by ID
    public Optional<Investor> getInvestorById(Long id) {
        return investorRepository.findById(id);
    }

    // Service method to update an investor
    public Investor updateInvestor(Long id, Investor updatedInvestor) {
        Optional<Investor> existingInvestorOptional = investorRepository.findById(id);

        if (existingInvestorOptional.isPresent()) {
            Investor existingInvestor = existingInvestorOptional.get();

            // Update relevant fields
            existingInvestor.setName(updatedInvestor.getName());
            existingInvestor.setEmail(updatedInvestor.getEmail());
            existingInvestor.setPassword(updatedInvestor.getPassword());
            existingInvestor.setOrganization(updatedInvestor.getOrganization());
            existingInvestor.setInvestmentInterests(updatedInvestor.getInvestmentInterests());

            // Save and return the updated investor
            return investorRepository.save(existingInvestor);
        } else {
            // Handle the case where the investor with the given ID is not found
            // You may throw an exception or handle it based on your application's logic
            return null;
        }
    }

    // Service method to delete an investor by ID
    public void deleteInvestor(Long id) {
        investorRepository.deleteById(id);
    }

//    public Investor validateCredentials(String username, String password) {
//        // Validate credentials against your database or any other data source
//        // Return the Investor if valid, or null otherwise
//        // This is a simplified example; you should use proper password hashing and validation
//        return investorRepo.findByUsernameAndPassword(username, password);
//    }

    public Investor validateCredentials(String username, String password) {
        Investor investor = investorRepository.findByUsername(username);

        if (investor != null && passwordEncoder.matches(password, investor.getPassword())) {
            return investor;
        }

        return null;
    }

}
