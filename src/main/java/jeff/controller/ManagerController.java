package jeff.controller;

import jeff.dto.CheckSettingsDto;
import jeff.service.*;
import jeff.util.TimeUtil;
import jeff.dto.StaffDto;
import jeff.entity.*;
import jeff.vo.ApplicationVo;
import jeff.vo.HolidayVo;
import jeff.vo.StaffVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ManagerController {
    private ApplicationService applicationService;
    private ArrangementService arrangementService;
    private StaffService staffService;
    private SettingsService settingsService;

    @Autowired
    public ManagerController(ServiceFactory serviceFactory) {
        this.applicationService = serviceFactory.getApplicationService();
        this.arrangementService = serviceFactory.getArrangementService();
        this.staffService = serviceFactory.getStaffService();
        this.settingsService = serviceFactory.getSettingsService();
    }

    @RequestMapping(value = "/approveApplication")
    ModelAndView approveApplication() {
        return new ModelAndView("approve");
    }

    @RequestMapping(value = "/managerSettings")
    ModelAndView managerSettings() {
        return new ModelAndView("managerSettings");
    }

    @RequestMapping(value = "/staffManagement")
    ModelAndView staffManagement() {
        return new ModelAndView("staffManagement");
    }

    @RequestMapping(value = "/helpManager")
    ModelAndView help() {
        return new ModelAndView("helpManager");
    }

    @RequestMapping(value = "/managerMain")
    ModelAndView managerMain() {
        return new ModelAndView("manager");
    }

    @RequestMapping(value = "/loadApplications", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    List<ApplicationEntity> loadApplications(@RequestBody TimeEntity entity) {
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
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/rejectApplication", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity rejectApplication(@RequestBody ApproveEntity entity) {
        applicationService.reject(entity.getApplicationId(), entity.getComment());
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/loadArrangement", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    List<ArrangementTableEntity> loadArrangement(@RequestBody TimeEntity entity) {
        return arrangementService.list(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }

    @RequestMapping(value = "/loadStaffs", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    List<StaffEntity> loadStaffs(@RequestBody TimeEntity entity) {
        List<StaffDto> staffDtos = staffService.getAvailableStaffs(
                TimeUtil.StringToTimestamp(entity.getBeginTime()),
                TimeUtil.StringToTimestamp(entity.getEndTime()));
        return staffDtos.stream()
                .map(n -> new StaffEntity(
                        n.getId(),
                        n.getName(),
                        n.getPlace(),
                        n.getLanguage1(),
                        n.getLanguage2()))
                .collect(Collectors.toList());
    }

    @RequestMapping(value = "/updateArrangement", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity updateArrangement(@RequestBody UpdateArrangementEntity entity) {
        arrangementService.update(entity.getStaffIds(),
                TimeUtil.StringToTimestamp(entity.getBeginTime()),
                TimeUtil.StringToTimestamp(entity.getEndTime()));
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity publish(@RequestBody TimeEntity entity) {
        arrangementService.publish(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/revoke", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity revoke(@RequestBody TimeEntity entity) {
        arrangementService.revoke(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/staffWorkHistory{staffId}")
    ModelAndView staffWorkHistory(@PathVariable String staffId) {
        return new ModelAndView("staffWorkHistory", "userId", staffId);
    }

    @RequestMapping(value = "/checkPublishStatus", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    PublishStatusEntity checkPublishStatus(@RequestBody TimeEntity entity) {
        return arrangementService.hasPublishArrangement(
                TimeUtil.StringToDate(entity.getBeginTime()),
                TimeUtil.StringToDate(entity.getEndTime()));
    }

    @RequestMapping(value = "/getCheckSettings", method = RequestMethod.GET)
    @ResponseBody
    CheckSettingsEntity getCheckSettings() {
        CheckSettingsDto checkSettingsDto = settingsService.getCheckSettings();
        return new CheckSettingsEntity(checkSettingsDto.getWorkDays(), Arrays.asList(checkSettingsDto.getServiceLanguages()));
    }

    @RequestMapping(value = "/updateCheckSettings", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity updateCheckSettings(@RequestBody CheckSettingsEntity entity) {
        List<String> languagesList = entity.getLanguages();
        String[] languagesArray = new String[languagesList.size()];
        for(int i = 0; i < languagesList.size(); i++) {
            languagesArray[i] = languagesList.get(i);
        }
        settingsService.updateCheckSettings(new CheckSettingsDto(entity.getWorkdays(), languagesArray));
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/getHolidaysSettings", method = RequestMethod.GET)
    @ResponseBody
    List<HolidayEntity> getHolidaysSettings() {
        return settingsService.getAllHolidays().stream().map(n -> new HolidayEntity(
                n.getId(),
                n.getName(),
                n.getPlace(),
                TimeUtil.timestampToString(n.getBeginTime()),
                TimeUtil.timestampToString(n.getEndTime())))
                .collect(Collectors.toList());
    }

    @RequestMapping(value = "/createNewHoliday", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity createNewHoliday(@RequestBody  HolidayEntity entity) {
        int timeOffset = 0;
        String place = entity.getPlace();
        if(place.equals("Asia/Tokyo") || place.equals("Asia/Seoul")) {
            timeOffset = -1;
        }
        settingsService.putNewHoliday(new HolidayVo.Builder()
                .name(entity.getName())
                .place(entity.getPlace())
                .beginTime(new Timestamp(
                        TimeUtil.AddHours(
                                TimeUtil.StringToDate(entity.getBeginTime()), timeOffset).getTime()))
                .endTime(new Timestamp(
                        TimeUtil.AddHours(
                                TimeUtil.StringToDate(entity.getEndTime()), timeOffset+24).getTime()))
                .build());
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/deleteHoliday", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity deleteHoliday(@RequestBody String holidayId) {
        settingsService.deleteHolidayById(holidayId);
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/deleteStaff", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity deleteStaff(@RequestBody String staffId) {
        staffService.deleteById(staffId);
        return new MessageEntity("ok");
    }

    @RequestMapping(value = "/getStaffs", method = RequestMethod.GET)
    @ResponseBody
    List<StaffEntity> getStaffs() {
        List<StaffEntity> staffEntities = staffService.getAllStaffs().stream().map(n -> new StaffEntity(
                n.getId(),
                n.getName(),
                n.getPlace(),
                n.getLanguage1(),
                n.getLanguage2()
        )).collect(Collectors.toList());
        return staffEntities;
    }

    @RequestMapping(value = "/createNewStaff", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    MessageEntity createNewStaff(@RequestBody StaffEntity entity) {
        staffService.put(new StaffVo.Builder()
                .name(entity.getName())
                .place(entity.getPlace())
                .language1(entity.getLanguage1())
                .language2(entity.getLanguage2())
                .build());
        return new MessageEntity("ok");
    }
}
