package com.yan1less.otakus.utils;

import java.io.*;

public class FileCopyer {
    public static void copyFolder(String oldfilename,String newfilename) throws IOException {

        File of=new File(oldfilename);
        if(of.exists()) {
            try {
                InputStream is=new FileInputStream(of);
                FileOutputStream out=new FileOutputStream(newfilename);
                byte[] data=new byte[20480];
                int len=0;

                //长度如果是-1那么读取完毕，开始写入

                while((len=is.read(data))!=-1){
                    out.write(data,0,len);
                }
                //复制完毕，手动刷新缓冲区，关闭流，节省资源
                out.flush();
                is.close();
                out.close();
            } catch (FileNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                System.out.println("复制失败");
            }
        }
    }
}
