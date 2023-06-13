package cn.hisense.service;

import cn.hisense.pojo.Commodity;

import java.util.List;
import java.util.Map;


public interface CommodityService {


    Commodity getDetail(String coid);

    Commodity getDetailIMG(String coid);

    /**
     * 条件条件查询
     *
     * @param condition
     * @return
     */
    public List<Commodity> findCommodityAll(Map<String, String[]> condition);

    /**
     * 通过ID修改商品上下架状态
     *
     * @param state
     * @param id
     * @return
     */
    public int updStateById(int state, String id);

    /**
     * 增加商品
     *
     * @param commodity
     * @return
     */
    public int addCommodity(Commodity commodity);

    /**
     * 通过商品名称查询
     *
     * @param name
     * @return
     */
    public Commodity findCommodityByName(String name);
}
