package com.worksap.stm2018.service;

import com.worksap.stm2018.entity.ArrangementTableEntity;
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
     * publish the arrangements of a time period
     *
     */
    List<ArrangementVo> getStaffArrangement(String staffId, Timestamp beginTime, Timestamp endTime);

    String checkPublish(String week);

    TimetableEntity StaffNextWeekArrangement(String staffId, Date beginDate, Date endDate);
}
