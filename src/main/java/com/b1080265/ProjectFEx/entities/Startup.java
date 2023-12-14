package com.b1080265.ProjectFEx.entities;

import com.b1080265.ProjectFEx.security.UserDetailsInterface;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "startups", schema = "public")
public class Startup implements UserDetailsInterface {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String email;
    private String password;
    private String founder;
    private String industry;
    private int foundingYear;
    private int capital;
    private int equityOffered;
    private int valuation;

    @Enumerated(EnumType.STRING)
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @OneToMany(mappedBy = "startup")
    @JsonManagedReference
    private List<Campaign> campaigns;

    // Constructors
    public Startup() {
    }

    public Startup(String name, String description, String email, String password, String founder, String industry, int foundingYear, int capital) {
        this.name = name;
        this.description = description;
        this.email = email;
        this.password = password;
        this.founder = founder;
        this.industry = industry;
        this.foundingYear = foundingYear;
        this.capital = capital;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getFounder() { return founder; }
    public void setFounder(String founder) { this.founder = founder; }
    public String getIndustry() { return industry; }
    public void setIndustry(String industry) { this.industry = industry; }
    public int getFoundingYear() { return foundingYear; }
    public void setFoundingYear(int foundingYear) { this.foundingYear = foundingYear; }
    public int getCapital() { return capital; }
    public void setCapital(int capital) { this.capital = capital; }
    public int getEquityOffered() { return equityOffered; }
    public void setEquityOffered(int equityOffered) { this.equityOffered = equityOffered; }
    public int getValuation() { return valuation; }
    public void setValuation(int valuation) { this.valuation = valuation; }
    public List<Campaign> getCampaigns() { return campaigns; }
    public void setCampaigns(List<Campaign> campaigns) { this.campaigns = campaigns; }

    // UserDetailsInterface methods
    @Override
    public String getUsername() { return getEmail(); }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { return null; } // Implement as needed
    @Override
    public boolean isAccountNonExpired() { return true; }
    @Override
    public boolean isAccountNonLocked() { return true; }
    @Override
    public boolean isCredentialsNonExpired() { return true; }
    @Override
    public boolean isEnabled() { return true; }

    // Other methods
}
