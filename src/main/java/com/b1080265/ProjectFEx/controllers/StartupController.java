package com.b1080265.ProjectFEx.controllers;

import com.b1080265.ProjectFEx.entities.Startup;
import com.b1080265.ProjectFEx.services.StartupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/startups")
public class StartupController {

    @Autowired
    private StartupService startupService;

    // Endpoint to create a new startup
    @PostMapping
    public ResponseEntity<Startup> createStartup(@RequestBody Startup startup) {
        Startup createdStartup = startupService.saveStartup(startup);
        return ResponseEntity.ok(createdStartup);
    }

    // Endpoint to retrieve all startups
    @GetMapping
    public ResponseEntity<List<Startup>> getAllStartups() {
        List<Startup> startups = startupService.getAllStartups();
        return ResponseEntity.ok(startups);
    }

    // Endpoint to retrieve a startup by ID
    @GetMapping("/{id}")
    public ResponseEntity<Startup> getStartupById(@PathVariable Long id) {
        Optional<Startup> startup = startupService.getStartupById(id);
        return startup.map(ResponseEntity::ok).orElse(ResponseEntity.notFound().build());
    }

    // Endpoint to update a startup by ID
    @PutMapping("/{id}")
    public ResponseEntity<Startup> updateStartup(@PathVariable Long id, @RequestBody Startup updatedStartup) {
        Startup updated = startupService.updateStartup(id, updatedStartup);
        return updated != null ? ResponseEntity.ok(updated) : ResponseEntity.notFound().build();
    }

    // Endpoint to delete a startup by ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStartup(@PathVariable Long id) {
        startupService.deleteStartup(id);
        return ResponseEntity.noContent().build();
    }
}
