package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Startup;
import com.b1080265.ProjectFEx.repositories.StartupRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class StartupService {


    private StartupRepo startupRepository;

    public List<Startup> getAllStartups() {
        return startupRepository.findAll();
    }

    public Startup getStartupById(Long id) {
        return startupRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Startup with id " + id + " not found"));
    }

    public Startup createStartup(Startup startup) {
        return startupRepository.save(startup);
    }

    public Startup updateStartup(Long id, Startup updatedStartup) {
        Startup existingStartup = getStartupById(id);
        // Update the fields of existingStartup with the values from updatedStartup
        existingStartup.setName(updatedStartup.getName());
        existingStartup.setDescription(updatedStartup.getDescription());
        existingStartup.setFounder(updatedStartup.getFounder());
        existingStartup.setIndustry(updatedStartup.getIndustry());
        existingStartup.setFoundingYear(updatedStartup.getFoundingYear());
        existingStartup.setCapital(updatedStartup.getCapital());
        return startupRepository.save(existingStartup);
    }

    public void deleteStartup(Long id) {
        startupRepository.deleteById(id);
    }
}
