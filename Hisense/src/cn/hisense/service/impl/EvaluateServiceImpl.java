package cn.hisense.service.impl;

import cn.hisense.dao.EvaluateDao;
import cn.hisense.pojo.Evaluate;
import cn.hisense.service.EvaluateService;

import java.sql.SQLException;
import java.util.List;

/**
 * @author 王叔叔
 * @create 2022/8/18 23:17
 */
public class EvaluateServiceImpl implements EvaluateService {

    EvaluateDao evaluateDao =  new EvaluateDao();

    @Override
    public List<Evaluate> getEvaluateBycoid(String coid) {

        return evaluateDao.getEvaluateBycoid(coid);
    }

    @Override
    public void addEvaluateByoid(String oid, Evaluate evaluate) {

        try {
            evaluateDao.addEvaluateByoid(oid,evaluate);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
