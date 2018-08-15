package com.worksap.stm2018.model;

import lombok.Data;
import org.postgresql.jdbc.PgArray;

import java.util.List;

@Data
public class Person {
    private String id;
    private String name;
    private String city;
    private String language1;
    private String language2;
}
