package cn.hisense.web.servlet.admin;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;


@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        //1.判断请求是否为multipart请求
        if (!ServletFileUpload.isMultipartContent(req)) {
//            throw new RuntimeException("当前请求不支持文件上传！");
            return;
        }
        //创建一个FileItem工厂
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //创建文件上传核心组件
        ServletFileUpload upload = new ServletFileUpload(factory);
        //解析请求，获取所有的item
        try {
            List<FileItem> items = upload.parseRequest(req);
            //遍历items
            for (FileItem item : items) {
                //如果item是普通表单
                if (item.isFormField()) {
                    //获取表单项名称
                    String fieldName = item.getFieldName();
                    //获取表单项的值
                    String fieldValue = item.getString();
                    System.out.println(fieldName + "=" + fieldValue);
                } else {//如果item是文件表单
                    //获取上传文件原始名称
                    String fieldName = item.getFieldName();
                    String fileName = item.getName();
                    System.out.println(fieldName + "=" + fileName);
                    //获取输入流，其中有上传的内容
                    InputStream is = item.getInputStream();
                    //获取文件保存在服务器的路径
                    String path = this.getServletContext().getRealPath("/static");
                    //创建目标文件，将来用于保存上传文件
                    File descFile = new File(path, fileName);
                    System.out.println(path + "=========" + fieldName);
                    //创建文件输出流
                    OutputStream os = new FileOutputStream(descFile);
                    //将输入流中的数据写入到输出流中
                    int len = -1;
                    byte[] bytes = new byte[1024];
                    while ((len = is.read(bytes)) != -1) {
                        os.write(bytes, 0, len);
                    }
                    //关闭流
                    os.close();
                    is.close();
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
