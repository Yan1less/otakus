package com.yan1less.otakus.service;

import com.yan1less.otakus.mapper.MediaMapper;
import com.yan1less.otakus.mapper.UserMapper;
import com.yan1less.otakus.pojo.media;
import com.yan1less.otakus.pojo.media_class;
import com.yan1less.otakus.pojo.picture;
import com.yan1less.otakus.utils.FileCopyer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class MediaServiceImpl implements MediaService {
    @Autowired
    private MediaMapper mediaMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public Boolean AddPicture(String user_id, String savePath,String pic_name,String pic_class) {
        String id = UUID.randomUUID().toString();
        media media = new media();

        media.setMedia_id(id);
        media.setFrom_user_id(user_id);
        media.setPic(savePath);
        media.setPic_name(pic_name);
        media.setPic_class(pic_class);
        media.setIs_used(0);
        media.setExtra("无");
        Integer succeed = mediaMapper.AddPicture(media);
        if(succeed!=0)
            return true;
        else
            return false;
    }

    @Override
    public List<media> LoadUserPicByUser_id(String user_id) {

        return mediaMapper.LoadUserPicByUser_id(user_id);
    }

    @Override
    public Boolean EditPicInfo(String pic_id, String pic_class, String pic_name) {
        Integer succeed = mediaMapper.EditPicInfo(pic_id,pic_class,pic_name);
        if(succeed!=0)
            return true;
        else
            return false;
    }

    @Override
    public String getPicRealName(String pic_id) {
        String pic = mediaMapper.getPicRealName(pic_id);

        //因为存储的是/pics/...所以截取方式为
        String realName = pic.substring(6,pic.length());
        System.out.println("pic = "+pic + "    realName = " + realName);
        return realName;
    }

    @Override
    public Boolean DeleteRowByID(String pic_id) {
        Integer succeed = mediaMapper.DeleteRowByID(pic_id);
        if(succeed!=0)
            return true;
        else
            return false;
    }

    @Override
    public Boolean UpDateUserPic(String user_id, String pic_id) {
        //通过pic_id找到pic，然后把这个pic写入user表中
        String pic = mediaMapper.SearchPicByPicID(pic_id);
        Integer succeed = mediaMapper.UpDateUserPic(user_id,pic);
        if(succeed!=0)
            return true;
        else
            return false;
    }





    //主页面

    @Override
    public List<media_class> getMediaClass() {
        return mediaMapper.getMediaClass();
    }

    @Override
    public List<picture> getPicsByClass(String pic_class) {
        return mediaMapper.getPicsByClass(pic_class);
    }






    @Override
    public Boolean SearchIsPicHave(String pic_id) {
        Integer ishave = mediaMapper.SearchIsPicHave(pic_id);
        System.out.println("ishave = "+ishave);
        if(ishave==0)
            return false;
        else
            return true;
    }

    @Override
    public Boolean SearchIsClassRight(String pic_id) {
        Boolean IsHaven = false;
        //获取图片的类型
        String pic_class = mediaMapper.SearchIsClassRight(pic_id);
        //获取已有的类型
        List<String> classes = mediaMapper.LoadAllClasses();
        for(String temp : classes){
            if(temp.equals(pic_class))
                IsHaven = true;
        }
        return IsHaven;
    }

    @Override
    public Boolean UploadMedia(String petname, String user_id, String pic_id) {
        picture picture = new picture();

        //设置id
        picture.setId(UUID.randomUUID().toString());
        //设置用户名，用户id
        picture.setFrom_user(userMapper.SelectPetnameByID(user_id));
        picture.setFrom_user_id(user_id);
        //设置上传时间
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String upload_date = df.format(date);
        picture.setUpload_date(upload_date);
        //设置src
        //1.先把media表中pic路径取出来，吧前缀/pics/去掉
        String fullname = mediaMapper.getSrcByID(pic_id);
        String realname  = fullname.substring(6,fullname.length());
        picture.setSrc(realname);
        //2.再把图片复制到media下
        String windowsOldPath = "D:\\IDEAProgram\\OTAKUS\\web\\pics\\"+realname;
        String windowsnNewPath = "D:\\IDEAProgram\\OTAKUS\\web\\media\\"+realname;
        String linuxOldPath = "/root/otakusProject/OTAKUS/web/pics/"+realname;
        String linuxNewPath = "/root/otakusProject/OTAKUS/web/media/"+realname;

        try {
            FileCopyer.copyFolder(windowsOldPath,windowsnNewPath);
        } catch (IOException e) {

            e.printStackTrace();
        }


        //设置pic_id
        picture.setPic_id(pic_id);
        picture.setExtra(null);
        //获取图片的类型
        String pic_class = mediaMapper.SearchIsClassRight(pic_id);
        //在通过class找到class_id
        String link_class_id = mediaMapper.SearchClassIDbyClass(pic_class);
        picture.setLink_class_id(link_class_id);
        //设置完毕

        Integer suceed = mediaMapper.UploadMedia(picture);
        if(suceed!=0)
            return true;
        else
            return false;




    }
}
