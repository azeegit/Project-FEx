package com.b1080265.ProjectFEx.entities;

import javax.persistence.*;

@Entity
@Table(name="startups",schema = "public")
public class Startup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="djd")
    private String name;
    private String description;
    private String founder;

    private String industry;
    private int foundingYear;

    private int capital;

    // Constructors, getters, and setters

    public int getCapital() {
        return capital;
    }

    public void setCapital(int capital) {
        this.capital = capital;
    }

    public Startup() {
        // Default constructor
    }

    public Startup(String name, String description, String founder, String industry, int foundingYear, int capital) {
        this.name = name;
        this.description = description;
        this.founder = founder;
        this.industry = industry;
        this.foundingYear = foundingYear;
        this.capital = capital;
    }

    // Getters and setters for all fields

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFounder() {
        return founder;
    }

    public void setFounder(String founder) {
        this.founder = founder;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public int getFoundingYear() {
        return foundingYear;
    }

    public void setFoundingYear(int foundingYear) {
        this.foundingYear = foundingYear;
    }

    // Other methods and overrides as needed

    @Override
    public String toString() {
        return "Startup{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", founder='" + founder + '\'' +
                ", industry='" + industry + '\'' +
                ", foundingYear=" + foundingYear +
                '}';
    }
}

