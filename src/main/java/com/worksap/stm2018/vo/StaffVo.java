package com.worksap.stm2018.vo;

import lombok.Getter;

@Getter
public class StaffVo {
    private final String id;
    private final String name;
    private final String place;
    private final String language;

    public static class Builder {
        private String id;
        private String name;
        private String place;
        private String language;

        public Builder id(String id) {
            this.id = id;
            return this;
        }

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder place(String place) {
            this.place = place;
            return this;
        }

        public Builder language(String language) {
            this.language = language;
            return this;
        }

        public StaffVo build() {
            return new StaffVo(this);
        }
    }

    private StaffVo(Builder builder) {
        this.id = builder.id;
        this.name = builder.name;
        this.place = builder.place;
        this.language = builder.language;
    }
}
