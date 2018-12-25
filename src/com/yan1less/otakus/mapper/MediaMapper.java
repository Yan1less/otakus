package com.yan1less.otakus.mapper;

import com.yan1less.otakus.pojo.media;
import com.yan1less.otakus.pojo.media_class;
import com.yan1less.otakus.pojo.picture;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MediaMapper {
    Integer AddPicture(media media);

    List<media> LoadUserPicByUser_id(String user_id);

    Integer EditPicInfo(@Param("pic_id") String pic_id,
                        @Param("pic_class") String pic_class,
                        @Param("pic_name") String pic_name);

    String getPicRealName(String pic_id);

    Integer DeleteRowByID(String pic_id);

    Integer UpDateUserPic(@Param("user_id") String user_id,
                          @Param("pic") String pic);

    String SearchPicByPicID(String pic_id);

    //后台用户上传图片
    Integer SearchIsPicHave(String pic_id);
    String SearchIsClassRight(String pic_id);
    List<String> LoadAllClasses();
    String SearchClassIDbyClass(String pic_class);
    String getSrcByID(String pic_id);
    Integer UploadMedia(picture picture);


    //主页面
    List<media_class> getMediaClass();

    List<picture> getPicsByClass(String pic_class);



}
