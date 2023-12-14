package com.b1080265.ProjectFEx.security;

import com.b1080265.ProjectFEx.entities.Role;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

public interface UserDetailsInterface extends UserDetails {

    @Override
    String getUsername();

    @Override
    String getPassword();

    Long getId();

    Role getRole();

    @Override
    default Collection<? extends GrantedAuthority> getAuthorities() {
        // Implement logic for authorities if necessary
        return null;
    }

    @Override
    default boolean isAccountNonExpired() {
        return true;
    }

    @Override
    default boolean isAccountNonLocked() {
        return true;
    }

    @Override
    default boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    default boolean isEnabled() {
        return true;
    }
}
