package cn.hisense.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.util.Map;
import java.util.UUID;


@SuppressWarnings("all")
public class MyBeanUtils {
    /**
     * 生成不重复的32位大写字符串
     *
     * @return String
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "").toUpperCase();
    }

    public static <T> T toBean(Map map, Class<T> clazz) {
        try {
//            创建指定类型的javaBean对象
            T bean = clazz.newInstance();
            ConvertUtils.register(new DateConverter(), java.util.Date.class);
//            将数据封装到javaBean中
            BeanUtils.populate(bean, map);
//            返回javaBean对象
            return bean;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
