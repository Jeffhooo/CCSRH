package com.worksap.stm2018.service;

public interface ServiceFactory {
    ApplicationService getApplicationService();
    ArrangementService getArrangementService();
    LoginService getLoginService();
    StaffService getStaffService();
    WorkHistoryService getWorkHistoryService();
    SettingsService getSettingsService();
}
