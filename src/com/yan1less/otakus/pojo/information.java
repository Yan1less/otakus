package com.yan1less.otakus.pojo;

import java.util.Date;

public class information {
//    CREATE TABLE `information`  (
//            `information_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `from_user` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `create_time` datetime(0) NOT NULL,
//  `total_visited` int(10) NOT NULL,
//  `pics` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `is_hot` int(1) NOT NULL,
//  `is_vip` int(1) NOT NULL,
//    PRIMARY KEY (`information_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String information_id;
    private String name;
    private String from_user;
    private String from_username;
    private String main_information;
    private String create_time;
    private String total_commit;
    private String total_visited;
    private String pics;
    private Integer is_hot;
    private Integer is_vip;

    public String getFrom_username() {
        return from_username;
    }

    public void setFrom_username(String from_username) {
        this.from_username = from_username;
    }

    public String getMain_information() {
        return main_information;
    }

    public void setMain_information(String main_information) {
        this.main_information = main_information;
    }

    public String getTotal_commit() {
        return total_commit;
    }

    public void setTotal_commit(String total_commit) {
        this.total_commit = total_commit;
    }

    public String getInformation_id() {
        return information_id;
    }

    public void setInformation_id(String information_id) {
        this.information_id = information_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFrom_user() {
        return from_user;
    }

    public void setFrom_user(String from_user) {
        this.from_user = from_user;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getTotal_visited() {
        return total_visited;
    }

    public void setTotal_visited(String total_visited) {
        this.total_visited = total_visited;
    }

    public String getPics() {
        return pics;
    }

    public void setPics(String pics) {
        this.pics = pics;
    }

    public Integer getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(Integer is_hot) {
        this.is_hot = is_hot;
    }

    public Integer getIs_vip() {
        return is_vip;
    }

    public void setIs_vip(Integer is_vip) {
        this.is_vip = is_vip;
    }
}
