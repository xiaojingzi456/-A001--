package cn.hisense.dao;

import cn.hisense.pojo.Commoditydetail;

import java.util.List;


public class CommoditydetailDao extends BaseDao<Commoditydetail> {

    public List<Commoditydetail> getCommoditydetail(String coid){

        String sql ="select * from t_commoditydetail where coid = ?";
        return this.getBeanList(sql,coid);
    }


}
