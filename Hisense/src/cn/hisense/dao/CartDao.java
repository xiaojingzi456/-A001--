package cn.hisense.dao;

import cn.hisense.pojo.Cart;
import cn.hisense.pojo.Commodity;
import cn.hisense.pojo.User;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;



public class CartDao extends BaseDao<Cart> {


    /**
     * 把map映射成一个Cart对象
     * @param map
     * @return
     */
    private Cart toCart(Map<String,Object> map){

        if (map== null || map.size() ==0){
            return null;
        }
        Cart cart = MyBeanUtils.toBean(map, Cart.class);
        Commodity commodity = MyBeanUtils.toBean(map, Commodity.class);
        User user = MyBeanUtils.toBean(map, User.class);
        cart.setUser(user);
        cart.setCommodity(commodity);
        return cart;
    }


    /**
     * 把多个Map映射成一个ListCart的对象
     * @param mapsList
     * @return
     */
    private List<Cart> toCartList(List<Map<String,Object>> mapsList){

        List<Cart> cartList = new ArrayList<>();
        for (Map<String, Object> map : mapsList) {
            Cart cart = toCart(map);
            cartList.add(cart);
        }
        return cartList;
    }

    /**
     * 查询购物车所有商品相关信息
     * @param uid
     * @return
     * @throws SQLException
     */
    public List<Cart> findByUser(String uid) throws SQLException {

        String sql = "select * from t_cart ca,t_commodity co,t_user u where ca.coid=co.coid and"
                +" u.uid=ca.uid and ca.uid = ?";
        List<Map<String, Object>> mapList = this.getMapList(sql, uid);

        return toCartList(mapList);
    }

    /**
     * 查询商品是否存在
     * @param uid
     * @param coid
     * @return
     * @throws SQLException
     */
    public Cart findByUserAndCoid(String uid, String coid) throws SQLException {

        String sql = "select * from t_cart where uid=? and coid=?";
        Map<String, Object> map = this.getMap(sql, uid, coid);
        Cart cart = toCart(map);
        return cart;
    }

    /**
     * 添加到购物车
     * @param cart
     */
    public void addCart(Cart cart) {

        String sql = "insert into t_cart values(?,?,?,?)";

        this.update(sql,cart.getCaid(),cart.getCommodity().getCoid(),cart.getUser().getUid(),
                cart.getCanumber());
    }

    //生成where字句
    private String toWhereSql(int len){

        StringBuilder stb = new StringBuilder("caid in(");

        for (int i = 0; i < len; i++) {
            //append拼接
            stb.append("?");//占位符？
            if (i < len -1){//最后一个占位符没有,
                stb.append(",");
            }
        }
        stb.append(")");

        return stb.toString();

    }

    /**
     * 删除购物车
     * @param caids
     */
    public void batchDeleteCart(String caids){

        Object[] caidArray = caids.split(",");//将id转换成数组
        String whereSql = toWhereSql(caidArray.length);
        String sql = "delete from t_cart where "+ whereSql;
        this.update(sql,caidArray);

    }

    /**
     * 根据购物车查询图书
     * @param caid
     * @return
     * @throws SQLException
     */
    public Cart findByCaId(String caid) throws SQLException {

        String sql = "select * from t_cart ca,t_commodity co where co.coid = ca.coid and caid = ?";
        Map<String, Object> map = this.getMap(sql, caid);

        return toCart(map);

    }

    /**
     * 修改购物车数量
     * @param caid
     * @param quantity
     */
    public void updateCartQuantity(String caid,int quantity){

        String sql = "update t_cart set canumber=? where caid =?";
        this.update(sql,quantity,caid);
    }

    /**
     * 查询选择的购物项
     * @param caids
     * @return
     * @throws SQLException
     */
    public List<Cart> queryCartCheck(String caids) throws SQLException {

        Object[] caidArray = caids.split(",");
        String whereSql = toWhereSql(caidArray.length);
        String sql = "select * from t_cart ca,t_commodity co where co.coid=ca.coid and "+whereSql;

        return toCartList(this.getMapList(sql,caidArray));
    }

}
