package com.worksap.stm2018.dto;

import lombok.Data;
import lombok.Getter;

@Data
public final class LoginDto {
    private String id;
    private String name;
    private String password;
    private String title;

    public LoginDto(String id, String name, String password, String title) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.title = title;
    }
}
