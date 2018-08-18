package com.worksap.stm2018.dao;

import com.worksap.stm2018.vo.ApplicationVo;

import java.sql.Timestamp;
import java.util.List;

public interface ApplicationDao {
    /**
     * List the applications of a time period
     *
     */
    List<ApplicationVo> list(Timestamp beginTime, Timestamp endTime);

    /**
     * find the applications of a staff
     *
     * @param staffId
     * @param beginTime
     * @param endTime
     */
    List<ApplicationVo> find(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * put in a new application
     *
     * @param newRecord
     */
    void put(ApplicationVo newRecord);

    /**
     * add a result to a application
     *
     * @param applicationId
     * @param result
     * @param comment
     */
    void addResult(String applicationId, String result, String comment);

    /**
     * get the accepted applications of a time period
     *
     * @param beginTime
     * @param endTime
     */
    List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime);

    /**
     * generate new id
     *
     *
     */
    String generateNewId();
}
