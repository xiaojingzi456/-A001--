package cn.hisense.test;

import cn.hisense.utils.JdbcUtils;
import cn.hisense.utils.MyQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import java.sql.SQLException;


public class TransactionTest {
    QueryRunner qr = new MyQueryRunner();

    public void transfer(double number, String name) throws SQLException {
        String sql = "update user_table set balance=balance-? where user=?";
        qr.update(sql, number, name);
    }


    @Test
    public void testTransaction() {
        try {
            JdbcUtils.startTransaction();
            transfer(100, "bb");
//           int number = 5 / 0;
            transfer(-100, "cc");
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            try {
                JdbcUtils.rollBackTheTransaction();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            throw new RuntimeException(e);
        }
    }
}
