package com.yan1less.otakus.pojo;

public class admin_operation_history {
//    DROP TABLE IF EXISTS `admin_operation_history`;
//    CREATE TABLE `admin_operation_history`  (
//            `admin_oh_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `from_admin_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `operation_history` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `extra` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`admin_oh_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String admin_oh_id;
    private String from_admin_id;
    private String operation_history;
    private String extra;

    public String getAdmin_oh_id() {
        return admin_oh_id;
    }

    public void setAdmin_oh_id(String admin_oh_id) {
        this.admin_oh_id = admin_oh_id;
    }

    public String getFrom_admin_id() {
        return from_admin_id;
    }

    public void setFrom_admin_id(String from_admin_id) {
        this.from_admin_id = from_admin_id;
    }

    public String getOperation_history() {
        return operation_history;
    }

    public void setOperation_history(String operation_history) {
        this.operation_history = operation_history;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
