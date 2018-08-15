package com.worksap.stm2018.service;

import com.worksap.stm2018.dao.ApplicationDao;
import com.worksap.stm2018.dao.DaoFactory;
import com.worksap.stm2018.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;

@Component
public class ApplicationServiceImpl implements ApplicationService {
    private final ApplicationDao applicationDao;

    @Autowired
    public ApplicationServiceImpl(DaoFactory daoFactory) {
        this.applicationDao = daoFactory.getApplicationDao();
    }

    @Override
    public List<ApplicationVo> getApplications(Timestamp beginTime, Timestamp endTime) {
        return applicationDao.list(beginTime, endTime);
    }

    @Override
    public ApplicationVo create(ApplicationVo newRecord) {
        return applicationDao.put(newRecord);
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
}
