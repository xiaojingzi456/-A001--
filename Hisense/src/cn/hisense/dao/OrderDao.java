package cn.hisense.dao;

import cn.hisense.pojo.*;
import cn.hisense.utils.DateUtils;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.utils.MyQueryRunner;
import cn.hisense.utils.SqlUtils;
import cn.hisense.vo.CriteriaOrder;
import cn.hisense.vo.Page;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class OrderDao extends BaseDao<Order> {
    private final QueryRunner qr = new MyQueryRunner();


    /**
     * 把一个Map转换成一个OrderItem
     */
    private Orderdetails toOrderItem(Map<String, Object> map) {
        Orderdetails orderItem = MyBeanUtils.toBean(map, Orderdetails.class);
        Commodity commodity = MyBeanUtils.toBean(map, Commodity.class);
        orderItem.setCommodity(commodity);
        return orderItem;
    }

    /**
     * 把多个Map转换成多个OrderItem
     *
     * @param mapList
     * @return
     */
    private List<Orderdetails> toOrderItemList(List<Map<String, Object>> mapList) {
        List<Orderdetails> orderItemList = new ArrayList<Orderdetails>();
        for (Map<String, Object> map : mapList) {
            Orderdetails orderItem = toOrderItem(map);
            orderItemList.add(orderItem);
        }
        return orderItemList;
    }

    /**
     * 查询用户订单的所有信息,未分页x
     *
     * @param uid
     * @return
     */
    public List<Order> getOrderByuid(String uid) {

        String sql = "select * from t_order where uid =? ";
        List<Order> orderList = this.getBeanList(sql, uid);
        // 获取所有的订单，但每个订单中并没有订单条目
        // 遍历每个订单，为其加载它的所有订单条目
        for (Order order : orderList) {
            try {
                loadOrderItem(order);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return orderList;

    }

    /**
     * 为指定订单加载它所有的订单详情
     *
     * @param order
     * @throws SQLException
     */
    private void loadOrderItem(Order order) throws SQLException {

        String sql = "select * from t_orderdetails odd ,t_commodity co where odd.coid= co.coid and oid=? ";
        List<Map<String, Object>> mapList = getMapList(sql, order.getOid());

        //通过toOrderItemList得到订单条目信息
        List<Orderdetails> orderdetails = toOrderItemList(mapList);
        order.setOrderdetails(orderdetails);
    }

    //加载订单地址
    private void loadAddress(Order order) {
        Address address = new AddressDao().getAddressByoid(order.getAid());
        order.setAddress(address);
    }

    /**
     * 生成订单
     *
     * @param order
     */
    public void addOrder(Order order) {

        String sql = "insert into t_order values(?,?,?,?,?,?,?)";
        Object[] params = {order.getOid(), order.getUid(), order.getAid(),
                order.getOtime(), order.getOtatol(), order.getOstate(), order.getRemark()};
        this.update(sql, params);

        //循环遍历一个订单的所有条目,让每个条目生成一个Object[]数组
        //多个条目就对应Object[][],执行批处理，完成插入
        sql = "insert into t_orderdetails values(?,?,?,?,?,?)";
        int len = order.getOrderdetails().size();
        Object[][] objs = new Object[len][];
        for (int i = 0; i < len; i++) {
            Orderdetails item = order.getOrderdetails().get(i);
            objs[i] = new Object[]{item.getOtid(), item.getOrder().getOid(),
                    item.getCommodity().getCoid(), item.getOnumber(), item.getOprice(),
                    item.getOactual()};

        }
        this.batchUpdate(sql, objs);

    }

    /**
     * 查看订单详情
     *
     * @param oid
     * @return
     * @throws SQLException
     */
    public Order getOrder(String oid) throws SQLException {

        String sql = "select * from t_order where oid =?";
        Order order = this.getBean(sql, oid);
        //为当前订单加载它的订单项
        loadOrderItem(order);
        loadAddress(order);
        return order;
    }

    /**
     * 查询订单状态
     *
     * @param oid
     * @return
     */
    public int findOrderByStatus(String oid) {

        String sql = "select ostate from t_order where oid = ?";
        Number number = this.getOneValue(sql, oid);
        return number.intValue();
    }

    /**
     * 修改订单状态
     *
     * @param oid
     * @param status
     */
    public void updateOrderByStatus(String oid, int status) {

        String sql = "update t_order set ostate =? where oid =?";
        this.update(sql, status, oid);

    }


    /**
     * 获取订单page
     *
     * @param map
     * @return
     */
    public Page<Order> getPage(Map<String, String[]> map, String uid) throws SQLException {

        CriteriaOrder coder = MyBeanUtils.toBean(map, CriteriaOrder.class);

        Page page = new Page(coder.getPageNo());
        page.setPageSize(coder.getPageSize());
        page.setTotalItemNum(getTotalOrder(map, uid));
        page.setList(getPageList(map, uid));
        System.out.println("page = " + page);
        return page;
    }

    /**
     * limit分组,从0开始，如：(0,3) (3,3)
     *
     * @param map
     * @return
     */
    public List<Order> getPageList(Map<String, String[]> map, String uid) throws SQLException {

        CriteriaOrder coder = MyBeanUtils.toBean(map, CriteriaOrder.class);
        StringBuilder Wheresql = WhereSql(map);
        String sql = "select * from t_order where 1=1 " + Wheresql + " and uid =?" + " limit ?,?";

        System.out.println("sql分页 = " + sql);
        List params = getParams(coder, uid);

        List<Order> orderList;
        params.add((coder.getPageNo() - 1) * coder.getPageSize());
        params.add(coder.getPageSize());
        orderList = getBeanList(sql, params.toArray());

        //为指定订单加载所有订单项
        for (Order order : orderList) {
            loadOrderItem(order);
        }

        return orderList;
    }

    /**
     * 获取订单总数量
     *
     * @param map
     * @return
     */
    private long getTotalOrder(Map<String, String[]> map, String uid) {

        StringBuilder Wheresql = WhereSql(map);
        String sql = "select count(*) from t_order where 1=1 " + Wheresql + " and uid =?";
        System.out.println("sql查询 = " + sql);
        CriteriaOrder coder = MyBeanUtils.toBean(map, CriteriaOrder.class);
        List params = getParams(coder, uid);

//        System.out.println("paramsCount = " + params.toString());
        return getOneValue(sql, params.toArray());

    }

    /**
     * 动态条件占位符填充
     *
     * @param coder
     * @return
     */
    public List getParams(CriteriaOrder coder, String uid) {

        System.out.println("cccc" + coder);
        List<Object> params = new ArrayList<>();
        if (coder.getOid() != null && !coder.getOid().trim().isEmpty()) {
            params.add("%" + coder.getOid() + "%");
        }
        if (coder.getOrderStatus() != null && coder.getOrderStatus() != 0) {
            params.add(coder.getOrderStatus());
        }
        if (coder.getOrderTime() != null && !coder.getOrderTime().trim().isEmpty()) {
            if (coder.getOrderTime().equals("1")) {
//                params = Collections.singletonList(DateUtils.lastMonth(3));
                params.add(DateUtils.lastMonth(1));
            } else if (coder.getOrderTime().equals("3")) {
                params.add(DateUtils.lastMonth(3));
            } else if (coder.getOrderTime().equals("6")) {
                params.add(DateUtils.lastMonth(6));
            } else if (coder.getOrderTime().equals("12")) {
                params.add(DateUtils.lastMonth(12));
                //params.add(coder.getOrderTime());
            }
        }
        params.add(uid);

        System.out.println("params = " + params.toString());
        return params;
    }

    /**
     * 动态条件拼接sql语句
     *
     * @param map
     * @return
     */
    private StringBuilder WhereSql(Map<String, String[]> map) {

        StringBuilder stb = new StringBuilder("");

        for (Map.Entry<String, String[]> entry : map.entrySet()) {

            if ("oid".equals(entry.getKey()) && !entry.getValue()[0].trim().isEmpty()) {
                stb.append(" and " + entry.getKey() + " like ?");
            } else if ("orderStatus".equals(entry.getKey()) && !entry.getValue()[0].equals("0")) {
                stb.append(" and ostate =?");
            } else if ("orderTime".equals(entry.getKey()) && !entry.getValue()[0].isEmpty()) {
                stb.append(" and otime >=?");
            }

        }
        return stb;
    }


    /**
     * 条件查询所有订单
     *
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findOrderList(Map<String, String[]> condition) throws Exception {
        String table = " t_order inner join t_address ta on t_order.aid = ta.aid ";
        String orderBySql = " order by field(ostate,'7','4','6','5','3','2','1') ";
        return SqlUtils.conditionFind(condition, new MapListHandler(), table, orderBySql);
    }

    /**
     * 通过地址ID查询地址表
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public Address findAddressById(String id) throws SQLException {
        String sql = "select * from t_address where aid=?";
        return qr.query(sql, new BeanHandler<>(Address.class), id);
    }

    /**
     * 添加物流信息
     *
     * @param logistics
     * @return
     * @throws SQLException
     */
    public int insLogistics(Logistics logistics) throws SQLException {
        String sql = "insert into t_logistics values(?,?,?,?,?,?,?,?,?)";
        return qr.update(sql, logistics.getLid(), logistics.getOid(), logistics.getLdprovince(), logistics.getLdcity(), logistics.getLdarea(), logistics.getLdeliver(), logistics.getLphone(), logistics.getLtime(), logistics.getLexpress());
    }

    /**
     * 通过ID修改订单状态
     *
     * @param id
     * @return
     */
    public int updOrderById(int state, String id) throws SQLException {
        String sql = "update t_order set ostate=? where oid=?";
        return qr.update(sql, state, id);
    }

    /**
     * 通过订单ID连表查询地址、订单
     *
     * @param id
     * @return
     */
    public Map<String, Object> findAddressAndOrderById(String id) throws SQLException {
        String sql = "select * from t_order inner join t_address ta on t_order.aid = ta.aid where t_order.oid=?";
        return qr.query(sql, new MapHandler(), id);
    }

    /**
     * 通过ID查询订单详情
     *
     * @param id
     * @return
     */
    public List<Orderdetails> findOrderDetailsById(String id) throws SQLException {
        String sql = "select * from t_orderDetails where oid=?";
        return qr.query(sql, new BeanListHandler<>(Orderdetails.class), id);
    }


    /**
     * 通过订单ID四表联查（订单、订单详情、商品、地址）
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findOrderAndOrderDetailsAndCommodity(String id) throws SQLException {
        String sql = "select * from t_commodity inner join t_orderdetails t on t_commodity.coid = t.coid inner join t_order o on t.oid = o.oid inner join t_address ta on o.aid = ta.aid where t.oid=?";
        return qr.query(sql, new MapListHandler(), id);
    }


    /**
     * 物流信息表
     *
     * @param condition
     * @return
     * @throws Exception
     */
    public List<Map<String, Object>> findLogistics(Map<String, String[]> condition) throws Exception {
        String table = " t_logistics inner join t_order t on t_logistics.oid = t.oid inner join t_address ta on t.aid = ta.aid ";
        String orderBySql = " order by t_logistics.ltime desc";
        return SqlUtils.conditionFind(condition, new MapListHandler(), table, orderBySql);
    }
}
