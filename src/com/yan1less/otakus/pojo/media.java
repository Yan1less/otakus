package com.yan1less.otakus.pojo;

public class media {
//    CREATE TABLE `media`  (
//            `media_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
//  `from_user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//  `pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
//    PRIMARY KEY (`media_id`) USING BTREE
//) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
    private String media_id;
    private String from_user_id;
    private String pic;
    private String pic_name;
    private String pic_class;
    private Integer is_used;
    private String extra;

    public String getMedia_id() {
        return media_id;
    }

    public void setMedia_id(String media_id) {
        this.media_id = media_id;
    }

    public String getFrom_user_id() {
        return from_user_id;
    }

    public void setFrom_user_id(String from_user_id) {
        this.from_user_id = from_user_id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPic_name() {
        return pic_name;
    }

    public void setPic_name(String pic_name) {
        this.pic_name = pic_name;
    }

    public String getPic_class() {
        return pic_class;
    }

    public void setPic_class(String pic_class) {
        this.pic_class = pic_class;
    }

    public Integer getIs_used() {
        return is_used;
    }

    public void setIs_used(Integer is_used) {
        this.is_used = is_used;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
