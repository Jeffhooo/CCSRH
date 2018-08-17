package com.worksap.stm2018.dto;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class ApplicationDto {
    private String applicationId;
    private String applicantId;
    private String applicantName;
    private String applyReason;
    private Timestamp beginTime;
    private Timestamp endTime;
    private String result;
    private String comment;
}
