package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Investor;
import com.b1080265.ProjectFEx.repositories.InvestorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class InvestorService {

    @Autowired
    private InvestorRepo investorRepo;

    // Service method to save an investor
    public Investor saveInvestor(Investor investor) {
        return investorRepo.save(investor);
    }

    // Service method to retrieve all investors
    public List<Investor> getAllInvestors() {
        return investorRepo.findAll();
    }

    // Service method to retrieve an investor by ID
    public Optional<Investor> getInvestorById(Long id) {
        return investorRepo.findById(id);
    }

    // Service method to update an investor
    public Investor updateInvestor(Long id, Investor updatedInvestor) {
        Optional<Investor> existingInvestorOptional = investorRepo.findById(id);

        if (existingInvestorOptional.isPresent()) {
            Investor existingInvestor = existingInvestorOptional.get();

            // Update relevant fields
            existingInvestor.setName(updatedInvestor.getName());
            existingInvestor.setEmail(updatedInvestor.getEmail());
            existingInvestor.setPassword(updatedInvestor.getPassword());
            existingInvestor.setOrganization(updatedInvestor.getOrganization());
            existingInvestor.setInvestmentInterests(updatedInvestor.getInvestmentInterests());

            // Save and return the updated investor
            return investorRepo.save(existingInvestor);
        } else {
            // Handle the case where the investor with the given ID is not found
            // You may throw an exception or handle it based on your application's logic
            return null;
        }
    }

    // Service method to delete an investor by ID
    public void deleteInvestor(Long id) {
        investorRepo.deleteById(id);
    }
}
