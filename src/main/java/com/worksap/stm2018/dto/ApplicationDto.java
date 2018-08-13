package com.worksap.stm2018.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ApplicationDto {
    private String applicantId;
    private String applicantName;
    private String applyReason;
    private Timestamp beginTime;
    private Timestamp endTime;
    private String result;
    private String comment;
}
