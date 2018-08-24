package jeff.service;

import jeff.entity.ApplicationEntity;
import jeff.entity.SubmitApplicationEntity;
import jeff.entity.TimetableEntity;
import jeff.vo.ApplicationVo;

import java.util.Date;
import java.util.List;

public interface ApplicationService {
    /**
     * get all the applications of a time period
     *
     */
    List<ApplicationVo> getApplications(Date beginTime, Date endTime);

    /**
     * create a new application
     *
     */
    void create(SubmitApplicationEntity newApplication);

    /**
     * accept a application
     *
     */
    void accept(String applicationId, String comment);

    /**
     * reject a application
     *
     */
    void reject(String applicationId, String comment);

    /**
     * get application timetable
     *
     */
    TimetableEntity ApplicationsTimetable(String staffId, Date beginDate, Date endDate);

    /**
     * get applications of a staff
     *
     */
    List<ApplicationEntity> getStaffApplications(String staffId, Date beginTime, Date endTime);

}
