package cn.hisense.dao;

import cn.hisense.pojo.Admin;
import cn.hisense.pojo.User;
import cn.hisense.utils.MyQueryRunner;
import cn.hisense.utils.SqlUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class AdminDao {
    private final QueryRunner qr = new MyQueryRunner();

    /**
     * 通过姓名和密码进行登录
     *
     * @param admin
     * @return
     * @throws SQLException
     */
    public Admin findAdmin(Admin admin) throws SQLException {
        String sql = "select * from t_admin where aname=? and apwd=?";
        return qr.query(sql, new BeanHandler<Admin>(Admin.class), admin.getAname(), admin.getApwd());
    }

    /**
     * 修改个人信息
     *
     * @param admin
     * @return
     * @throws SQLException
     */
    public int modifyAdmin(Admin admin) throws SQLException {
        String sql = "update t_admin set aname=?,apwd=?,asex=?,aintroduce=?,atelephone=? where aid=?";
        return qr.update(sql, admin.getAname(), admin.getApwd(), admin.getAsex(), admin.getAintroduce(), admin.getAtelephone(), admin.getAid());
    }

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     * @throws SQLException
     */
    public int addAdmin(Admin admin) throws SQLException {
        String sql = "insert into t_admin values(?,?,?,?,?,?,?,?)";
        return qr.update(sql, admin.getAid(), admin.getAname(), admin.getApwd(), admin.getAstate(), admin.getAsex(), admin.getAintroduce(), admin.getArole(), admin.getAtelephone());
    }


    /**
     * 查询所有前台用户
     *
     * @return
     * @throws SQLException
     */
    public List<User> findUserAll() throws SQLException {
        String sql = "select * from t_user";
        return qr.query(sql, new BeanListHandler<User>(User.class));
    }


    /**
     * 查询所有管理员
     *
     * @return
     * @throws Exception
     */
    public List<Admin> findAdminAll() throws Exception {
        String sql = "select * from t_admin";
        return qr.query(sql, new BeanListHandler<>(Admin.class));
    }


    /**
     * 通过ID修改管理员账户状态
     *
     * @param state
     * @param id
     * @return
     * @throws SQLException
     */
    public int modifyAdminState(int state, String id) throws SQLException {
        String sql = "update t_admin set astate=? where aid=?";
        return qr.update(sql, state, id);
    }

    /**
     * 通过ID修改用户账户状态
     *
     * @param state
     * @param id
     * @return
     * @throws SQLException
     */
    public int modifyUserState(int state, String id) throws SQLException {
        String sql = "update t_user set ustate=? where uid=?";
        return qr.update(sql, state, id);
    }


    /**
     * 条件查询管理员
     *
     * @param condition
     * @return
     * @throws Exception
     */
    public List<Admin> findAdminByNameAndPhone(Map<String, String[]> condition) throws Exception {
        String orderBySql = "order by arole desc,astate desc";
        return SqlUtils.conditionFind(condition, new BeanListHandler<>(Admin.class), "t_admin", orderBySql);
    }

    /**
     * 通过ID批量修改用户状态修改
     *
     * @param ids
     * @return
     * @throws SQLException
     */
    public int[] updUserState(int uState, String[] ids) throws SQLException {
        String sql = "update t_user set ustate=" + uState + " where uid=?";
        Object[][] params = new Object[ids.length][];
        for (int i = 0; i < params.length; i++) {
            params[i] = new Object[]{ids[i]};
        }
        return qr.batch(sql, params);
    }

    /**
     * 通过名称和手机号查询
     *
     * @param name
     * @param phone
     * @return
     * @throws SQLException
     */
    public Admin findAdminByNameAndPhone(String name, String phone) throws SQLException {
        String sql = "select * from t_admin where aname=? or atelephone=?";
        return qr.query(sql, new BeanHandler<Admin>(Admin.class), name, phone);
    }
}
