package com.b1080265.ProjectFEx.repositories;


import com.b1080265.ProjectFEx.entities.StartupProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface StartupProfileRepo extends JpaRepository<StartupProfile, Long> {

    // Custom query methods can be defined here if needed
    // For example, a method to find a profile by some specific criteria

    // Example:
    // Optional<StartupProfile> findBySomeField(String field);
}
