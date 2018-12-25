package com.yan1less.otakus.pojo;

import java.util.Date;

public class friend_message {
//    CREATE TABLE `friend_message`  (
//            `friend_message_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `message_from_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `message_to_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `send_time` datetime(0) NULL DEFAULT NULL,
//  `send_message` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`friend_message_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String friend_message_id;
    private String message_from_id;
    private String message_to_id;
    private String send_time;
    private String send_message;
    private String extra;

    public String getFriend_message_id() {
        return friend_message_id;
    }

    public void setFriend_message_id(String friend_message_id) {
        this.friend_message_id = friend_message_id;
    }

    public String getMessage_from_id() {
        return message_from_id;
    }

    public void setMessage_from_id(String message_from_id) {
        this.message_from_id = message_from_id;
    }

    public String getMessage_to_id() {
        return message_to_id;
    }

    public void setMessage_to_id(String message_to_id) {
        this.message_to_id = message_to_id;
    }

    public String getSend_time() {
        return send_time;
    }

    public void setSend_time(String send_time) {
        this.send_time = send_time;
    }

    public String getSend_message() {
        return send_message;
    }

    public void setSend_message(String send_message) {
        this.send_message = send_message;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
