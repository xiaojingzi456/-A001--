package cn.hisense.dao;

import cn.hisense.pojo.Commoditypicture;

import java.util.List;


public class CommPictureDao extends BaseDao<Commoditypicture> {



    public List<Commoditypicture> getComPicture(String coid){

        String sql = "select * from t_commoditypicture where coid = ?";
        return getBeanList(sql,coid);
    }

}
