package com.worksap.stm2018.controller;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.entity.LoadStaffTimetableEntity;
import com.worksap.stm2018.entity.TimetableEntity;
import com.worksap.stm2018.service.ServiceFactory;
import com.worksap.stm2018.service.WorkHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class StaffController {
    private WorkHistoryService workHistoryService;

    @Autowired
    public StaffController(ServiceFactory serviceFactory) {
        this.workHistoryService = serviceFactory.getWorkHistoryService();
    }

    @RequestMapping(value = "/apply")
    ModelAndView apply() {
        return new ModelAndView("apply");
    }

    @RequestMapping(value = "/submitApplication")
    ModelAndView submitApplication() {
        return new ModelAndView("staff");
    }

    @RequestMapping(value = "/loadStaffTimetable", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody TimetableEntity loadStaffTimetable(@RequestBody LoadStaffTimetableEntity entity) {
        return workHistoryService.StaffWorkTimetable(entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }


}
