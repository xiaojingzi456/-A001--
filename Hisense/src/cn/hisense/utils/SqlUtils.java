package cn.hisense.utils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;


public class SqlUtils {
    private final static QueryRunner qr = new MyQueryRunner();

    /**
     * 条件查询
     *
     * @param condition  条件参数
     * @param table      数据库表
     * @param orderBySql 排序字段
     * @param <T>
     * @return
     * @throws Exception
     */
    public static <T> T conditionFind(Map<String, String[]> condition, ResultSetHandler<T> rsh, String table, String orderBySql) throws Exception {
        String sql = "select * from " + table + " where 1=1";
        StringBuilder builder = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {
            if ("method".equals(key)) {
                continue;
            }
            //获取value,在前台每个输入框输入条件只有一个值
            String value = condition.get(key)[0];
            //判断value是否有值
            if (value != null && !value.trim().isEmpty()) {
                //有值,注意sql语句单词之间加空隔（select count(*) from t_admin where 1=1 and
                builder.append(" and " + key + " like ?");
                //添加条件（？）的值
                params.add("%" + value + "%");
            }
        }
        if (!" ".equals(orderBySql) && orderBySql != null) {
            builder.append(" " + orderBySql);
        }
//        System.out.println("params.toString() = " + params.toString());
//        System.out.println("builder.toString() = " + builder.toString());
        return qr.query(builder.toString(), rsh, params.toArray());
    }

    /**
     * 通过ID进行批处理
     *
     * @param ids
     * @return
     * @throws SQLException
     */
    public static int[] myBatch(String sql, String[] ids) throws SQLException {
        Object[][] params = new Object[ids.length][];
        for (int i = 0; i < params.length; i++) {
            params[i] = new Object[]{ids[i]};
        }
        return qr.batch(sql, params);
    }
}
