package com.b1080265.ProjectFEx.entities;


import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.persistence.*;

@Entity
@Table(name = "campaigns", schema = "public")
public class Campaign {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int amountSought;
    private int amountRaised;
    private int equityOffered;
    private int valuation;
    private String description;

    // Other campaign details

    @ManyToOne
    @JoinColumn(name = "startup_id", nullable = false)
    @JsonBackReference
    private Startup startup;

    // Constructors
    public Campaign() {
        // Default constructor
    }

    public Campaign(int amountSought, int amountRaised, int equityOffered, int valuation, String description, Startup startup) {
        this.amountSought = amountSought;
        this.amountRaised = amountRaised;
        this.equityOffered = equityOffered;
        this.valuation = valuation;
        this.description = description;
        this.startup = startup;
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmountSought() {
        return amountSought;
    }

    public void setAmountSought(int amountSought) {
        this.amountSought = amountSought;
    }

    public int getAmountRaised() {
        return amountRaised;
    }

    public void setAmountRaised(int amountRaised) {
        this.amountRaised = amountRaised;
    }

    public int getEquityOffered() {
        return equityOffered;
    }

    public void setEquityOffered(int equityOffered) {
        this.equityOffered = equityOffered;
    }

    public int getValuation() {
        return valuation;
    }

    public void setValuation(int valuation) {
        this.valuation = valuation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Startup getStartup() {
        return startup;
    }

    public void setStartup(Startup startup) {
        this.startup = startup;
    }

    public void setStatus(String pending) {
    }
}
