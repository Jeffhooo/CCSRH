package com.worksap.stm2018.dao;

import com.worksap.stm2018.vo.ApplicationVo;

import java.util.List;

public interface ApplicationDao {
    /**
     * List all the applications
     *
     */
    List<ApplicationVo> list();

    /**
     * find the application
     *
     * @param applicantId
     */
    ApplicationVo find(String applicantId);
}
