package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.InvestorApplication;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InvestorApplicationRepo extends JpaRepository<InvestorApplication,Long> {

    List<InvestorApplication> findByInvestorId(Long investorId);

    Optional<InvestorApplication> findByIdAndInvestorId(Long id, Long investorId);

    Optional<InvestorApplication> findById(Long id);
    List<InvestorApplication> findByCampaignId(Long campaignId);
}
