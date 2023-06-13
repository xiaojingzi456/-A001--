package cn.hisense.service.impl;

import cn.hisense.dao.CommodityDao;
import cn.hisense.dao.OrderDao;
import cn.hisense.pojo.Address;
import cn.hisense.pojo.Logistics;
import cn.hisense.pojo.Order;
import cn.hisense.pojo.Orderdetails;
import cn.hisense.service.OrderService;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.vo.Page;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class OrderServiceImpl implements OrderService {
    private final OrderDao orderDao = new OrderDao();
    private final CommodityDao commodityDao = new CommodityDao();

    @Override
    public void cash(List<Orderdetails> orderList) {
        //1.更新数据表中的库存和已售
        commodityDao.batchUpdateStockSale(orderList);
    }

    @Override
    public void createOrder(Order order) {

        orderDao.addOrder(order);
    }

    @Override
    public List<Order> getOrderListByuid(String uid) {

        return orderDao.getOrderByuid(uid);
    }

    @Override
    public int findOrderByStatus(String oid) {

        return orderDao.findOrderByStatus(oid);
    }

    @Override
    public void updateOrderStatus(String oid, int status) {

        orderDao.updateOrderByStatus(oid, status);
    }

    @Override
    public Order getOrderItem(String oid) {

        try {
            return orderDao.getOrder(oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Page<Order> getPage(Map<String, String[]> map, String uid) {

        try {
            return orderDao.getPage(map, uid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 条件查询所有订单
     *
     * @param condition
     * @return
     */
    @Override
    public List<Map<String, Object>> findOrderList(Map<String, String[]> condition) {
        try {
            return orderDao.findOrderList(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过ID修改订单状态
     *
     * @param state
     * @param id
     * @return
     */
    @Override
    public int updOrderById(int state, String id) {
        try {
            return orderDao.updOrderById(state, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过订单ID查询订单详情
     *
     * @param id
     * @return
     */
    @Override
    public List<Orderdetails> findOrderDetailsById(String id) {
        try {
            return orderDao.findOrderDetailsById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    /**
     * 通过订单ID三表联查（订单、订单详情、商品）
     *
     * @param id
     * @return
     */
    @Override
    public List<Map<String, Object>> findOrderAndOrderDetailsAndCommodity(String id) {
        try {
            return orderDao.findOrderAndOrderDetailsAndCommodity(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    /**
     * 通过地址ID查询地址表
     *
     * @param id
     * @return
     */
    @Override
    public Address findAddressById(String id) {
        try {
            return orderDao.findAddressById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    /**
     * 通过订单ID连表查询地址、订单
     *
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> findAddressAndOrderById(String id) {
        try {
            return orderDao.findAddressAndOrderById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    /**
     * 添加物流信息
     *
     * @param logistics
     * @return
     */
    @Override
    public int insLogistics(Logistics logistics) {
        logistics.setLid(MyBeanUtils.uuid());
        logistics.setLtime(new Timestamp(System.currentTimeMillis()));
        try {
            return orderDao.insLogistics(logistics);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    /**
     * 物流信息表
     *
     * @param condition
     * @return
     */
    @Override
    public List<Map<String, Object>> findLogistics(Map<String, String[]> condition) {
        try {
            return orderDao.findLogistics(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
