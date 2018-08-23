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
    private static final String FIND_STAFF_PUBLISHED_SQL = "select * from arrangement where status = 'published' and " +
            "staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String FIND_STAFF_ALL_SQL = "select * from arrangement where " +
            "staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String DELETE_SQL = "delete from arrangement where begin_time >= ? and end_time <= ?";
    private static final String DELETE_OF_STAFF_SQL = "delete from arrangement where staff_id = ? and begin_time >= ? and end_time <= ?";
    private static final String SELECT_ID_SQL = "select arrangement_id from arrangement";
    private static final String INSERT_SQL = "insert into arrangement(arrangement_id, staff_id, staff_name, place," +
            " begin_time, end_time, status) values(?, ?, ?, ?, ?, ?, 'unpublished')";
    private static final String PUBLISH_SQL = "update arrangement set status = 'published' " +
            "where begin_time >= ? and end_time <= ?";
    private static final String REVOKE_SQL = "update arrangement set status = 'unpublished' " +
            "where begin_time >= ? and end_time <= ?";
    private static final String UPDATE_PUBLISH_SQL = "update publish_history set status = 'published' where week = ?";
    private static final String REVOKE_PUBLISH_SQL = "update publish_history set status = '' where week = ?";
    private static final String CHECK_PUBLISH_SQL = "select status from publish_history where week = ?";
    private static final String SELECT_STATUS_SQL = "select status from arrangement where begin_time >= ? and end_time <= ?";
    private static final String DELETE_BY_PLACE_SQL = "delete from arrangement where place = ? and begin_time >= ? and end_time <= ?";

    @Override
    public List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime) {
        return template.query(LIST_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new ArrangementVo.Builder()
                        .arrangementId(rs.getString(1))
                        .staffId(rs.getString(2))
                        .staffName(rs.getString(3))
                        .place(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .status(rs.getString(7))
                        .build());
    }

    @Override
    public List<ArrangementVo> findStaffPublish(String staffId, Timestamp beginTime, Timestamp endTime) {
        return template.query(FIND_STAFF_PUBLISHED_SQL,
                ps -> { ps.setString(1, staffId);
                        ps.setTimestamp(2, beginTime);
                        ps.setTimestamp(3, endTime);},
                (rs, rowNum) -> new ArrangementVo.Builder()
                        .arrangementId(rs.getString(1))
                        .staffId(rs.getString(2))
                        .staffName(rs.getString(3))
                        .place(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .status(rs.getString(7))
                        .build());
    }

    @Override
    public List<ArrangementVo> findStaffAll(String staffId, Timestamp beginTime, Timestamp endTime) {
        return template.query(FIND_STAFF_ALL_SQL,
                ps -> { ps.setString(1, staffId);
                    ps.setTimestamp(2, beginTime);
                    ps.setTimestamp(3, endTime);},
                (rs, rowNum) -> new ArrangementVo.Builder()
                        .arrangementId(rs.getString(1))
                        .staffId(rs.getString(2))
                        .staffName(rs.getString(3))
                        .place(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .status(rs.getString(7))
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
                        ps.setString(4, newRecord.getPlace());
                        ps.setTimestamp(5, newRecord.getBeginTime());
                        ps.setTimestamp(6, newRecord.getEndTime());});
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

    @Override
    public List<String> getArrangementStatus(Timestamp beginTime, Timestamp endTime) {
        return template.query(SELECT_STATUS_SQL,
                ps -> { ps.setTimestamp(1, beginTime);
                        ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> rs.getString(1));
    }

    @Override
    public void deleteByPlace(String place, Timestamp beginTime, Timestamp endTime) {
        template.update(DELETE_BY_PLACE_SQL, ps -> {
            ps.setString(1, place);
            ps.setTimestamp(2, beginTime);
            ps.setTimestamp(3, endTime);
        });
    }
}
