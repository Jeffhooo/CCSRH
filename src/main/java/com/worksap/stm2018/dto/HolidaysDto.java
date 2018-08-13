package com.worksap.stm2018.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class HolidaysDto {
    private String name;
    private String place;
    private Timestamp beginTime;
    private Timestamp endTime;
}
