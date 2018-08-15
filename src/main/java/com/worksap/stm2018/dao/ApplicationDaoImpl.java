package com.worksap.stm2018.dao;

import com.worksap.stm2018.Util.NewIdUtil;
import com.worksap.stm2018.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class ApplicationDaoImpl implements ApplicationDao {
    private JdbcTemplate template;

    @Autowired
    public ApplicationDaoImpl(JdbcTemplate template) {
        this.template = template;
    }

    private static final String LIST_SQL = "select * from applications where begin_time >= ? and end_time <= ?";
    private static final String FIND_SQL = "select * from applications where applicant_id = ?";
    private static final String SELECT_ID_SQL = "select application_id from applications";
    private static final String INSERT_SQL = "insert into applications(application_id, applicant_id, applicant_name, " +
            "apply_reason, begin_time, end_time) values(?, ?, ?, ?, ?, ?)";
    private static final String ADD_RESULT_SQL = "update applications set result = ?, comment = ? where application_id = ?";
    private static final String SELECT_ACCEPT_SQL = "select * from applications where result = 'accept' " +
            "and begin_time >= ? and end_time <= ?";


    @Override
    public List<ApplicationVo> list(Timestamp beginTime, Timestamp endTime) {
        return template.query(LIST_SQL,
                ps -> {ps.setTimestamp(1, beginTime);
                       ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new ApplicationVo.Builder()
                        .applicationId(rs.getString(1))
                        .applicantId(rs.getString(2))
                        .applicantName(rs.getString(3))
                        .applyReason(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .result(rs.getString(7))
                        .comment(rs.getString(8)).build());
    }

    @Override
    public List<ApplicationVo> find(String applicantId) {
        return template.query(FIND_SQL,
                ps -> ps.setString(1, applicantId),
                (rs, rowNum) -> new ApplicationVo.Builder()
                        .applicationId(rs.getString(1))
                        .applicantId(rs.getString(2))
                        .applicantName(rs.getString(3))
                        .applyReason(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .result(rs.getString(7))
                        .comment(rs.getString(8)).build());
    }

    @Override
    public ApplicationVo put(ApplicationVo newRecord) {
        String newId = generateNewId();

        template.update(INSERT_SQL,
                ps -> {ps.setString(1, newId);
                       ps.setString(2, newRecord.getApplicantId());
                       ps.setString(3, newRecord.getApplicantName());
                       ps.setString(4, newRecord.getApplyReason());
                       ps.setTimestamp(5, newRecord.getBeginTime());
                       ps.setTimestamp(6, newRecord.getEndTime());});

        return new ApplicationVo.Builder().applicationId(newId)
                                          .applicantId(newRecord.getApplicantId())
                                          .applicantName(newRecord.getApplicantName())
                                          .applyReason(newRecord.getApplyReason())
                                          .beginTime(newRecord.getBeginTime())
                                          .endTime(newRecord.getEndTime())
                                          .build();
    }

    @Override
    public void addResult(String applicationId, String result, String comment) {
        template.update(ADD_RESULT_SQL,
                ps -> {ps.setString(1, result);
                       ps.setString(2, comment);
                       ps.setString(3, applicationId);});
    }

    @Override
    public List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime) {
        return template.query(SELECT_ACCEPT_SQL,
                ps -> {ps.setTimestamp(1, beginTime);
                       ps.setTimestamp(2, endTime);},
                (rs, rowNum) -> new ApplicationVo.Builder()
                        .applicationId(rs.getString(1))
                        .applicantId(rs.getString(2))
                        .applicantName(rs.getString(3))
                        .applyReason(rs.getString(4))
                        .beginTime(rs.getTimestamp(5))
                        .endTime(rs.getTimestamp(6))
                        .result(rs.getString(7))
                        .comment(rs.getString(8)).build());
    }

    @Override
    public String generateNewId() {
        List<String> idList;
        idList = template.query(SELECT_ID_SQL, ps -> {}, (rs, rowNum) -> rs.getString(1));
        return NewIdUtil.generateNewId(idList);
    }
}
