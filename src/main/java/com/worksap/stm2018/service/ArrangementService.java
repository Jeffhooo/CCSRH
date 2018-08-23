package com.worksap.stm2018.service;

import com.worksap.stm2018.entity.ArrangementTableEntity;
import com.worksap.stm2018.entity.PublishStatusEntity;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.ArrangementVo;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

public interface ArrangementService {
    /**
     * List the arrangements of a time period
     *
     */
    List<ArrangementTableEntity> list(Date beginDate, Date endDate);

    /**
     * update the arrangements of a time period
     *
     */
    void update(List<String> staffs, Timestamp beginTime, Timestamp endTime);

    /**
     * publish the arrangements of a time period
     *
     */
    void publish(Date beginTime, Date endTime);

    /**
     * revoke the arrangements of a time period
     *
     */
    void revoke(Date beginTime, Date endTime);

    /**
     * get staff arrangement
     *
     */
    TimetableEntity getStaffArrangement(String staffId, Date beginTime, Date endTime);

    /**
     * get staff arrangement for manager
     *
     */
    TimetableEntity getStaffArrangementForManager(String staffId, Date beginTime, Date endTime);

    /**
     * check whether the arrangement of week is publish
     *
     */
    String checkPublish(String week);

    /**
     * check whether has published arrangement
     *
     */
    PublishStatusEntity hasPublishArrangement(Date beginDate, Date endDate);

}
