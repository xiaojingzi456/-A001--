package cn.hisense.service;

import cn.hisense.pojo.Cart;

import java.util.List;

/**
 * 购物车业务处理接口
 * @author 王叔叔
 * @create 2022/8/1 9:26
 */
public interface CartService {

    List<Cart> getCart(String uid);

    Cart updateCart(String caid, int quantity);

    void delBatchCart(String ids);

    void addToCart(Cart cart);

    List<Cart> selectCheckCaid(String caids);
}
