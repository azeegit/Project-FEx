package com.b1080265.ProjectFEx.entities;

import lombok.Data;

@Data
public class LoginRequest {

    private String username;
    private String password;

    public LoginRequest(String username, String password) {
        this.username = username;
        this.password = password;
    }
}
