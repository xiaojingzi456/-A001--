package cn.hisense.service;

import cn.hisense.pojo.User;


public interface UserService {
    /**
     * 通过姓名密码查询用户
     *
     * @param uphone
     * @param password
     * @return
     */
    public User getUser(String uphone, String password);

    /**
     * 通过手机号查询是否存在
     *
     * @param phone
     * @return
     */
    public String findUserByPhone(String phone);

    /**
     * 注册会员用户
     *
     * @param user
     * @return
     */
    public int insertUser(User user);
}
