package cn.hisense.service.impl;

import cn.hisense.dao.AdminDao;
import cn.hisense.pojo.Admin;
import cn.hisense.pojo.Page;
import cn.hisense.pojo.User;
import cn.hisense.service.AdminService;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class AdminServiceImpl implements AdminService {
    private final AdminDao adminDao = new AdminDao();

    /**
     * 通过姓名和密码进行登录
     *
     * @param admin
     * @return
     */
    @Override
    public Admin findAdmin(Admin admin) {
        try {
            return adminDao.findAdmin(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 修改个人信息
     *
     * @param admin
     * @return
     */
    @Override
    public int modifyAdmin(Admin admin) {
        try {
            return adminDao.modifyAdmin(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    @Override
    public int addAdmin(Admin admin) {
        admin.setAid(MyBeanUtils.uuid());
        admin.setAstate(1);
        admin.setArole(0);
        try {
            return adminDao.addAdmin(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 分页条件查询所有后台管理员
     *
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    @Override
    public Page<Admin> findAdminByPage(String currentPage, String rows, Map<String, String[]> condition) {
        return null;
    }

    /**
     * 查询所有前台用户
     *
     * @return
     */
    @Override
    public List<User> findUserAll() {
        try {
            return adminDao.findUserAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Admin> findAdminAll() {
        try {
            return adminDao.findAdminAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过用户ID修改用户状态
     *
     * @param state
     * @param id
     * @return
     */
    @Override
    public int modifyAdminState(int state, String id) {
        try {
            return adminDao.modifyAdminState(state, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过ID修改用户账户状态
     *
     * @param state
     * @param id
     * @return
     */
    @Override
    public int modifyUserState(int state, String id) {
        try {
            return adminDao.modifyUserState(state, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * 批量修改用户状态
     *
     * @param uState
     * @param ids
     * @return
     */
    @Override
    public int[] updUserState(int uState, String[] ids) {
        try {
            return adminDao.updUserState(uState, ids);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new int[0];
    }

    /**
     * 通过手机号和用户名进行查询
     *
     * @param condition
     * @return
     */
    @Override
    public List<Admin> findAdminByNameAndPhone(Map<String, String[]> condition) {
        try {
            return adminDao.findAdminByNameAndPhone(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过名称和手机号查询
     *
     * @param name
     * @param phone
     * @return
     */
    @Override
    public Admin findAdminByNameAndPhone(String name, String phone) {
        try {
            return adminDao.findAdminByNameAndPhone(name, phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
