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

    /**
     * Get staff inform by id
     *
     */
    StaffEntity getStaff(String staffId);

    /**
     * Get staff place by id
     *
     */
    String getStaffPlace(String staffId);

    /**
     * Get staff name by id
     *
     */
    String getStaffName(String staffId);
}
