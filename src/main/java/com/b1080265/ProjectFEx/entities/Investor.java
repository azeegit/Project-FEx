package com.b1080265.ProjectFEx.entities;

import com.b1080265.ProjectFEx.security.UserDetailsInterface;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "investors", schema = "public")
public class Investor implements UserDetailsInterface {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    private String password;
    private String organization;
    private String investmentInterests;

    // Constructors
    public Investor() {
    }

    public Investor(String name, String email, String password, String organization, String investmentInterests) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.organization = organization;
        this.investmentInterests = investmentInterests;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getOrganization() { return organization; }
    public void setOrganization(String organization) { this.organization = organization; }
    public String getInvestmentInterests() { return investmentInterests; }
    public void setInvestmentInterests(String investmentInterests) { this.investmentInterests = investmentInterests; }

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
