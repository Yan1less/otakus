package com.yan1less.otakus.service;

import com.yan1less.otakus.pojo.media;
import com.yan1less.otakus.pojo.media_class;
import com.yan1less.otakus.pojo.picture;

import java.util.List;

public interface MediaService {
    Boolean AddPicture(String userId, String path, String pic_name, String pic_class);

    List<media> LoadUserPicByUser_id(String user_id);
    //编辑图片信息
    Boolean EditPicInfo(String pic_id, String pic_class, String pic_name);
    //通过id找到库中对应的pic，再截取，返回存储的文件名
    String getPicRealName(String pic_id);
    //删除数据库中的信息
    Boolean DeleteRowByID(String pic_id);
    //更新用户表中的头像
    Boolean UpDateUserPic(String user_id, String pic_id);

    //后台上传图片
    Boolean SearchIsPicHave(String pic_id);

    Boolean SearchIsClassRight(String pic_id);

    Boolean UploadMedia(String petname, String user_id, String pic_id);



    //主页面
    List<media_class> getMediaClass();

    List<picture> getPicsByClass(String pic_class);



}
