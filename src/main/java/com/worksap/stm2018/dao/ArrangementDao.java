package com.worksap.stm2018.dao;

import com.worksap.stm2018.vo.ArrangementVo;

import java.sql.Timestamp;
import java.util.List;

public interface ArrangementDao {
    /**
     * List the arrangements of a time period
     *
     */
    List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime);

    /**
     * find the list of arrangement of a staff for a time period
     *
     */
    List<ArrangementVo> findStaffPublish(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * delete an arrangement
     *
     */
    void delete(Timestamp beginTime, Timestamp endTime);

    /**
     * put in an arrangement
     *
     */
    void put(List<ArrangementVo> newRecords);

    /**
     * publish arrangements of a time period
     *
     */
    void publishArrangements(Timestamp beginTime, Timestamp endTime);

    /**
     * generate new id
     *
     *
     */
    String generateNewId();

    String checkPublish(String week);
}