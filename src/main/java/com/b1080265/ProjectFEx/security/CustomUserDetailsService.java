package com.b1080265.ProjectFEx.security;


import com.b1080265.ProjectFEx.repositories.InvestorRepo;
import com.b1080265.ProjectFEx.repositories.StartupRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

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

        return UserPrincipal.create(user);
    }

}
