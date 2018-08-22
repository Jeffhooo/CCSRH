package com.worksap.stm2018.dto;

import lombok.Getter;

@Getter
public class CheckSettingsDto {
    private String workDays;
    private String[] serviceLanguages;

    public CheckSettingsDto(String workDays, String[] serviceLanguages) {
        this.workDays = workDays;
        this.serviceLanguages = serviceLanguages;
    }
}
