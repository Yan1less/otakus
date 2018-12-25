package com.yan1less.otakus.pojo;

public class admin {
//    CREATE TABLE `admin`  (
//            `admin_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `admin_name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `admin_password` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`admin_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String admin_id;
    private String admin_name;
    private String admin_password;
    private String extra;

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
