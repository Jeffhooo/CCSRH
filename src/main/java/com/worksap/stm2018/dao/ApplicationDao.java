package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.ApplicationDto;
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
     * find the application
     *
     * @param applicantId
     */
    ApplicationVo find(String applicantId);

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
     */
    void addResult(String applicationId, String result);

    /**
     * get the accepted applications of a time period
     *
     * @param beginTime
     * @param endTime
     */
    List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime);

}
