package com.worksap.stm2018.vo;

import lombok.Getter;

import java.sql.Timestamp;

public class ApplicationVo {
    @Getter
    private final String applicationId;
    @Getter
    private final String applicantId;
    @Getter
    private final String applicantName;
    @Getter
    private final String applyReason;
    @Getter
    private final Timestamp beginTime;
    @Getter
    private final Timestamp endTime;
    @Getter
    private final String result;
    @Getter
    private final String comment;

    public static class Builder {
        private String applicationId;
        private String applicantId;
        private String applicantName;
        private String applyReason;
        private Timestamp beginTime;
        private Timestamp endTime;
        private String result;
        private String comment;

        public Builder applicationId(String applicationId) {
            this.applicationId = applicationId;
            return this;
        }

        public Builder applicantId(String applicantId) {
            this.applicantId = applicantId;
            return this;
        }

        public Builder applicantName(String applicantName) {
            this.applicantName = applicantName;
            return this;
        }

        public Builder applyReason(String applyReason) {
            this.applyReason = applyReason;
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

        public Builder result(String result) {
            this.result = result;
            return this;
        }

        public Builder comment(String comment) {
            this.comment = comment;
            return this;
        }

        public ApplicationVo build() {
            return new ApplicationVo(applicationId, applicantId, applicantName, applyReason,
                    beginTime, endTime, result, comment);
        }

    }

    private ApplicationVo(String applicationId, String applicantId, String applicantName, String applyReason,
                          Timestamp beginTime, Timestamp endTime,
                          String result, String comment) {
        this.applicationId = applicationId;
        this.applicantId = applicantId;
        this.applicantName = applicantName;
        this.applyReason = applyReason;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.result = result;
        this.comment = comment;
    }
}
