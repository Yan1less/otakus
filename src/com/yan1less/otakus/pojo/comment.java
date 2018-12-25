package com.yan1less.otakus.pojo;

import java.util.Date;

public class comment {
//    CREATE TABLE `comment`  (
//            `comment_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `from_information_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `from_user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `comment_time` datetime(0) NULL DEFAULT NULL,
//  `comment_details` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `praise` int(255) NULL DEFAULT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`comment_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String comment_id;
    private String from_information_id;
    private String from_user_id;
    private String from_informationname;
    private String from_username;
    private String comment_time;
    private String comment_details;
    private Integer praise;
    private Integer dislike;
    private Integer floor;
    private String extra;


    public String getFrom_informationname() {
        return from_informationname;
    }

    public void setFrom_informationname(String from_informationname) {
        this.from_informationname = from_informationname;
    }

    public Integer getDislike() {
        return dislike;
    }

    public void setDislike(Integer dislike) {
        this.dislike = dislike;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public String getFrom_username() {
        return from_username;
    }

    public void setFrom_username(String from_username) {
        this.from_username = from_username;
    }


    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getFrom_information_id() {
        return from_information_id;
    }

    public void setFrom_information_id(String from_information_id) {
        this.from_information_id = from_information_id;
    }

    public String getFrom_user_id() {
        return from_user_id;
    }

    public void setFrom_user_id(String from_user_id) {
        this.from_user_id = from_user_id;
    }

    public String getComment_time() {
        return comment_time;
    }

    public void setComment_time(String comment_time) {
        this.comment_time = comment_time;
    }

    public String getComment_details() {
        return comment_details;
    }

    public void setComment_details(String comment_details) {
        this.comment_details = comment_details;
    }

    public Integer getPraise() {
        return praise;
    }

    public void setPraise(Integer praise) {
        this.praise = praise;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
