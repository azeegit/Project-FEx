package com.b1080265.ProjectFEx.entities;

import com.b1080265.ProjectFEx.entities.Startup;

import javax.persistence.*;

@Entity
@Table(name = "startup_profiles")
public class StartupProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "startup_id", referencedColumnName = "id")
    private Startup startup;  // Assuming you have a Startup entity

    private String description;
    private String industry;
    private String location;
    private String websiteUrl;
    // Add other relevant fields

    // Constructors
    public StartupProfile() {
        // Default constructor
    }

    public StartupProfile(Startup startup, String description, String industry, String location, String websiteUrl) {
        this.startup = startup;
        this.description = description;
        this.industry = industry;
        this.location = location;
        this.websiteUrl = websiteUrl;
        // Initialize other fields
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Startup getStartup() {
        return startup;
    }

    public void setStartup(Startup startup) {
        this.startup = startup;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    // Other getters and setters
}

