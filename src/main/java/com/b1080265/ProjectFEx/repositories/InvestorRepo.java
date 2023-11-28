package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.Investor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface InvestorRepo extends JpaRepository<Investor, Long> {

    @Query("SELECT i FROM Investor i WHERE i.email = :email")
    Investor findByUsername(@Param("email") String email);
}

