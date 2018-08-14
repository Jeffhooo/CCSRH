package com.worksap.stm2018.dao;

import com.worksap.stm2018.dto.HolidaysDto;

import java.sql.Timestamp;
import java.util.List;

public interface HolidayDao {
    /**
     * Get Holidays of a time period
     *
     * @param beginTime
     * @param endTime
     */
     List<HolidaysDto> getHolidays(Timestamp beginTime, Timestamp endTime);
}
