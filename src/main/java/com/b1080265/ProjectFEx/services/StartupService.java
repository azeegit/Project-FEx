package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Startup;
import com.b1080265.ProjectFEx.repositories.StartupRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StartupService {

    @Autowired
    private StartupRepo startupRepo;

    // Service method to save a startup
    public Startup saveStartup(Startup startup) {
        return startupRepo.save(startup);
    }

    // Service method to retrieve all startups
    public List<Startup> getAllStartups() {
        return startupRepo.findAll();
    }

    // Service method to retrieve a startup by ID
    public Optional<Startup> getStartupById(Long id) {
        return startupRepo.findById(id);
    }

    // Service method to update a startup
    public Startup updateStartup(Long id, Startup updatedStartup) {
        Optional<Startup> existingStartupOptional = startupRepo.findById(id);

        if (existingStartupOptional.isPresent()) {
            Startup existingStartup = existingStartupOptional.get();

            // Update relevant fields
            existingStartup.setName(updatedStartup.getName());
            existingStartup.setDescription(updatedStartup.getDescription());
            existingStartup.setFounder(updatedStartup.getFounder());
            existingStartup.setIndustry(updatedStartup.getIndustry());
            existingStartup.setFoundingYear(updatedStartup.getFoundingYear());
            existingStartup.setCapital(updatedStartup.getCapital());

            // Save and return the updated startup
            return startupRepo.save(existingStartup);
        } else {
            // Handle the case where the startup with the given ID is not found
            // You may throw an exception or handle it based on your application's logic
            return null;
        }
    }

    // Service method to delete a startup by ID
    public void deleteStartup(Long id) {
        startupRepo.deleteById(id);
    }
}
