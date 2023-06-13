package cn.hisense.service;

import cn.hisense.pojo.Specs;
import cn.hisense.pojo.Specstow;

import java.util.List;
import java.util.Map;


public interface SpecsService {
    /**
     * 查询所有一级规格表
     *
     * @return
     */
    public List<Specs> findSpecsAll();

    /**
     * 查询所有二级规格表
     *
     * @return
     */
    public List<Specstow> findSpecsTowAll();

    /**
     * 内连接三表联查，规格一级、二级，商品表
     *
     * @return
     */
    public List<Map<String, Object>> findSpecsAndSpecsTowAndCommodity();

    /**
     * 增加一级规格
     *
     * @param name
     * @return
     */
    public int addSpecs(String name);

    /**
     * 增加二级规格
     *
     * @param specstow
     * @return
     */
    public int addSpecsTow(Specstow specstow);

    /**
     * 通过一级规格名称查找一级规格
     *
     * @param name
     * @return
     */
    public Specs findSpecsByName(String name);

    /**
     * 通过二级规格名称查找二级规格
     *
     * @param name
     * @return
     */
    public Specstow findSpecsTowByName(String name);
}
