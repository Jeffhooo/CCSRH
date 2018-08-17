package com.worksap.stm2018.dto;

import lombok.Getter;

@Getter
public final class StaffDto {
    private String id;
    private String name;
    private String place;
    private String language1;
    private String language2;

    public StaffDto(String id, String name, String place, String language1, String language2) {
        this.id = id;
        this.name = name;
        this.place = place;
        this.language1 = language1;
        this.language2 = language2;
    }
}
