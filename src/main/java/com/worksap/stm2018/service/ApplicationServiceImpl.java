package com.worksap.stm2018.service;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.dao.ApplicationDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.StaffDao;
import com.worksap.stm2018.entity.ApplicationEntity;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class ApplicationServiceImpl implements ApplicationService {
    private final ApplicationDao applicationDao;
    private final StaffDao staffDao;

    @Autowired
    public ApplicationServiceImpl(DaoFactory daoFactory) {
        this.staffDao = daoFactory.getStaffDao();
        this.applicationDao = daoFactory.getApplicationDao();
    }

    @Override
    public List<ApplicationVo> getApplications(Date beginTime, Date endTime) {
        return applicationDao.list(new Timestamp(beginTime.getTime()), new Timestamp(endTime.getTime()));
    }

    @Override
    public void create(ApplicationEntity newApplication) {
        applicationDao.put(new ApplicationVo.Builder().applicantId(newApplication.getStaffId())
                                                             .applicantName(staffDao.getStaffName(newApplication.getStaffId()))
                                                             .applyReason(newApplication.getApplyReason())
                                                             .beginTime(TimeUtil.StringToTimestamp(newApplication.getBeginTime()))
                                                             .endTime(TimeUtil.StringToTimestamp(newApplication.getEndTime()))
                                                             .build());
    }

    @Override
    public void accept(String applicationId, String comment) {
        applicationDao.addResult(applicationId, "accept", comment);
    }

    @Override
    public void reject(String applicationId, String comment) {
        applicationDao.addResult(applicationId, "reject", comment);
    }

    @Override
    public List<ApplicationVo> getAcceptedApplications(Timestamp beginTime, Timestamp endTime) {
        return applicationDao.getAcceptedApplications(beginTime, endTime);
    }

    @Override
    public TimetableEntity ApplicationsTimetable(String staffId, Date beginDate, Date endDate) {
        List<String> days = new ArrayList<>();
        TimeUtil.tableDays(days, beginDate);

        List<String> times = new ArrayList<>();
        String staffPlace = staffDao.getStaffPlace(staffId);
        TimeUtil.tableTimes(staffPlace, times);

        TimetableEntity timetable = new TimetableEntity();
        timetable.setDays(days);
        timetable.setTimes(times);

        List<String> content = new ArrayList<>();
        int workTimeOfPlace = TimeUtil.getWorkTime(staffPlace);

        Date beginWorkTime = TimeUtil.AddHours(beginDate, workTimeOfPlace);
        Date endWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
        for(int i = 0; i < 14; i++) {
            List<ApplicationVo> applicationVos = applicationDao.list(
                    new Timestamp(beginWorkTime.getTime()),
                            new Timestamp(endWorkTime.getTime()));
            if(applicationVos.isEmpty()) {
                content.add("");
            } else {
                content.add(Integer.toString(applicationVos.size()));
            }
            if(i%2 == 0) {
                beginWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
                endWorkTime = TimeUtil.AddHours(endWorkTime, 8);
            } else {
                beginWorkTime = TimeUtil.AddHours(beginWorkTime, 16);
                endWorkTime = TimeUtil.AddHours(endWorkTime, 16);
            }
        }
        timetable.setContent(content);
        return timetable;
    }
}
