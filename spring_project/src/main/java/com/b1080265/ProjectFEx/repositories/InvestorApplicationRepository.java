package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.InvestorApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InvestorApplicationRepository extends JpaRepository<InvestorApplication, Long> {
    // You can define custom methods here if needed, e.g.:
     List<InvestorApplication> findByCampaignId(Long campaignId);
}
