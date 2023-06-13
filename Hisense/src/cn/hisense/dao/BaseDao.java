package cn.hisense.dao;

import cn.hisense.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;


@SuppressWarnings("all")
public class BaseDao<T> {

    private QueryRunner queryRunner = new QueryRunner();

    private Class<T>  clazz ;

    public BaseDao() {
        Type type = this.getClass().getGenericSuperclass();
        ParameterizedType p = (ParameterizedType)type;
        Type[] types = p.getActualTypeArguments();
        this.clazz = (Class<T>) types[0];
    }

    /**
     * 	查询,返回对应的T的实体类对象
     * @param sql
     * @param params
     * @return
     */
    public T getBean(String sql,Object...params) {

        T t = null;
        Connection con = null;
        try {
            con = JdbcUtils.getConnection();
            t = queryRunner.query(con, sql,new BeanHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                JdbcUtils.closeConnection(con);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return t;
    }

    /**
     * 返回对应T实体类对象的List集合
     * @param sql
     * @param params
     * @return
     */
    public List<T> getBeanList(String sql,Object...params) {
        Connection connection = null;
        List<T> list = null;
        try {

            connection = JdbcUtils.getConnection();
            list = queryRunner.query(connection, sql,new BeanListHandler<T>(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                JdbcUtils.closeConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }


    /**
     * 	查询返回一个List中为Map元素的集合
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> getMapList(String sql,Object...params) throws SQLException{
        Connection connection = JdbcUtils.getConnection();
        List<Map<String, Object>> list = null;
        try {
            
            list = queryRunner.query(connection, sql, new MapListHandler(), params);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            JdbcUtils.closeConnection(connection);
        }
        return list;
    }

    /**
     * 	查询返回Map集合
     * @param sql
     * @param params
     * @return
     * @throws SQLException
     */
    public Map<String, Object> getMap(String sql,Object...params) throws SQLException{
        Connection connection = JdbcUtils.getConnection();
        Map<String, Object> list = null;
        try {

            list = queryRunner.query(connection, sql, new MapHandler(), params);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            JdbcUtils.closeConnection(connection);
        }
        return list;
    }

    /**
     * 返回某一个字段的值，或返回数据表中有多少条记录
     * @param sql
     * @param params
     * @param <E>
     * @return
     */
    public <E> E getOneValue(String sql,Object...params)  {

        Connection connection = null;
        try {

            connection = JdbcUtils.getConnection();
            return (E) queryRunner.query(connection,sql,new ScalarHandler(),params);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                JdbcUtils.closeConnection(connection);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 	修改
     * @param sql
     * @param params
     * @return
     */
    public int update(String sql,Object...params){
        int count = 0;
        Connection conn = null;
        try {

            conn = JdbcUtils.getConnection();
            count = queryRunner.update(conn, sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                JdbcUtils.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return count;
    }

    /**
     * 批处理
     * @param sql
     * @param params
     */
    public  void  batchUpdate(String sql,Object [][] params){
        Connection connection = null;

        try {

            connection = JdbcUtils.getConnection();
            queryRunner.batch(connection,sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                JdbcUtils.closeConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}

