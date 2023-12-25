package com.b1080265.ProjectFEx.entities;

import lombok.Data;

@Data
public class LoginResponse {

    private String Token;
    private Long id;

    public LoginResponse(String token, Long ed) {
        Token = token;
        id=ed;
    }
}
