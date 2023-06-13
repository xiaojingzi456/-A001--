package cn.hisense.service;

import cn.hisense.pojo.Address;
import cn.hisense.pojo.Logistics;
import cn.hisense.pojo.Order;
import cn.hisense.pojo.Orderdetails;
import cn.hisense.vo.Page;

import java.util.List;
import java.util.Map;


public interface OrderService {

    void createOrder(Order order);

    List<Order> getOrderListByuid(String uid);

    int findOrderByStatus(String oid);

    void updateOrderStatus(String oid, int status);

    Order getOrderItem(String oid);

    Page<Order> getPage(Map<String, String[]> map, String uid);

    void cash(List<Orderdetails> cartList);

    /**
     * 条件查询所有订单
     *
     * @param condition
     * @return
     */
    public List<Map<String, Object>> findOrderList(Map<String, String[]> condition);

    /**
     * 通过ID修改订单状态
     *
     * @param state
     * @param id
     * @return
     */
    public int updOrderById(int state, String id);

    /**
     * 通过订单ID查询订单详情
     *
     * @param id
     * @return
     */
    public List<Orderdetails> findOrderDetailsById(String id);

    /**
     * 通过订单ID三表联查（订单、订单详情、商品）
     *
     * @param id
     * @return
     */
    public List<Map<String, Object>> findOrderAndOrderDetailsAndCommodity(String id);

    /**
     * 通过地址ID查询地址表
     *
     * @param id
     * @return
     */
    public Address findAddressById(String id);

    /**
     * 通过订单ID连表查询地址、订单
     *
     * @param id
     * @return
     */
    public Map<String, Object> findAddressAndOrderById(String id);

    /**
     * 添加物流信息
     *
     * @param logistics
     * @return
     */
    public int insLogistics(Logistics logistics);

    /**
     * 物流信息表
     *
     * @param condition
     * @return
     */
    public List<Map<String, Object>> findLogistics(Map<String, String[]> condition);
}
