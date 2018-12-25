package com.yan1less.otakus.controller;

import com.yan1less.otakus.pojo.media;
import com.yan1less.otakus.pojo.media_class;
import com.yan1less.otakus.pojo.picture;
import com.yan1less.otakus.pojo.user;
import com.yan1less.otakus.service.MediaService;
import com.yan1less.otakus.utils.FileCopyer;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class MediaController {


    //要改变LinuxSrc的地方有三处
    @Autowired
    private MediaService mediaService;


    @Value("${LinuxPath}")
    private String LinuxPath;
    //主页面
    @RequestMapping("MediaBase")
    public String ToMediaBase(HttpServletRequest request){
         List<media_class> mediaClass  = mediaService.getMediaClass();
        System.out.println("LinuxPpath = "+LinuxPath);
         request.setAttribute("mediaClass",mediaClass);
        return "/WEB-INF/front/page/pic_class";
    }

    @RequestMapping("Pictures")
    public String ToPicMain(HttpServletRequest request,String pic_class){
        List<picture> pictrues = mediaService.getPicsByClass(pic_class);
        request.setAttribute("pic_class_name",pic_class);

        request.setAttribute("pictrues",pictrues);

        return "/WEB-INF/front/page/pic_main";
    }






    //用户页面
    //设置为头像
    @ResponseBody
    @RequestMapping("SetToHead")
    public void SetToHead(HttpServletRequest request,HttpServletResponse response,String pic_id) throws IOException {
        user user = (user)request.getSession().getAttribute("user");
        Boolean succeed = mediaService.UpDateUserPic(user.getUser_id(),pic_id);
        if(succeed)
            response.getWriter().write("{\"succeed\":\"1\"}");
        else
            response.getWriter().write("{\"succeed\":\"0\"}");
    }

    @RequestMapping("DeletePic")
    public String DeletePic(HttpServletRequest request,String pic_id){

        //这里逻辑是先删除两个文件中的内容（有一个是当前工程下的，不是发布war包中，以后可以删除），再删除数据库中的内容
        String realname = mediaService.getPicRealName(pic_id);
        String currentPath = "D:\\IDEAProgram\\OTAKUS\\web\\pics\\"+realname;
        String LinuxcurrentPath = "/root/otakusProject/OTAKUS/web/pics";
        String path = request.getSession().getServletContext().getRealPath("/pics/"+realname);
        File currentFile = new File(currentPath+realname);

        File file = new File(path);
        if(currentFile.exists() && currentFile.isFile()
                && file.exists() && file.isFile()){
            Boolean suc = currentFile.delete();
            Boolean suc2 = file.delete();
            //数据库也要删除该条记录
            Boolean succeed = mediaService.DeleteRowByID(pic_id);
            if(succeed)
                return "/WEB-INF/back/ToPic";
        }
        return "/WEB-INF/back/error";
    }
    @ResponseBody
    @RequestMapping("EditPicInfo")
    public void EditPicInfo(HttpServletResponse response,String pic_id,String pic_class,String pic_name) throws IOException {

        Boolean succeed = mediaService.EditPicInfo(pic_id,pic_class,pic_name);
        if(succeed)
            response.getWriter().write("{\"succeed\":\"1\"}");
        else
            response.getWriter().write("{\"succeed\":\"0\"}");
    }

    @RequestMapping("UserMedia")
    public String ToUserMedia(HttpServletRequest request){
        user user = (user)request.getSession().getAttribute("user");

        List<media> medias = mediaService.LoadUserPicByUser_id(user.getUser_id());
        request.setAttribute("medias",medias);
        return "/WEB-INF/back/pic";
    }

    @RequestMapping("AddPic")
    public String AddPic(HttpServletRequest request,
                         MultipartFile pictureFile,
                         String pic_class,
                         String pic_name) throws IOException {
        System.out.println(" 添加图片/toADDPIC");
        if(!pictureFile.isEmpty()) {
            String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
            if(ext.equals("jpg") ||ext.equals("png")){
                //当前的文件保存路径，以后会改
                String currentPath = "D:\\IDEAProgram\\OTAKUS\\web\\pics\\";
                String LinuxcurrentPath = "/root/otakusProject/OTAKUS/web/pics";
                String name = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(pictureFile.getOriginalFilename());
                //存储到当前pic下
                File windowsFile = new File(currentPath + name);


                pictureFile.transferTo(windowsFile);


                //存储到war包的pic下,路径：D:\IDEAProgram\OTAKUS\out\artifacts\OTAKUS_war_exploded\pic\
                String realPath = request.getSession().getServletContext().getRealPath("/pics/"+name);
                pictureFile.transferTo(new File(realPath));

                //存储到数据库中
                user user = (user)request.getSession().getAttribute("user");
                String SavePath = "/pics/"+name;
                Boolean succeed = mediaService.AddPicture(user.getUser_id(),SavePath,pic_name,pic_class);
                if(succeed) {

                    return "/WEB-INF/back/ToPic";
                }
                else
                    return "/WEB-INF/back/error";
            }
            else {
                System.out.println("不是图片文件:"+ext);
                return "/WEB-INF/back/error";
            }
        }
        else {
            System.out.println("未选中文件");
            return "/WEB-INF/back/error";
        }

    }
    @ResponseBody
    @RequestMapping("UploadMedia")
    public void UploadMedia(HttpServletRequest request,HttpServletResponse response,
                            String pic_id) throws IOException {
        //先根据id判断库中有没有，有的话拒绝上传，没有的话成功上传
        Boolean IsPictureHave = mediaService.SearchIsPicHave(pic_id);
        if(IsPictureHave){
            //存在该图片
            response.getWriter().write("{\"succeed\":\"-1\"}");
            return;
        }
        else {
            Boolean IsClassRight = mediaService.SearchIsClassRight(pic_id);
            if(IsClassRight){
                //表明已经有该类型，可以上传
                user user = (user)request.getSession().getAttribute("user");
                Boolean succeed = mediaService.UploadMedia(user.getPetname(),user.getUser_id(),pic_id);
                if(succeed){
                    //在service层没办法获得当前路径，所以通过controller层来获得当前路径
                    //把用户的图片文件pic下相应需要上传的文件复制到页面的图片文件media下
                    String realname = mediaService.getPicRealName(pic_id);
                    String oldpath = request.getSession().getServletContext().getRealPath("/pics/"+realname);
                    String newpath = request.getSession().getServletContext().getRealPath("/media/"+realname);
                    FileCopyer.copyFolder(oldpath,newpath);
                    response.getWriter().write("{\"succeed\":\"1\"}");
                     return;
                }
                else {
                    response.getWriter().write("{\"succeed\":\"-2\"}");
                    return;
                }
            }else{
                //没有该类型，无法上传
                response.getWriter().write("{\"succeed\":\"0\"}");
                return;
            }
        }
        //再根据图片的分组信息找寻是否有对应分组


    }
}
