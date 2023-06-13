package cn.hisense.utils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class UploadUtils {
    public static Map<String, String> upload(HttpServletRequest req) {
        //创建一个Map集合，存储存放所有的参数数据
        HashMap<String, String> hashMap = new HashMap<>();
        //创建上传文件工具对象
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建上传工具
        ServletFileUpload upload = new ServletFileUpload(factory);
        //处理上传文件中文乱码
        upload.setHeaderEncoding("UTF-8");
        //限制上传文件的大小20M
        upload.setFileSizeMax(1024 * 1024 * 20);
        //解析请求中的二进制数据返回一个list集合
        try {
            List<FileItem> list = upload.parseRequest(req);
            for (FileItem fileItem : list) {
                if (fileItem.isFormField()) {
                    //普通字段
                    hashMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
                } else {
                    //上传字段
                    //限制文件类型位需要的
                    String contentType = fileItem.getContentType();
                    if (!contentType.startsWith("image/")) {
                        throw new Exception("请选择图片上传！！！");
                    }
                    //获取到图片后缀名称(.png,.jpg...)
                    String exName = FilenameUtils.getExtension(fileItem.getName());
                    //获取UUID设置文件名
                    String realName = MyBeanUtils.uuid();
                    //图片命名
                    String imgPath = realName + "." + exName;
                    //图片保存路径
//                    String url = UploadUtils.readImgUrl();
                   // String url=req.getContextPath()+"/static/image/AdminNewImg/";
                    String url = req.getServletContext().getRealPath(File.separator+"/static/image/AdminNewImg/");
                    System.out.println(url + imgPath);
                    fileItem.write(new File(url + imgPath));
                    //执行DAO操作，将数据存储到数据库
                    hashMap.put(fileItem.getFieldName(), imgPath);

                }
            }
            Set<Map.Entry<String, String>> entries = hashMap.entrySet();
            for (Map.Entry<String, String> entry : entries) {
                String key = entry.getKey();
                String value = entry.getValue();
                System.out.println(key + ":" + value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hashMap;
    }

    public static String readImgUrl() {
        Properties properties = new Properties();
        InputStream is = UploadUtils.class.getClassLoader().getResourceAsStream("FileUpload.properties");
        try {
            properties.load(is);
            return properties.getProperty("categoryUrl");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
