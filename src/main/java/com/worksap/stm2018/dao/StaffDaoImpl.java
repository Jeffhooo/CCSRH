package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.StaffDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class StaffDaoImpl implements StaffDao {
    private JdbcTemplate template;

    @Autowired
    public StaffDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String SELECT_SQL = "select * from staffs";

    @Override
    public List<StaffDto> list() {
        return template.query(SELECT_SQL,
                ps -> {},
                (rs, rowNum) -> new StaffDto(rs.getString(1),
                                             rs.getString(2),
                                             rs.getString(3),
                                             rs.getString(4),
                                             rs.getString(5)));
    }
}
