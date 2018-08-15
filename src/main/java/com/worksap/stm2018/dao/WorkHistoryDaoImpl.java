package com.worksap.stm2018.dao;

import com.worksap.stm2018.vo.WorkHistoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class WorkHistoryDaoImpl implements WorkHistoryDao{
    private JdbcTemplate template;

    @Autowired
    public WorkHistoryDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String SELECT_SQL = "select * from work_history where staff_id = ? and begin_time >= ? and end_time <= ?";

    @Override
    public List<WorkHistoryVo> list(String staffId, Timestamp beginTime, Timestamp endTime) {
        return template.query(SELECT_SQL,
                ps -> {ps.setString(1, staffId);
                       ps.setTimestamp(2, beginTime);
                       ps.setTimestamp(3, endTime);},
                (rs, rowNum) -> new WorkHistoryVo.Builder().staffId(rs.getString(1))
                                                           .staffName(rs.getString(2))
                                                           .beginTime(rs.getTimestamp(3))
                                                           .endTime(rs.getTimestamp(4))
                                                           .build());
    }
}
