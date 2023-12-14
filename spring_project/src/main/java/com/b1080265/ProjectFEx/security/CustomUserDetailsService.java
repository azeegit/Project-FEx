package com.b1080265.ProjectFEx.security;


import com.b1080265.ProjectFEx.repositories.InvestorRepo;
import com.b1080265.ProjectFEx.repositories.StartupRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private StartupRepo startupRepository;
    @Autowired
    private InvestorRepo investorRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetailsInterface user = startupRepository.findByEmail(username)
                .map(startup -> (UserDetailsInterface) startup)
                .orElseGet(() -> investorRepository.findByEmail(username)
                        .map(investor -> (UserDetailsInterface) investor)
                        .orElseThrow(() ->
                                new UsernameNotFoundException("User not found with email: " + username)
                        ));

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(user.getRole().name()));

        // The following line creates a User (org.springframework.security.core.userdetails.User) instance
        // with the username, password, and authorities from the user entity.
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
    }


}
