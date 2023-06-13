package cn.hisense.service;

import cn.hisense.pojo.Evaluate;

import java.util.List;

/**
 * @author 王叔叔
 * @create 2022/8/18 23:16
 */
public interface EvaluateService {

    List<Evaluate> getEvaluateBycoid(String coid);

    void addEvaluateByoid(String oid, Evaluate evaluate);
}
