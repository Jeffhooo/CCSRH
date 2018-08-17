package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.StaffDto;
import com.worksap.stm2018.entity.StaffEntity;

import java.util.List;

public interface StaffDao {
    /**
     * List all the staffs
     *
     */
    List<StaffDto> list();

    StaffEntity getStaff(String staffId);

    String getStaffPlace(String staffId);

    String getStaffName(String staffId);
}
