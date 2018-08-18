package com.worksap.stm2018.entity;

import lombok.Data;

@Data
public class MessageEntity {
    private String msg;

    public MessageEntity(String msg) {
        this.msg = msg;
    }
}
