package com.lms.pojo;

import lombok.Data;

@Data
public class Library {
    //房间号
    private String roomId;
    //阅览室大小
    private int roomSize;
    //现有人数
    private int remainingPeople;
}
