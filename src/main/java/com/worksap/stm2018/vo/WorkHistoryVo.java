package com.worksap.stm2018.vo;

import lombok.Getter;

import java.sql.Time;
import java.sql.Timestamp;

public class WorkHistoryVo {
    @Getter
    private final String staffId;
    @Getter
    private final String staffName;
    @Getter
    private final Timestamp beginTime;
    @Getter
    private final Timestamp endTime;

    public static class Builder {
        private String staffId;
        private String staffName;
        private Timestamp beginTime;
        private Timestamp endTime;

        public Builder staffId(String staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder staffName(String staffName) {
            this.staffName = staffName;
            return this;
        }

        public Builder beginTime(Timestamp beginTime) {
            this.beginTime = beginTime;
            return this;
        }

        public Builder endTime(Timestamp endTime) {
            this.endTime = endTime;
            return this;
        }

        public WorkHistoryVo build() {
            return new WorkHistoryVo(staffId, staffName, beginTime, endTime);
        }
    }

    private WorkHistoryVo(String staffId, String staffName, Timestamp beginTime, Timestamp endTime) {
        this.staffId = staffId;
        this.staffName = staffName;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }
}
