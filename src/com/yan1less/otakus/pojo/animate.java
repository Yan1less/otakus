package com.yan1less.otakus.pojo;

public class animate {
    //ID
    private String animate_id;
    //连接
    private String link;
    //发布地区
    private String place;
    //图片
    private String img;
    //名字
    private String tittle;
    //发行时间
    private String date;
    //标签
    private String tag;
    //cv
    private String characterVoice;
    //发行社
    private String madeFrom;
    //看点
    private String watchPoint;
    //简介
    private String introduce;


    public String getAnimate_id() {
        return animate_id;
    }

    public void setAnimate_id(String animate_id) {
        this.animate_id = animate_id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getCharacterVoice() {
        return characterVoice;
    }

    public void setCharacterVoice(String characterVoice) {
        this.characterVoice = characterVoice;
    }

    public String getMadeFrom() {
        return madeFrom;
    }

    public void setMadeFrom(String madeFrom) {
        this.madeFrom = madeFrom;
    }

    public String getWatchPoint() {
        return watchPoint;
    }

    public void setWatchPoint(String watchPoint) {
        this.watchPoint = watchPoint;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }


    @Override
    public String toString() {
        return "animate{" +
                "animate_id='" + animate_id + '\'' +
                ", link='" + link + '\'' +
                ", place='" + place + '\'' +
                ", img='" + img + '\'' +
                ", tittle='" + tittle + '\'' +
                ", date='" + date + '\'' +
                ", tag='" + tag + '\'' +
                ", characterVoice='" + characterVoice + '\'' +
                ", madeFrom='" + madeFrom + '\'' +
                ", watchPoint='" + watchPoint + '\'' +
                ", introduce='" + introduce + '\'' +
                '}';
    }
}
