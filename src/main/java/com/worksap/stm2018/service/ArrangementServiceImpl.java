package com.worksap.stm2018.service;

import com.worksap.stm2018.util.TimeUtil;
import com.worksap.stm2018.dao.ArrangementDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.StaffDao;
import com.worksap.stm2018.entity.ArrangementTableEntity;
import com.worksap.stm2018.entity.StaffEntity;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.vo.ArrangementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class ArrangementServiceImpl implements ArrangementService {
    private ArrangementDao arrangementDao;
    private StaffDao staffDao;

    @Autowired
    public ArrangementServiceImpl(DaoFactory daoFactory) {
        this.staffDao = daoFactory.getStaffDao();
        this.arrangementDao = daoFactory.getArrangementDao();
    }

    @Override
    public List<ArrangementTableEntity> list(Date beginDate, Date endDate) {
        List<ArrangementTableEntity> arrangements = new ArrayList<>();

        Date beginWorkTime = TimeUtil.AddHours(beginDate, 8);
        Date endWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
        for(int i = 0; i < 14; i++) {
            ArrangementTableEntity arrangement = new ArrangementTableEntity();

            List<ArrangementVo> arrangementVos = arrangementDao.list(
                    new Timestamp(beginWorkTime.getTime()),
                    new Timestamp(endWorkTime.getTime()));
            List<StaffEntity> content = new ArrayList<>();
            for(ArrangementVo arrangementVo : arrangementVos) {
                StaffEntity staff = staffDao.getStaff(arrangementVo.getStaffId());
                content.add(staff);
            }
            arrangement.setContent(content);
            arrangements.add(arrangement);

            if(i%2 == 0) {
                beginWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
                endWorkTime = TimeUtil.AddHours(endWorkTime, 8);
            } else {
                beginWorkTime = TimeUtil.AddHours(beginWorkTime, 16);
                endWorkTime = TimeUtil.AddHours(endWorkTime, 16);
            }
        }
        return arrangements;
    }

    @Override
    public void update(List<String> staffs, Timestamp beginTime, Timestamp endTime) {
        arrangementDao.delete(beginTime, endTime);
        arrangementDao.put(staffs.stream()
                .map(n -> new ArrangementVo.Builder()
                        .staffId(n)
                        .staffName(staffDao.getStaffName(n))
                        .beginTime(beginTime)
                        .endTime(endTime).build()).collect(Collectors.toList()));
    }

    @Override
    public void publish(Date beginTime, Date endTime) {
        arrangementDao.publishArrangements(
                new Timestamp(beginTime.getTime()),
                new Timestamp(endTime.getTime()));
    }

    @Override
    public void revoke(Date beginTime, Date endTime) {
        arrangementDao.revokeArrangements(
                new Timestamp(beginTime.getTime()),
                new Timestamp(endTime.getTime()));
    }

    @Override
    public TimetableEntity getStaffArrangement(String staffId, Date beginDate, Date endDate) {
        List<String> days = new ArrayList<>();
        TimeUtil.tableDays(days, beginDate);

        List<String> times = new ArrayList<>();
        String staffPlace = staffDao.getStaffPlace(staffId);
        TimeUtil.tableTimes("Staff", staffPlace, times);

        TimetableEntity timetable = new TimetableEntity();
        timetable.setDays(days);
        timetable.setTimes(times);

        String staffName = staffDao.getStaffName(staffId);
        List<String> content = new ArrayList<>();
        int workTimeOfPlace = TimeUtil.getWorkTime(staffPlace);

        Date beginWorkTime = TimeUtil.AddHours(beginDate, workTimeOfPlace);
        Date endWorkTime = TimeUtil.AddHours(beginWorkTime, 8);
        for(int i = 0; i < 14; i++) {
            List<ArrangementVo> arrangementVos = arrangementDao.findStaffPublish(
                    staffId,
                    new Timestamp(beginWorkTime.getTime()),
                    new Timestamp(endWorkTime.getTime()));
            if(!arrangementVos.isEmpty()) {
                content.add(staffName);
            } else {
                content.add("");
            }
            beginWorkTime = (i%2 == 0)? TimeUtil.AddHours(beginWorkTime, 8) :
                    TimeUtil.AddHours(beginWorkTime, 16);
            endWorkTime = (i%2 == 0)? TimeUtil.AddHours(endWorkTime, 8) :
                    TimeUtil.AddHours(endWorkTime, 16);
        }
        timetable.setContent(content);
        return timetable;
    }

    @Override
    public String checkPublish(String week) {
        return arrangementDao.checkPublish(week);
    }

}
