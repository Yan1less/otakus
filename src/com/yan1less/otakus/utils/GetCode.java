package com.yan1less.otakus.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 获得页面代码
 */
public class GetCode {
    public static String GetPageCodeByUrl(String newUrl){

        try {

            URL url = new URL(newUrl);
            //建立连接
            HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
            //获取输入流
            BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"utf-8"));
            //获取信息
            StringBuffer content =new StringBuffer();
            //定义每次读取的信息
            String temp = null;
            while((temp = reader.readLine())!=null){
                content.append( temp + "\n");
            }

            return  content.toString();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }



    //链接url下载图片
    public static void downloadPicture(String urlList,String path) {
        System.out.println(urlList);
        URL url = null;
        try {
            url = new URL(urlList);
            DataInputStream dataInputStream = new DataInputStream(url.openStream());

            FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
            ByteArrayOutputStream output = new ByteArrayOutputStream();

            byte[] buffer = new byte[1024];
            int length;

            while ((length = dataInputStream.read(buffer)) > 0) {
                output.write(buffer, 0, length);
            }
            fileOutputStream.write(output.toByteArray());
            dataInputStream.close();
            fileOutputStream.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

