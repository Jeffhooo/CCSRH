package jeff.controller;

import jeff.util.TimeUtil;
import jeff.entity.*;
import jeff.service.ApplicationService;
import jeff.service.ArrangementService;
import jeff.service.ServiceFactory;
import jeff.service.WorkHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class StaffController {
    private WorkHistoryService workHistoryService;
    private ApplicationService applicationService;
    private ArrangementService arrangementService;

    @Autowired
    public StaffController(ServiceFactory serviceFactory) {
        this.workHistoryService = serviceFactory.getWorkHistoryService();
        this.applicationService = serviceFactory.getApplicationService();
        this.arrangementService = serviceFactory.getArrangementService();
    }

    @RequestMapping(value = "/applyHistory{userId}")
    ModelAndView applyHistory(@PathVariable String userId) {
        return new ModelAndView("apply", "userId", userId);
    }

    @RequestMapping(value = "/helpStaff{userId}")
    ModelAndView helpStaff(@PathVariable String userId) {
        return new ModelAndView("helpStaff", "userId", userId);
    }

    @RequestMapping(value = "/staffMain{userId}")
    ModelAndView staffMain(@PathVariable String userId) {
        return new ModelAndView("staff", "userId", userId);
    }

    @RequestMapping(value = "/loadStaffTimetable", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    TimetableEntity loadStaffTimetable(@RequestBody RequestTimetableEntity entity) {
        return workHistoryService.StaffWorkTimetable(entity.getTitle(), entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }

    @RequestMapping(value = "/loadApplicationTimetable", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    TimetableEntity loadApplicationTimetable(@RequestBody RequestTimetableEntity entity) {
        return applicationService.ApplicationsTimetable(entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }

    @RequestMapping(value = "/submitApplication", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity submitApplication(@RequestBody SubmitApplicationEntity entity) {
        applicationService.create(entity);
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/checkPublish", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity checkPublish(@RequestBody String week) {
        return new MessageEntity(arrangementService.checkPublish(week));
    }

    @RequestMapping(value = "/loadNextWeekArrangement", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    TimetableEntity loadNextWeekArrangement(@RequestBody RequestTimetableEntity entity) {
        if(entity.getTitle().equals("Manager")) {
            return arrangementService.getStaffArrangementForManager(
                    entity.getStaffId(),
                    TimeUtil.StringToDate(entity.getBeginTime()),
                    TimeUtil.StringToDate(entity.getEndTime()));
        } else {
            return arrangementService.getStaffArrangement(
                    entity.getStaffId(),
                    TimeUtil.StringToDate(entity.getBeginTime()),
                    TimeUtil.StringToDate(entity.getEndTime()));
        }
    }

    @RequestMapping(value = "/loadStaffApplications", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    List<ApplicationEntity> loadStaffApplications(@RequestBody RequestStaffApplicationEntity entity) {
        return applicationService.getStaffApplications(
                entity.getStaffId(),
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }
}
