package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.StartupProfile;
import com.b1080265.ProjectFEx.repositories.StartupProfileRepo;
import com.b1080265.ProjectFEx.security.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StartupProfileService {

    @Autowired
    private StartupProfileRepo startupProfileRepository;

    // Method to get a startup's profile
    public StartupProfile getProfile(Long startupId) {
        return startupProfileRepository.findById(startupId)
                .orElseThrow(() -> new NotFoundException("Profile not found for startup with ID: " + startupId));
    }

    // Method to update a startup's profile
    public StartupProfile updateProfile(Long startupId, StartupProfile updatedProfile) {
        StartupProfile currentProfile = startupProfileRepository.findById(startupId)
                .orElseThrow(() -> new NotFoundException("Profile not found for startup with ID: " + startupId));

        // Update the profile with new details
        currentProfile.setDescription(updatedProfile.getDescription());
        currentProfile.setIndustry(updatedProfile.getIndustry());
        currentProfile.setLocation(updatedProfile.getLocation());


        return startupProfileRepository.save(currentProfile);
    }


}

