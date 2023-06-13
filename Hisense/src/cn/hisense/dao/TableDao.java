package cn.hisense.dao;

import cn.hisense.pojo.Table;


public class TableDao extends BaseDao<Table> {


    public void transfer(double number, String name) {
        String sql = "update user_table set balance=balance-? where user=?";
        update(sql, number, name);
    }



}
