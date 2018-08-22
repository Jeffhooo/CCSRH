package com.worksap.stm2018.entity;

import lombok.Data;

@Data
public class HolidayEntity {
    private String id;
    private String name;
    private String place;
    private String beginTime;
    private String endTime;

    public HolidayEntity(String id, String name, String place, String beginTime, String endTime) {
        this.id = id;
        this.name = name;
        this.place = place;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }

    public HolidayEntity(){};
}
