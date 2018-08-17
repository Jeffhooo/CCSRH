package com.worksap.stm2018.controller;

import com.worksap.stm2018.Util.TimeUtil;
import com.worksap.stm2018.entity.*;
import com.worksap.stm2018.service.ApplicationService;
import com.worksap.stm2018.service.ArrangementService;
import com.worksap.stm2018.service.ServiceFactory;
import com.worksap.stm2018.vo.ApplicationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ManagerController {
    private ApplicationService applicationService;
    private ArrangementService arrangementService;

    @Autowired
    public ManagerController(ServiceFactory serviceFactory) {
        this.applicationService = serviceFactory.getApplicationService();
        this.arrangementService = serviceFactory.getArrangementService();
    }

    @RequestMapping(value = "/approveApplication")
    ModelAndView approveApplication() {
        return new ModelAndView("approve");
    }

    @RequestMapping(value = "/loadApplications", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    List<ApplicationEntity> loadApplications(@RequestBody LoadApplicationsEntity entity) {
        List<ApplicationVo> applications = applicationService.getApplications(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
        return applications.stream().map(n -> new ApplicationEntity(
                n.getApplicationId(),
                n.getApplicantId(),
                n.getApplicantName(),
                n.getApplyReason(),
                TimeUtil.timestampToString(n.getBeginTime()),
                TimeUtil.timestampToString(n.getEndTime()),
                n.getResult(),
                n.getComment())).collect(Collectors.toList());
    }

    @RequestMapping(value = "/acceptApplication", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity acceptApplication(@RequestBody ApproveEntity entity) {
        applicationService.accept(entity.getApplicationId(), entity.getComment());
        MessageEntity msg = new MessageEntity();
        msg.setMsg("Application is accepted.");
        return msg;
    }

    @RequestMapping(value = "/rejectApplication", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity rejectApplication(@RequestBody ApproveEntity entity) {
        applicationService.reject(entity.getApplicationId(), entity.getComment());
        MessageEntity msg = new MessageEntity();
        msg.setMsg("Application is rejected.");
        return msg;
    }

    @RequestMapping(value = "/loadArrangement", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody List<ArrangementTableEntity> loadArrangement(@RequestBody LoadArrangementEntity entity) {
        List<ArrangementTableEntity> arrangements = arrangementService.list(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
        return arrangements;
    }

}
