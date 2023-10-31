package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Investor;
import com.b1080265.ProjectFEx.repositories.InvestorRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class InvestorService {


    private InvestorRepo investorRepository;

    public List<Investor> getAllInvestors() {
        return investorRepository.findAll();
    }

    public Investor getInvestorById(Long id) {
        return investorRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Investor with id " + id + " not found"));
    }

    public Investor createInvestor(Investor investor) {
        return investorRepository.save(investor);
    }

    public Investor updateInvestor(Long id, Investor updatedInvestor) {
        Investor existingInvestor = getInvestorById(id);
        // Update the fields of existingInvestor with the values from updatedInvestor
        existingInvestor.setName(updatedInvestor.getName());
//        existingInvestor.setInvestmentAmount(updatedInvestor.getInvestmentAmount());
//        existingInvestor.setInvestmentType(updatedInvestor.getInvestmentType());
        // Update other fields as needed
        return investorRepository.save(existingInvestor);
    }

    public void deleteInvestor(Long id) {
        investorRepository.deleteById(id);
    }
}
