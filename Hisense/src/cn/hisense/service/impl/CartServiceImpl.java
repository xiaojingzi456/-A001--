package cn.hisense.service.impl;

import cn.hisense.dao.CartDao;
import cn.hisense.pojo.Cart;
import cn.hisense.service.CartService;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * 购物车业务处理层
 * @author 王叔叔
 * @create 2022/8/1 9:26
 */
public class CartServiceImpl implements CartService {


    CartDao cartDao = new CartDao();

    @Override
    public List<Cart> getCart(String uid) {

        try {
            return cartDao.findByUser(uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Cart updateCart(String caid, int quantity) {

        try {
            cartDao.updateCartQuantity(caid,quantity);
            return cartDao.findByCaId(caid);//修改后再查询
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delBatchCart(String caids) {
        cartDao.batchDeleteCart(caids);
    }

    @Override
    public void addToCart(Cart cart) {

        try {
            Cart cart1 = cartDao.findByUserAndCoid(cart.getUser().getUid(), cart.getCommodity().getCoid());
            System.out.println(cart1);

            if (cart1 == null){//购物车没有该项
                cart.setCaid(MyBeanUtils.uuid());
                cartDao.addCart(cart);
            }else {//有该条目,原有数量与新增数量之和
                int quantity = cart.getCanumber() + cart1.getCanumber();
                cartDao.updateCartQuantity(cart1.getCaid(),quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Cart> selectCheckCaid(String caids) {

        try {
            return cartDao.queryCartCheck(caids);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}

