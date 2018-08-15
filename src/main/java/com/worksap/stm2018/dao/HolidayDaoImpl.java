package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.HolidayDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class HolidayDaoImpl implements HolidayDao{
    private JdbcTemplate template;

    @Autowired
    public HolidayDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String SELECT_SQL = "select * from holidays where begin_time >= ? and end_time <= ?";

    @Override
    public List<HolidayDto> getHolidays(Timestamp beginTime, Timestamp endTime) {
        return template.query(SELECT_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new HolidayDto(rs.getString(1),
                                               rs.getString(2),
                                               rs.getTimestamp(3),
                                               rs.getTimestamp(4)));
    }
}
