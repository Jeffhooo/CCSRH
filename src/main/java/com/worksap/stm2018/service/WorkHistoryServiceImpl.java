package com.worksap.stm2018.service;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.StaffDao;
import com.worksap.stm2018.dao.WorkHistoryDao;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.WorkHistoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component
public class WorkHistoryServiceImpl implements WorkHistoryService {
    private WorkHistoryDao workHistoryDao;
    private StaffDao staffDao;

    @Autowired
    public WorkHistoryServiceImpl(DaoFactory daoFactory) {
        this.workHistoryDao = daoFactory.getWorkHistoryDao();
        this.staffDao = daoFactory.getStaffDao();
    }

    @Override
    public List<WorkHistoryVo> getWorkHistory(String staffId, Timestamp beginTime, Timestamp endTime) {
        return workHistoryDao.list(staffId, beginTime, endTime);
    }

    @Override
    public TimetableEntity StaffWorkTimetable(String staffId, Date beginDate, Date endDate) {

        List<String> days = new ArrayList<>();
        Date curDate = beginDate;
        for(int i = 0; i < 7; i++) {
            days.add(TimeUtil.DateToString(curDate));
            curDate = TimeUtil.AddOneDay(curDate);
        }

        List<String> times = new ArrayList<>();
        String staffPlace = staffDao.getStaffPlace(staffId);
        if(staffPlace.equals("Asia/Shanghai")) {
            times.add("8:00-16:00");
            times.add("16:00-23:00");
        } else {}

        TimetableEntity timetable = new TimetableEntity();
        timetable.setDays(days);
        timetable.setTimes(times);

        String staffName = staffDao.getStaffName(staffId);
        List<String> content = new ArrayList<>();
        int workTimeOfPlace;
        if(staffPlace.equals("Asia/Shanghai")) {
            workTimeOfPlace = 8;
        } else {
            workTimeOfPlace = 8;
        }

        Date beginWorkTime = TimeUtil.AddHours(beginDate, workTimeOfPlace);
        Date endWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
        for(int i = 0; i < 14; i++) {
            List<WorkHistoryVo> work = getWorkHistory(staffId,
                    new Timestamp(beginWorkTime.getTime()),
                    new Timestamp(endWorkTime.getTime()));
            if(!work.isEmpty()) {
                content.add(staffName);
            } else {
                content.add("");
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
