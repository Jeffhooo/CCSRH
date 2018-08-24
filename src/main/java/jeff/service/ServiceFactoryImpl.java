package jeff.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ServiceFactoryImpl implements ServiceFactory {
    private final ArrangementService arrangementService;
    private final ApplicationService applicationService;
    private final LoginService loginService;
    private final StaffService staffService;
    private final WorkHistoryService workHistoryService;
    private final SettingsService settingsService;

    @Autowired
    public ServiceFactoryImpl(ApplicationService applicationService,
                              ArrangementService arrangementService,
                              LoginService loginService,
                              StaffService staffService,
                              WorkHistoryService workHistoryService,
                              SettingsService settingsService) {
        this.applicationService = applicationService;
        this.arrangementService = arrangementService;
        this.loginService = loginService;
        this.staffService = staffService;
        this.workHistoryService = workHistoryService;
        this.settingsService = settingsService;
    }

    @Override
    public ApplicationService getApplicationService() {
        return applicationService;
    }

    @Override
    public ArrangementService getArrangementService() {
        return arrangementService;
    }

    @Override
    public LoginService getLoginService() {
        return loginService;
    }

    @Override
    public StaffService getStaffService() {
        return staffService;
    }

    @Override
    public WorkHistoryService getWorkHistoryService() {
        return workHistoryService;
    }

    @Override
    public SettingsService getSettingsService() {
        return settingsService;
    }
}
