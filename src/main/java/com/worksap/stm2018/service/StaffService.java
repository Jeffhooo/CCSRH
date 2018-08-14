package com.worksap.stm2018.service;

import com.worksap.stm2018.vo.StaffVo;

import java.sql.Timestamp;
import java.util.List;

public interface StaffService {
    /**
     * get the list of available staff of a time period
     *
     */
    List<StaffVo> getAvailableStaffs(Timestamp beginTime, Timestamp endTime);
}
