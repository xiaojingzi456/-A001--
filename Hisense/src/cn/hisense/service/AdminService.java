package cn.hisense.service;

import cn.hisense.pojo.Admin;
import cn.hisense.pojo.Page;
import cn.hisense.pojo.User;

import java.util.List;
import java.util.Map;


public interface AdminService {
    /**
     * 查询管理员
     *
     * @param admin
     * @return
     */
    public Admin findAdmin(Admin admin);

    /**
     * 修改个人信息
     *
     * @param admin
     * @return
     */
    public int modifyAdmin(Admin admin);

    /**
     * 添加管理员
     *
     * @param admin
     * @return
     */
    public int addAdmin(Admin admin);

    /**
     * 分页条件查询所有后台管理员
     *
     * @return
     */
    public Page<Admin> findAdminByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 查询所有前台用户
     *
     * @return
     */
    public List<User> findUserAll();

    /**
     * 查询所有管理员用户
     *
     * @return
     */
    public List<Admin> findAdminAll();

    /**
     * 通过ID修改管理员账户状态
     *
     * @param state
     * @param id
     * @return
     */
    public int modifyAdminState(int state, String id);

    /**
     * 通过ID修改用户账户状态
     *
     * @param state
     * @param id
     * @return
     */
    public int modifyUserState(int state, String id);

    /**
     * 批量修改用户状态
     *
     * @param uState
     * @param ids
     * @return
     */
    public int[] updUserState(int uState, String[] ids);

    /**
     * 通过手机号和用户名进行查询
     *
     * @param condition
     * @return
     */
    public List<Admin> findAdminByNameAndPhone(Map<String, String[]> condition);

    /**
     * 通过名称和手机号查询
     *
     * @param name
     * @param phone
     * @return
     */
    public Admin findAdminByNameAndPhone(String name, String phone);
}
