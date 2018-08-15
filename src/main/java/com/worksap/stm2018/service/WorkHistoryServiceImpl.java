package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.dao.WorkHistoryDao;
import com.worksap.stm2018.vo.WorkHistoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class WorkHistoryServiceImpl implements WorkHistoryService {
    private WorkHistoryDao workHistoryDao;

    @Autowired
    public WorkHistoryServiceImpl(DaoFactory daoFactory) {
        this.workHistoryDao = daoFactory.getWorkHistoryDao();
    }

    @Override
    public List<WorkHistoryVo> getWorkHistory(String staffId, Timestamp beginTime, Timestamp endTime) {
        return workHistoryDao.list(staffId, beginTime, endTime);
    }
}
