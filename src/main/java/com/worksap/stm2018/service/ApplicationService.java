package com.worksap.stm2018.service;

import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.ApplicationVo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface ApplicationService {
    /**
     * get all the applications of a time period
     *
     */
    List<ApplicationVo> getApplications(Timestamp beginTime, Timestamp endTime);

    /**
     * create a new application
     *
     */
    ApplicationVo create(ApplicationVo newRecord);

    /**
     * accept a application
     *
     */
    void accept(String applicationid, String comment);

    /**
     * reject a application
     *
     */
    void reject(String applicationid, String comment);

    /**
     * get accepted applications of a time period
     *
     */
    List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime);

    TimetableEntity ApplicationsTimetable(String staffId, Date beginDate, Date endDate);

}
