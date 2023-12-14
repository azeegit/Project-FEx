package com.b1080265.ProjectFEx.entities;

import lombok.Data;

@Data
public class LoginResponse {

    private String Token;

    public LoginResponse(String token) {
        Token = token;
    }
}
