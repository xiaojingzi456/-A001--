package cn.hisense.utils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.Connection;
import java.sql.SQLException;


public class MyQueryRunner extends QueryRunner {
    @Override
    public int[] batch(String sql, Object[][] params) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        int[] result = super.batch(conn, sql, params);
        JdbcUtils.closeConnection(conn);
        return result;
    }

    @Override
    public <T> T query(String sql, ResultSetHandler<T> rsh, Object... params) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        T result = super.query(conn, sql, rsh, params);
        JdbcUtils.closeConnection(conn);
        return result;
    }

    @Override
    public <T> T query(String sql, ResultSetHandler<T> rsh) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        T result = super.query(conn, sql, rsh);
        JdbcUtils.closeConnection(conn);
        return result;
    }

    @Override
    public int update(String sql) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        int result = super.update(conn, sql);
        JdbcUtils.closeConnection(conn);
        return result;
    }

    @Override
    public int update(String sql, Object param) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        int result = super.update(conn, sql, param);
        JdbcUtils.closeConnection(conn);
        return result;
    }

    @Override
    public int update(String sql, Object... params) throws SQLException {
        Connection conn = JdbcUtils.getConnection();
        int result = super.update(conn, sql, params);
        JdbcUtils.closeConnection(conn);
        return result;
    }

}
