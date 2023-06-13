package cn.hisense.web.servlet.admin;

import cn.hisense.pojo.Categorytow;
import cn.hisense.service.CategoryService;
import cn.hisense.service.impl.CategoryServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.utils.UploadUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.Set;


@WebServlet("/upload2")
public class UploadServlet2 extends HttpServlet {
    private final CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> upload = UploadUtils.upload(req);
        Set<Map.Entry<String, String>> entries = upload.entrySet();
        for (Map.Entry<String, String> entry : entries) {
            String key = entry.getKey();
            String value = entry.getValue();
            System.out.println(key + ":" + value);
        }
        Categorytow categorytow = MyBeanUtils.toBean(upload, Categorytow.class);
        int i = categoryService.addCategoryTow(categorytow);
        if (i == 1) {
            System.out.println("增加成功！");
        } else {
            System.out.println("增加失败！");
        }
    }
}
