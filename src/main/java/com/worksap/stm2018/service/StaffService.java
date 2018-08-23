package com.worksap.stm2018.service;

import com.worksap.stm2018.dto.StaffDto;
import com.worksap.stm2018.vo.StaffVo;

import java.sql.Timestamp;
import java.util.List;

public interface StaffService {
    /**
     * get the list of available staff of a time period
     *
     */
    List<StaffDto> getAvailableStaffs(Timestamp beginTime, Timestamp endTime);

    /**
     * get all staffs
     *
     */
    List<StaffDto> getAllStaffs();

    /**
     * put in a new staff
     *
     */
    void put(StaffVo newStaff);

    /**
     * delete staff by id
     *
     */
    void deleteById(String staffId);
}
