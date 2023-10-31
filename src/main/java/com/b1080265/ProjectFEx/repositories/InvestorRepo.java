package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.Investor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InvestorRepo extends JpaRepository<Investor, Long> {
    // You can add custom query methods if needed
}

