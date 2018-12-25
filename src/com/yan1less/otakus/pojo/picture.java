package com.yan1less.otakus.pojo;

public class picture {
    private String id;
    private String from_user;
    private String from_user_id;
    private String upload_date;
    private String src;
    private String pic_id;
    private String link_class_id;
    private String extra;


    @Override
    public String toString() {
        return "picture{" +
                "id='" + id + '\'' +
                ", from_user='" + from_user + '\'' +
                ", from_user_id='" + from_user_id + '\'' +
                ", upload_date='" + upload_date + '\'' +
                ", src='" + src + '\'' +
                ", pic_id='" + pic_id + '\'' +
                ", link_class_id='" + link_class_id + '\'' +
                ", extra='" + extra + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFrom_user() {
        return from_user;
    }

    public void setFrom_user(String from_user) {
        this.from_user = from_user;
    }

    public String getFrom_user_id() {
        return from_user_id;
    }

    public void setFrom_user_id(String from_user_id) {
        this.from_user_id = from_user_id;
    }

    public String getUpload_date() {
        return upload_date;
    }

    public void setUpload_date(String upload_date) {
        this.upload_date = upload_date;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getPic_id() {
        return pic_id;
    }

    public void setPic_id(String pic_id) {
        this.pic_id = pic_id;
    }

    public String getLink_class_id() {
        return link_class_id;
    }

    public void setLink_class_id(String link_class_id) {
        this.link_class_id = link_class_id;
    }

    public String getExtra() {
        return extra;
    }

    public void setExtra(String extra) {
        this.extra = extra;
    }
}
