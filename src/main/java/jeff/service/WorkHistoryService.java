package jeff.service;

import jeff.entity.TimetableEntity;
import jeff.vo.WorkHistoryVo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface WorkHistoryService {
    /**
     * get the work history of a staff
     *
     * @param staffId
     * @param beginTime
     * @param endTime
     */
    List<WorkHistoryVo> getWorkHistory(String staffId, Timestamp beginTime, Timestamp endTime);

    /**
     * get the work work timetable of a staff
     *
     */
    TimetableEntity StaffWorkTimetable(String title, String staffId, Date beginDate, Date endDate);

}
