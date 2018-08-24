package jeff.dao;

import jeff.dto.HolidayDto;

import java.sql.Timestamp;
import java.util.List;

public interface HolidayDao {
    /**
     * Get holidays of a time period
     *
     */
     List<HolidayDto> getHolidays(Timestamp beginTime, Timestamp endTime);

    /**
     * Get all holidays
     *
     */
     List<HolidayDto> getAllHolidays();

    /**
     * Insert new holiday
     *
     */
     void insertNewHoliday(HolidayDto holidayDto);

    /**
     * Insert new holiday
     *
     */
    List<String> getHolidayIds();

    /**
     * Delete holiday by id
     *
     */
    void deleteById(String holidayId);
}
