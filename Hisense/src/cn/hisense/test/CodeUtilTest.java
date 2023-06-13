package cn.hisense.test;

import cn.hisense.utils.CodeUtils;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;


public class CodeUtilTest {
    @Test
    public void testCode() throws IOException {
        //创建文件输出流对象
        File file = new File("D://img/");
        if (file.exists()) {
            System.out.println(file.getName() + "夹已存在");
        } else {
            file.mkdirs();
        }
        OutputStream out = new FileOutputStream("D://img/" + System.currentTimeMillis() + ".jpg");
        Map<String, Object> map = CodeUtils.generateCodeAndPic();
        ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
        System.out.println("验证码的值为：" + map.get("code"));
    }
}
