package com.worksap.stm2018.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class DateTest {
    Timestamp date;
    public Timestamp getDate() { return this.date; }
}
