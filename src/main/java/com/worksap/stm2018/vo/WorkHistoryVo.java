package com.worksap.stm2018.vo;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class WorkHistoryVo {
    private final String staffId;
    private final String staffName;
    private final Timestamp beginTime;
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
            return new WorkHistoryVo(this);
        }
    }

    private WorkHistoryVo(Builder builder) {
        this.staffId = builder.staffId;
        this.staffName = builder.staffName;
        this.beginTime = builder.beginTime;
        this.endTime = builder.endTime;
    }
}
