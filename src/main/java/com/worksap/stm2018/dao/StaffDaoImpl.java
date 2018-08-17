package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.StaffDto;
import com.worksap.stm2018.entity.StaffEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
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
    private static final String GET_PLACE_SQL = "select place from staffs where id = ?";
    private static final String GET_NAME_SQL = "select name from staffs where id = ?";
    private static final String GET_STAFF_SQL = "select * from staffs where id = ?";

    @Override
    public String getStaffPlace(String staffId) {
        return DataAccessUtils.requiredSingleResult(template.query(GET_PLACE_SQL,
                ps -> ps.setString(1, staffId),
                (rs, rowNum) -> rs.getString(1)));
    }

    @Override
    public String getStaffName(String staffId) {
        return DataAccessUtils.requiredSingleResult(template.query(GET_NAME_SQL,
                ps -> ps.setString(1, staffId),
                (rs, rowNum) -> rs.getString(1)));
    }

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

    @Override
    public StaffEntity getStaff(String staffId) {
        try {
            return DataAccessUtils.requiredSingleResult(template.query(GET_STAFF_SQL,
                    ps -> ps.setString(1, staffId),
                    (rs, rowNum) -> new StaffEntity(
                            rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5))));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
