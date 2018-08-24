package jeff.dao;

import jeff.vo.ApplicationVo;

import java.sql.Timestamp;
import java.util.List;

public interface ApplicationDao {
    /**
     * List the applications of a time period
     *
     */
    List<ApplicationVo> list(Timestamp beginTime, Timestamp endTime);

    /**
     * List the applications of a time period
     *
     */
    List<ApplicationVo> listNotReject(Timestamp beginTime, Timestamp endTime);

    /**
     * find the applications of a staff
     *
     */
    List<ApplicationVo> find(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * put in a new application
     *
     */
    void put(ApplicationVo newRecord);

    /**
     * add a result to a application
     *
     */
    void addResult(String applicationId, String result, String comment);

    /**
     * get the accepted applications of a time period
     *
     */
    List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime);

    /**
     * generate new id
     *
     *
     */
    String generateNewId();

    /**
     * find application by id
     *
     *
     */
    ApplicationVo findById(String applicationId);
}
