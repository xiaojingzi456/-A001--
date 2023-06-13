package cn.hisense.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;


@SuppressWarnings("all")
public class JdbcUtils {
    public static DataSource ds;
    private static ThreadLocal<Connection> t;

    static {
        ds = new ComboPooledDataSource("helloC3p0");
        t = new ThreadLocal<>();
    }

    /**
     * 获取数据源
     *
     * @return DataSource
     */
    public static DataSource getDataSource() {
        return ds;
    }

    /**
     * 获取连接
     *
     * @return Connection
     */
    public static Connection getConnection() throws SQLException {
//       获取当前线程的事务连接
        Connection conn = t.get();
//        如果有事务则返回当前线程事务的连接，如果没有则返回普通连接
        if (conn != null) {
            return conn;
        }
        return ds.getConnection();
    }

    /**
     * 开启事务
     *
     * @throws SQLException
     */
    public static void startTransaction() throws SQLException {
        Connection conn = t.get();
        if (conn != null) {
            throw new SQLException("事务已开启，切勿重复开启！");
        }
//        为当前线程连接对象赋值，表示事务开启
        conn = ds.getConnection();
//        将事务自动提交设置为手动提交
        conn.setAutoCommit(false);
//        将当前事务连接放入线程连接t当中
        t.set(conn);
    }

    /**
     * 提交事务
     *
     * @throws SQLException
     */
    public static void commitTransaction() throws SQLException {
        Connection conn = t.get();
        if (conn == null) {
            throw new SQLException("事务未开启，无法提交！");
        }
//        提交事务
        conn.commit();
//        关闭连接
        conn.close();
//        关闭连接后为事务连接赋值为null，表示事务结束
        conn = null;
//        将线程移除
        t.remove();
    }

    /**
     * 事务回滚
     *
     * @throws SQLException
     */
    public static void rollBackTheTransaction() throws SQLException {
        Connection conn = t.get();
        if (conn == null) {
            throw new SQLException("没有事务，无法回滚！");
        }
//        事务异常时回滚
        conn.rollback();
        conn.close();
        conn = null;
        t.remove();
    }

    /**
     * 关闭资源
     *
     * @param connection
     * @throws SQLException
     */
    public static void closeConnection(Connection connection) throws SQLException {
        Connection conn = t.get();
//        如果参数连接，与当前事务连接不同，说明这个连接不是当前事务，则可以关闭！
        if (connection != conn) {
//            如果参数连接没有关闭，则关闭
            if (connection != null && connection.isClosed()) {
                connection.close();
            }
        }
    }
}
