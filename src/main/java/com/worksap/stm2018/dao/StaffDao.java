package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.StaffDto;

import java.util.List;

public interface StaffDao {
    /**
     * List all the staffs
     *
     */
    List<StaffDto> list();
}
