package cn.hisense.dao;

import cn.hisense.pojo.Commodity;
import cn.hisense.pojo.Commoditydetail;
import cn.hisense.pojo.Commoditypicture;
import cn.hisense.pojo.Orderdetails;
import cn.hisense.utils.MyQueryRunner;
import cn.hisense.utils.SqlUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class CommodityDao extends BaseDao<Commodity> {
    private final QueryRunner qr = new MyQueryRunner();


    /**
     * 查看图书详情
     *
     * @param coid
     * @return
     */
    public Commodity getCommodity(String coid) {

        String sql = "select * from t_commodity co where co.cstate=1 and co.coid =?";

        Commodity com = this.getBean(sql, coid);
        List<Commoditypicture> comPicture = new CommPictureDao().getComPicture(coid);
        com.setCommoditypictures(comPicture);
        return com;
    }

    /**
     * 查询商品详情图片
     *
     * @param coid
     * @return
     */
    public Commodity getDetailIMG(String coid) {

        String sql = "select * from t_commodity co where co.cstate=1 and co.coid =?";

        Commodity com = this.getBean(sql, coid);
        //加载详情图片
        loadDetailsIMG(com);
        return com;
    }

    private void loadDetailsIMG(Commodity com) {

        List<Commoditydetail> comPicture = new CommoditydetailDao().getCommoditydetail(com.getCoid());
        com.setCommoditydetails(comPicture);
    }

    /**
     * 批量更新库存和已售
     *
     * @param orderList
     */
    public void batchUpdateStockSale(List<Orderdetails> orderList) {

        //对应的购物数量，售出加购买数量，库存-购买数量
        String sql = "update t_commodity set csold = csold + ?,snumber = snumber -? where coid = ?";
        Object[][] params = null;
        params = new Object[orderList.size()][3];//正好更新items.size()个对象，其他有3个变量
        ArrayList<Orderdetails> cits = new ArrayList<>(orderList);//转成可以用i下标获取的List集合
        for (int i = 0; i < orderList.size(); i++) {
            params[i][0] = cits.get(i).getOnumber();//已售+购买数量
            params[i][1] = cits.get(i).getOnumber();//库存-购买数量
            params[i][2] = cits.get(i).getCommodity().getCoid();
        }
        this.batchUpdate(sql, params);
    }


    /**
     * 查询所有商品并按商品上下架状态排序
     *
     * @return
     */
    public List<Commodity> findCommodityAll(Map<String, String[]> condition) throws Exception {
        String orderBySql = " order by cstate desc ";
        return SqlUtils.conditionFind(condition, new BeanListHandler<Commodity>(Commodity.class), "t_commodity", orderBySql);
    }

    /**
     * 通过ID修改商品上下架状态
     *
     * @param state
     * @param id
     * @return
     */
    public int updStateById(int state, String id) throws SQLException {
        String sql = "update t_commodity set cstate=? where coid=?";
        return qr.update(sql, state, id);
    }

    /**
     * 增加商品
     *
     * @param c
     * @return
     * @throws SQLException
     */
    public int addCommodity(Commodity c) throws SQLException {
        String sql = "insert into t_commodity values(?,?,?,?,?,?,?,?,?,?)";
        return qr.update(sql, c.getCoid(), c.getCtid(),  c.getComodel(), c.getConame(), c.getCopicture(), c.getCoprice(), c.getDisprice(), c.getCsold(), c.getSnumber(), c.getCstate());
    }

    /**
     * 通过商品名称查询
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public Commodity findCommodityByName(String name) throws SQLException {
        String sql = "select * from t_commodity where coname=?";
        return qr.query(sql, new BeanHandler<>(Commodity.class), name);
    }

    /**
     * 添加商品中图片
     *
     * @param cp
     * @return
     * @throws SQLException
     */
    public int addCommodityPicture(Commoditypicture cp) throws SQLException {
        String sql = "insert into t_cpmmoditypicture values(?,?,?)";
        return qr.update(sql, cp.getCpid(), cp.getCoid(), cp.getCpictures());
    }
}
