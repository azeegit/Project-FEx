package com.b1080265.ProjectFEx.repositories;


import com.b1080265.ProjectFEx.entities.StartupProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface StartupProfileRepo extends JpaRepository<StartupProfile, Long> {


     Optional<StartupProfile> findBySomeField(String field);
}
