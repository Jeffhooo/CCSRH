package com.worksap.stm2018.controller;

import com.worksap.stm2018.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class HellowordController {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public HellowordController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @RequestMapping("/")
    @ResponseBody
    List<Person> home() {
        List<Person> personList = jdbcTemplate.query("select * from persons", BeanPropertyRowMapper.newInstance(Person.class));
        return personList;
    }
}
