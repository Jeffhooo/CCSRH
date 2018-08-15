package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.ArrangementDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.vo.ArrangementVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Component
public class ArrangementServiceImpl implements ArrangementService {
    private ArrangementDao arrangementDao;

    @Autowired
    public ArrangementServiceImpl(DaoFactory daoFactory) {
        this.arrangementDao = daoFactory.getArrangementDao();
    }

    @Override
    public List<ArrangementVo> list(Timestamp beginTime, Timestamp endTime) {
        return arrangementDao.list(beginTime, endTime);
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
