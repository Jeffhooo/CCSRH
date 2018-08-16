package com.worksap.stm2018.controller;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.entity.LoadApplicationsEntity;
import com.worksap.stm2018.entity.RequestTimetableEntity;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.service.ApplicationService;
import com.worksap.stm2018.service.ServiceFactory;
import com.worksap.stm2018.service.WorkHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class StaffController {
    private WorkHistoryService workHistoryService;
    private ApplicationService applicationService;

    @Autowired
    public StaffController(ServiceFactory serviceFactory) {
        this.workHistoryService = serviceFactory.getWorkHistoryService();
        this.applicationService = serviceFactory.getApplicationService();
    }

    @RequestMapping(value = "/apply{userId}")
    ModelAndView apply(@PathVariable String userId) {
        return new ModelAndView("apply", "userId", userId);
    }

    @RequestMapping(value = "/submitApplication")
    ModelAndView submitApplication() {
        return new ModelAndView("staff");
    }

    @RequestMapping(value = "/loadStaffTimetable", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody TimetableEntity loadStaffTimetable(@RequestBody RequestTimetableEntity entity) {
        return workHistoryService.StaffWorkTimetable(entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }

    @RequestMapping(value = "/loadApplicationTimetable", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody TimetableEntity loadApplicationTimetable(@RequestBody RequestTimetableEntity entity) {
        return applicationService.ApplicationsTimetable(entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }
}
