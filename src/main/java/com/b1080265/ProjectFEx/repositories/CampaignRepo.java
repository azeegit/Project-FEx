package com.b1080265.ProjectFEx.repositories;

import com.b1080265.ProjectFEx.entities.Campaign;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CampaignRepo extends JpaRepository<Campaign, Long>
{
    List<Campaign> findByStartupId(Long startupId);

    Optional<Campaign> findByIdAndStartupId(Long id, Long startupId);
}
