package com.worksap.stm2018.entity;

import lombok.Data;

import java.util.List;

@Data
public class TimetableEntity {
    private List<String> days;
    private List<String> times;
    private List<String> content;
}
