package com.yan1less.otakus.pojo;

public class lolNews {
    private String title;
    private String content;
    private String time;
    private String picutre_urls;
    private String id;
    private String realContent;
    private String littlePicture;

    public String getTitle() {
        String temp = title.length()>=20?title.substring(0,20)+"...":title;
        return temp;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPicutre_urls() {
        return picutre_urls;
    }

    public void setPicutre_urls(String picutre_urls) {
        this.picutre_urls = picutre_urls;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRealContent() {
        return realContent;
    }

    public void setRealContent(String realContent) {
        this.realContent = realContent;
    }

    public String getLittlePicture() {
        return littlePicture;
    }

    public void setLittlePicture(String littlePicture) {
        this.littlePicture = littlePicture;
    }
}
