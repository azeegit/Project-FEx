package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.Startup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StartupRepo extends JpaRepository<Startup, Long> {
    // You can add custom query methods if needed
}
