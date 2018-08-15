package com.worksap.stm2018.dao;

import com.worksap.stm2018.Util.NewIdUtil;
import com.worksap.stm2018.vo.ArrangementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class ArrangementDaoImpl implements ArrangementDao {
    private JdbcTemplate template;

    @Autowired
    public ArrangementDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String LIST_SQL = "select * from arrangement where begin_time >= ? and end_time <= ?";
    private static final String FIND_SQL = "select * from arrangement where status = 'publish' and " +
            "staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String DELETE_SQL = "delete from arrangement where begin_time >= ? and end_time <= ?";
    private static final String SELECT_ID_SQL = "select arrangement_id from arrangement";
    private static final String INSERT_SQL = "insert into arrangement(arrangement_id, staff_id, staff_name," +
            " begin_time, end_time) values(?, ?, ?, ?, ?)";
    private static final String PUBLISH_SQL = "update arrangement set status = 'publish' " +
            "where begin_time >= ? and end_time <= ?";

    @Override
    public List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime) {
        return template.query(LIST_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new ArrangementVo.Builder().arrangementId(rs.getString(1))
                                                           .staffId(rs.getString(2))
                                                           .staffName(rs.getString(3))
                                                           .beginTime(rs.getTimestamp(4))
                                                           .endTime(rs.getTimestamp(5))
                                                           .status(rs.getString(6))
                                                           .build());
    }

    @Override
    public List<ArrangementVo> findStaffPublish(String staffId, Timestamp beginTime, Timestamp endTime) {
        return template.query(FIND_SQL,
                ps -> { ps.setString(1, staffId);
                        ps.setTimestamp(2, beginTime);
                        ps.setTimestamp(3, endTime);},
                (rs, rowNum) -> new ArrangementVo.Builder().arrangementId(rs.getString(1))
                                                           .staffId(rs.getString(2))
                                                           .staffName(rs.getString(3))
                                                           .beginTime(rs.getTimestamp(4))
                                                           .endTime(rs.getTimestamp(5))
                                                           .status(rs.getString(6))
                                                           .build());
    }

    @Override
    public void delete(Timestamp beginTime, Timestamp endTime) {
        template.update(DELETE_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);});
    }

    @Override
    public ArrangementVo put(ArrangementVo newRecord) {
        String newId = generateNewId();
        template.update(INSERT_SQL,
                ps -> { ps.setString(1, newId);
                        ps.setString(2, newRecord.getStaffId());
                        ps.setString(3, newRecord.getStaffName());
                        ps.setTimestamp(4, newRecord.getBeginTime());
                        ps.setTimestamp(5, newRecord.getEndTime());});
        return new ArrangementVo.Builder().arrangementId(newId)
                                          .staffId(newRecord.getStaffId())
                                          .staffName(newRecord.getStaffName())
                                          .beginTime(newRecord.getBeginTime())
                                          .endTime(newRecord.getEndTime())
                                          .build();
    }

    @Override
    public void publishArrangements(Timestamp beginTime, Timestamp endTime) {
        template.update(PUBLISH_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);});
    }

    @Override
    public String generateNewId() {
        List<String> idList;
        idList = template.query(SELECT_ID_SQL, ps -> {}, (rs, rowNum) -> rs.getString(1));
        return NewIdUtil.generateNewId(idList);
    }
}
