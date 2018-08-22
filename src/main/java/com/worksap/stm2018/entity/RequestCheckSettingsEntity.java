package com.worksap.stm2018.entity;

import lombok.Data;

import java.util.List;

@Data
public class RequestCheckSettingsEntity {
    String workdays;
    List<String> languages;
}
