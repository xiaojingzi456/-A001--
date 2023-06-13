package cn.hisense.service.impl;

import cn.hisense.dao.UserDao;
import cn.hisense.pojo.User;
import cn.hisense.service.UserService;
import cn.hisense.utils.MyBeanUtils;

public class UserServiceImpl implements UserService {
    private final UserDao userDao = new UserDao();

    /**
     * 通过姓名密码查询用户
     *
     * @param uphone
     * @param password
     * @return
     */
    @Override
    public User getUser(String uphone, String password) {
        return userDao.getUser(uphone, password);
    }

    /**
     * 通过手机号查询是否存在
     *
     * @param phone
     * @return
     */
    @Override
    public String findUserByPhone(String phone) {
        return userDao.findUserByPhone(phone);
    }

    /**
     * 注册会员用户
     *
     * @param user
     * @return
     */
    @Override
    public int insertUser(User user) {
        user.setUid(MyBeanUtils.uuid());
        user.setUstate(1);
        return userDao.insertUser(user);
    }
}
