package com.worksap.stm2018.service;

import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.WorkHistoryVo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface WorkHistoryService {
    /**
     * get the work history of a staff
     *
     * @param staffId
     * @param beginTime
     * @param endTime
     */
    List<WorkHistoryVo> getWorkHistory(String staffId, Timestamp beginTime, Timestamp endTime);

    TimetableEntity StaffWorkTimetable(String staffId, Date beginDate, Date endDate);
}
