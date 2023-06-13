package cn.hisense.dao;

import cn.hisense.pojo.User;
import cn.hisense.utils.MyQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao extends BaseDao<User> {
//    private final QueryRunner qr = new MyQueryRunner();

    public User getUser(String uphone, String password) {
        String sql = "select * from t_user where uphone = ? and upwd = ?";
        return getBean(sql, uphone, password);
    }

    public List<User> getUserAll() {
        String sql = "select * from t_user";
        return getBeanList(sql);
    }

    public User getUserByuid(String uid) {
        String sql = "select * from t_user where uid =?";
        return this.getBean(sql, uid);
    }

    /**
     * 通过手机号查询是否存在
     *
     * @param phone
     * @return
     */
    public String findUserByPhone(String phone){
        String sql = "select uphone from t_user where uphone=?";
        return getOneValue(sql, phone);
    }

    /**
     * 注册会员用户
     *
     * @param user
     * @return
     */
    public int insertUser(User user) {
        String sql = "insert into t_user(uid,uphone,upwd,ustate) values(?,?,?,?)";
        return update(sql, user.getUid(), user.getUphone(), user.getUpwd(), user.getUstate());
    }

    /**
     * 修改信息
     */
    public int xiugaiinfo(String name,String shouji,String youx){
        String sql = "update t_user set uname=?,uemail=? where uphone=?";
        return update(sql, name, youx, shouji);
    }

    /**
     * 修改密码
     */
    public int xiumima(String shouji,String mimaer){
        String sql = "update t_user set upwd=? where uphone=?";
        return update(sql,mimaer,shouji);
    }

}
