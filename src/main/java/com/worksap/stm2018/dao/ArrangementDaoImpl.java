package com.worksap.stm2018.dao;

import com.worksap.stm2018.util.NewIdUtil;
import com.worksap.stm2018.vo.ArrangementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
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
    private static final String FIND_SQL = "select * from arrangement where status = 'published' and " +
            "staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String DELETE_SQL = "delete from arrangement where begin_time >= ? and end_time <= ?";
    private static final String DELETE_OF_STAFF_SQL = "delete from arrangement where staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String SELECT_ID_SQL = "select arrangement_id from arrangement";
    private static final String INSERT_SQL = "insert into arrangement(arrangement_id, staff_id, staff_name," +
            " begin_time, end_time) values(?, ?, ?, ?, ?)";
    private static final String PUBLISH_SQL = "update arrangement set status = 'published' " +
            "where begin_time >= ? and end_time <= ?";
    private static final String REVOKE_SQL = "update arrangement set status = '' " +
            "where begin_time >= ? and end_time <= ?";
    private static final String UPDATE_PUBLISH_SQL = "update publish_history set status = 'published' where week = ?";
    private static final String REVOKE_PUBLISH_SQL = "update publish_history set status = '' where week = ?";
    private static final String CHECK_PUBLISH_SQL = "select status from publish_history where week = ?";

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
    public void deleteOfStaff(String staffId, Timestamp beginTime, Timestamp endTime) {
        template.update(DELETE_OF_STAFF_SQL,
                ps -> { ps.setString(1, staffId);
                    ps.setTimestamp(2, beginTime);
                    ps.setTimestamp(3, endTime);});
    }

    @Override
    public void put(List<ArrangementVo> newRecords) {
        for(ArrangementVo newRecord : newRecords) {
            String newId = generateNewId();
            template.update(INSERT_SQL,
                    ps -> { ps.setString(1, newId);
                        ps.setString(2, newRecord.getStaffId());
                        ps.setString(3, newRecord.getStaffName());
                        ps.setTimestamp(4, newRecord.getBeginTime());
                        ps.setTimestamp(5, newRecord.getEndTime());});
        }
    }

    @Override
    public void publishArrangements(Timestamp beginTime, Timestamp endTime) {
        template.update(PUBLISH_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);});
        template.update(UPDATE_PUBLISH_SQL,
                ps -> ps.setString(1, "3"));
    }

    @Override
    public void revokeArrangements(Timestamp beginTime, Timestamp endTime) {
        template.update(REVOKE_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                    ps.setTimestamp(2, endTime);});
        template.update(REVOKE_PUBLISH_SQL,
                ps -> ps.setString(1, "3"));
    }

    @Override
    public String generateNewId() {
        List<String> idList;
        idList = template.query(SELECT_ID_SQL, ps -> {}, (rs, rowNum) -> rs.getString(1));
        return NewIdUtil.generateNewId(idList);
    }

    @Override
    public String checkPublish(String week) {
        return DataAccessUtils.requiredSingleResult(template.query(CHECK_PUBLISH_SQL,
                ps -> ps.setString(1, week),
                (rs, rowNum) -> rs.getString(1)));
    }
}
