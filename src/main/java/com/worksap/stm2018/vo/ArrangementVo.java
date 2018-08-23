package com.worksap.stm2018.vo;

import lombok.Getter;

import java.sql.Timestamp;

@Getter
public final class ArrangementVo {
    private final String arrangementId;
    private final String staffId;
    private final String staffName;
    private final String place;
    private final Timestamp beginTime;
    private final Timestamp endTime;
    private final String status;

    public static class Builder {
        private String arrangementId;
        private String staffId;
        private String staffName;
        private String place;
        private Timestamp beginTime;
        private Timestamp endTime;
        private String status;

        public Builder arrangementId(String arrangementId) {
            this.arrangementId = arrangementId;
            return this;
        }

        public Builder staffId(String staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder staffName(String staffName) {
            this.staffName = staffName;
            return this;
        }

        public Builder place(String place) {
            this.place = place;
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

        public Builder status(String status) {
            this.status = status;
            return this;
        }

        public ArrangementVo build() {
            return new ArrangementVo(this);
        }
    }

    private ArrangementVo(Builder builder) {
        this.arrangementId = builder.arrangementId;
        this.staffId = builder.staffId;
        this.staffName = builder.staffName;
        this.place = builder.place;
        this.beginTime = builder.beginTime;
        this.endTime = builder.endTime;
        this.status = builder.status;
    }
}
