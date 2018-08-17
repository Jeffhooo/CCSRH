package com.worksap.stm2018.service;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.dao.ArrangementDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.StaffDao;
import com.worksap.stm2018.dto.StaffDto;
import com.worksap.stm2018.entity.ArrangementTableEntity;
import com.worksap.stm2018.entity.StaffEntity;
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
    public List<ArrangementVo> update(List<ArrangementVo> newRecords, Timestamp beginTime, Timestamp endTime) {
        arrangementDao.delete(beginTime, endTime);
        List<ArrangementVo> returnRecord = new ArrayList<>();
        for(ArrangementVo newRecord : newRecords) {
            returnRecord.add(arrangementDao.put(newRecord));
        }
        return returnRecord;
    }

    @Override
    public void publish(Timestamp beginTime, Timestamp endTime) {
        arrangementDao.publishArrangements(beginTime, endTime);
    }

    @Override
    public List<ArrangementVo> getStaffArrangement(String staffId, Timestamp beginTime, Timestamp endTime) {
        return arrangementDao.findStaffPublish(staffId, beginTime, endTime);
    }
}
