package com.worksap.stm2018.dao;

import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.WorkHistoryVo;

import java.sql.Timestamp;
import java.util.List;

public interface WorkHistoryDao {
    /**
     * List the work history of staff
     *
     */
    List<WorkHistoryVo> list(String staffId, Timestamp beginTime, Timestamp endTime);

}
