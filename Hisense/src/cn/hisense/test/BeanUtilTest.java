package cn.hisense.test;

import cn.hisense.utils.MyBeanUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.junit.Test;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;


public class BeanUtilTest {
    @Test
    public void testFun() throws InvocationTargetException, IllegalAccessException {
        HashMap<String, String> map = new HashMap<>();
        map.put("uName","张三");
        map.put("uPwd","12345");
        map.put("uAge","12");
        People people = new People();
        BeanUtils.populate(people,map);
        System.out.println(people);
    }

    @Test
    public void testFun2(){
        HashMap<String, String> map = new HashMap<>();
        map.put("uName","张三");
        map.put("uPwd","12345");
        People people = MyBeanUtils.toBean(map, People.class);
        System.out.println(people);
    }
}
