package com.worksap.stm2018.dto;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class ArrangementDto {
    private String arrangementId;
    private String staffId;
    private String staffName;
    private Timestamp beginTime;
    private Timestamp endTime;
    private String status;
}
