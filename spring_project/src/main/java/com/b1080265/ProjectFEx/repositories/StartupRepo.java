package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.Investor;
import com.b1080265.ProjectFEx.entities.Startup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StartupRepo extends JpaRepository<Startup, Long> {
    // You can add custom query methods if needed
    @Query("SELECT i FROM Startup i WHERE i.email = :email")
    Startup findByUsername(@Param("email") String email);

    Optional<Startup> findByEmail(String email);
}
