package com.worksap.stm2018.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class WorkHistoryDto {
    private String staffId;
    private String staffName;
    private Timestamp beginTime;
    private Timestamp endTime;
}
