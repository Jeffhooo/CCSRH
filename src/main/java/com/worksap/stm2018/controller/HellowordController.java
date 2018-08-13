package com.worksap.stm2018.controller;

import com.worksap.stm2018.model.DateTest;
import com.worksap.stm2018.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    List<String> home() {
        List<DateTest> dateList = jdbcTemplate.query("select * from date_test", BeanPropertyRowMapper.newInstance(DateTest.class));
        List<String> dateString = new ArrayList<>();
        for(DateTest dateTest : dateList) {
            Timestamp ts = dateTest.getDate();
            Date date = new Date();
            date.setTime(ts.getTime());
            dateString.add(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date));
        }

        return dateString;
    }
}
