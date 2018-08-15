package com.worksap.stm2018.service;

import com.worksap.stm2018.vo.ArrangementVo;

import java.sql.Timestamp;
import java.util.List;

public interface ArrangementService {
    /**
     * List the arrangements of a time period
     *
     */
    List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime);

    /**
     * update the arrangements of a time period
     *
     */
    List<ArrangementVo> update(List<ArrangementVo> newRecords, Timestamp beginTime, Timestamp endTime);

    /**
     * publish the arrangements of a time period
     *
     */
    void publish(Timestamp beginTime, Timestamp endTime);

    /**
     * publish the arrangements of a time period
     *
     */
    List<ArrangementVo> getStaffArrangement(String staffId, Timestamp beginTime, Timestamp endTime);
}
