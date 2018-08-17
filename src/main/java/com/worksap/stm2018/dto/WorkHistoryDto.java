package com.worksap.stm2018.dto;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class WorkHistoryDto {
    private String staffId;
    private String staffName;
    private Timestamp beginTime;
    private Timestamp endTime;
}
