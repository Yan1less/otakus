package com.yan1less.otakus.pojo;

import java.util.Date;

public class user_friend {
//    CREATE TABLE `user_friend`  (
//            `user_friend_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `friend_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `meet_time` datetime(0) NULL DEFAULT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`user_friend_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String user_friend_id;
    private String user_id;
    private String friend_id;
    private Date meet_time;
    private String extra;

    public String getUser_friend_id() {
        return user_friend_id;
    }

    public void setUser_friend_id(String user_friend_id) {
        this.user_friend_id = user_friend_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getFriend_id() {
        return friend_id;
    }

    public void setFriend_id(String friend_id) {
        this.friend_id = friend_id;
    }

    public Date getMeet_time() {
        return meet_time;
    }

    public void setMeet_time(Date meet_time) {
        this.meet_time = meet_time;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
