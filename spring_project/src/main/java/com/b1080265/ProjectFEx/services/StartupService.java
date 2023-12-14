package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Role;
import com.b1080265.ProjectFEx.entities.Startup;
import com.b1080265.ProjectFEx.repositories.StartupRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StartupService {

    @Autowired
    private StartupRepo startupRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // Service method to save a startup
    public Startup saveStartup(Startup startup) {
        startup.setRole(Role.ROLE_STARTUP);
        startup.setPassword(passwordEncoder.encode(startup.getPassword()));
        return startupRepository.save(startup);
    }

    // Service method to retrieve all startups
    public List<Startup> getAllStartups() {
        return startupRepository.findAll();
    }

    // Service method to retrieve a startup by ID
    public Optional<Startup> getStartupById(Long id) {
        return startupRepository.findById(id);
    }

    // Service method to update a startup
    public Startup updateStartup(Long id, Startup updatedStartup) {
        Optional<Startup> existingStartupOptional = startupRepository.findById(id);

        if (existingStartupOptional.isPresent()) {
            Startup existingStartup = existingStartupOptional.get();
            existingStartup.setName(updatedStartup.getName());
            existingStartup.setDescription(updatedStartup.getDescription());
            existingStartup.setFounder(updatedStartup.getFounder());
            existingStartup.setIndustry(updatedStartup.getIndustry());
            existingStartup.setFoundingYear(updatedStartup.getFoundingYear());
            existingStartup.setCapital(updatedStartup.getCapital());

            return startupRepository.save(existingStartup);
        } else {
            return null;
        }
    }

    // Service method to delete a startup by ID
    public void deleteStartup(Long id) {
        startupRepository.deleteById(id);
    }

    // Service method to validate credentials for login
    public Startup validateCredentials(String username, String password) {
        Startup startup = startupRepository.findByUsername(username);

        if (startup != null && passwordEncoder.matches(password, startup.getPassword())) {
            return startup;
        }

        return null;
    }
}
