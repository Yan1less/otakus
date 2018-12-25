package com.yan1less.otakus.pojo;

import java.util.Date;

public class user_history {
//    CREATE TABLE `user_history`  (
//            `user_history_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `info_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `time` datetime(0) NULL DEFAULT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`user_history_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String user_history_id;
    private String user_id;
    private String info_id;
    private Date time;
    private String extra;

    public String getUser_history_id() {
        return user_history_id;
    }

    public void setUser_history_id(String user_history_id) {
        this.user_history_id = user_history_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getInfo_id() {
        return info_id;
    }

    public void setInfo_id(String info_id) {
        this.info_id = info_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
