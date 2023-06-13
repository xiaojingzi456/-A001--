package cn.hisense.service.impl;

import cn.hisense.dao.CommodityDao;
import cn.hisense.pojo.Commodity;
import cn.hisense.service.CommodityService;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class CommodityServiceImpl implements CommodityService {
    private final CommodityDao commodityDao = new CommodityDao();

    @Override
    public Commodity getDetail(String coid) {

        return commodityDao.getCommodity(coid);
    }

    @Override
    public Commodity getDetailIMG(String coid) {
        return commodityDao.getDetailIMG(coid);
    }


    /**
     * 条件条件查询
     *
     * @param condition
     * @return
     */
    @Override
    public List<Commodity> findCommodityAll(Map<String, String[]> condition) {
        try {
            return commodityDao.findCommodityAll(condition);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过ID修改商品上下架状态
     *
     * @param state
     * @param id
     * @return
     */
    @Override
    public int updStateById(int state, String id) {
        try {
            return commodityDao.updStateById(state, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 增加商品
     *
     * @param commodity
     * @return
     */
    @Override
    public int addCommodity(Commodity commodity) {
        commodity.setCoid(MyBeanUtils.uuid());
        commodity.setCstate(1);
        commodity.setCsold(0);
        try {
            return commodityDao.addCommodity(commodity);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过商品名称查询
     *
     * @param name
     * @return
     */
    @Override
    public Commodity findCommodityByName(String name) {
        try {
            return commodityDao.findCommodityByName(name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
