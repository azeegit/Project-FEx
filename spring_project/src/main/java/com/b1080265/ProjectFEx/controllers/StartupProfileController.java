package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.StartupProfile;
import com.b1080265.ProjectFEx.services.StartupProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/startups/{startupId}/profile")
public class StartupProfileController {

    @Autowired
    private StartupProfileService startupProfileService;

    // Get profile
    @GetMapping
    public ResponseEntity<StartupProfile> getProfile(@PathVariable Long startupId) {
        StartupProfile profile = startupProfileService.getProfile(startupId);
        return profile != null ? ResponseEntity.ok(profile) : ResponseEntity.notFound().build();
    }

    // Update profile
    @PutMapping
    public ResponseEntity<StartupProfile> updateProfile(@PathVariable Long startupId, @Valid @RequestBody StartupProfile profile) {
        StartupProfile updatedProfile = startupProfileService.updateProfile(startupId, profile);
        return updatedProfile != null ? ResponseEntity.ok(updatedProfile) : ResponseEntity.notFound().build();
    }
}
