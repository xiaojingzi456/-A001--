package cn.hisense.service;

import cn.hisense.pojo.Category;
import cn.hisense.pojo.Categorytow;
import cn.hisense.pojo.Commodity;

import java.util.List;
import java.util.Map;


public interface CategoryService {

    /**
     * 查询所有一级类别
     *
     * @return
     */
    public List<Category> findCategoryAll();

    /**
     * 内连接查询类别一级二级
     *
     * @return
     */
    public List<Map<String, Object>> findCategoryInnerCategoryTow();

    /**
     * 通过一级类别ID连表查询一级二级查询
     *
     * @param id
     * @return
     */
    public List<Map<String, Object>> findCategoryAdnCategoryTowById(String id);

    /**
     * 通过类别名查询一级类别是否存在
     *
     * @param name
     * @return
     */
    public String findCategory(String name);

    /**
     * 通过类别名查询二级类别是否存在
     *
     * @param name
     * @return
     */
    public String findCategoryTow(String name);

    /**
     * 增加一级类别
     *
     * @param name
     * @return
     */
    public int addCategory(String name);

    /**
     * 增加二级类别
     *
     * @param categorytow
     * @return
     */
    public int addCategoryTow(Categorytow categorytow);

    /**
     * 通过ID查询一级类别
     *
     * @param id
     * @return
     */
    public Category findCategoryById(String id);

    /**
     * 通过一级ID删除一级类别
     *
     * @param id
     * @return
     */
    public int delCategory(String id);

    /**
     * 通过二级ID删除ID类别
     *
     * @param id
     * @return
     */
    public int delCategoryTow(String id);

    /**
     * 通过二级ID查询单行单列值
     *
     * @param id
     * @return
     */
    public String findCategoryTowById(String id);

    /**
     * 通过二级类别ID查询所属商品
     *
     * @param id
     * @return
     */
    public List<Commodity> findCommodityById(String id);

    /**
     * 通过二级类别ID连表查询商品
     *
     * @param id
     * @return
     */
    public List<Map<String, Object>> findCategoryTowAdnCommodity(String id);

    /**
     * 批量删除二级类别
     *
     * @param ids
     * @return
     */
    public int[] delCategoryTow(String[] ids);

    /**
     * 通过ID修改一级类别名称
     *
     * @param name
     * @param id
     * @return
     */
    public int updCategoryById(String name, String id);

}
