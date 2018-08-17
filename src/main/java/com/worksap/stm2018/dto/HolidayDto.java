package com.worksap.stm2018.dto;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class HolidayDto {
    private String name;
    private String place;
    private Timestamp beginTime;
    private Timestamp endTime;

    public HolidayDto(String name, String place, Timestamp beginTime, Timestamp endTime) {
        this.name = name;
        this.place = place;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }
}
