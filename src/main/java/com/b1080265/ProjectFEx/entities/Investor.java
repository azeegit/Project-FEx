package com.b1080265.ProjectFEx.entities;

import javax.persistence.*;

@Entity
@Table(name = "investors")
public class Investor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;

    // Additional attributes specific to investors
    private String organization;
    private String investmentInterests;

    // Constructors, getters, and setters

    public Investor() {
        // Default constructor
    }

    public Investor(String name, String email, String password, String organization, String investmentInterests) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.organization = organization;
        this.investmentInterests = investmentInterests;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getInvestmentInterests() {
        return investmentInterests;
    }

    public void setInvestmentInterests(String investmentInterests) {
        this.investmentInterests = investmentInterests;
    }

    // Other methods and overrides as needed

    @Override
    public String toString() {
        return "Investor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", organization='" + organization + '\'' +
                '}';
    }
}

