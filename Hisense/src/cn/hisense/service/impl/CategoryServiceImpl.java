package cn.hisense.service.impl;

import cn.hisense.dao.CategoryDao;
import cn.hisense.pojo.Category;
import cn.hisense.pojo.Categorytow;
import cn.hisense.pojo.Commodity;
import cn.hisense.service.CategoryService;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class CategoryServiceImpl implements CategoryService {
    private final CategoryDao categoryDao = new CategoryDao();

    /**
     * 查询所有一级类别
     *
     * @return
     */
    @Override
    public List<Category> findCategoryAll() {
        try {
            return categoryDao.findCategoryAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 内连接查询类别一级二级
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> findCategoryInnerCategoryTow() {
        try {
            return categoryDao.findCategoryInnerCategoryTow();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过一级类别ID连表查询一级二级查询
     *
     * @param id
     * @return
     */
    @Override
    public List<Map<String, Object>> findCategoryAdnCategoryTowById(String id) {
        try {
            return categoryDao.findCategoryAdnCategoryTowById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过类别名查询一级类别是否存在
     *
     * @param name
     * @return
     */
    @Override
    public String findCategory(String name) {
        try {
            return categoryDao.findCategory(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过类别名查询二级类别是否存在
     *
     * @param name
     * @return
     */
    @Override
    public String findCategoryTow(String name) {
        try {
            return categoryDao.findCategoryTow(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 增加一级类别
     *
     * @param name
     * @return
     */
    @Override
    public int addCategory(String name) {
        try {
            return categoryDao.addCategory(MyBeanUtils.uuid(), name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 增加二级类别
     *
     * @param categorytow
     * @return
     */
    @Override
    public int addCategoryTow(Categorytow categorytow) {
        categorytow.setCtid(MyBeanUtils.uuid());
        try {
            return categoryDao.addCategoryTow(categorytow);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * 通过ID查询一级类别
     *
     * @param id
     * @return
     */
    @Override
    public Category findCategoryById(String id) {
        try {
            return categoryDao.findCategoryById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过一级ID删除一级类别
     *
     * @param id
     * @return
     */
    @Override
    public int delCategory(String id) {
        try {
            return categoryDao.delCategory(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过二级ID删除ID类别
     *
     * @param id
     * @return
     */
    @Override
    public int delCategoryTow(String id) {
        try {
            return categoryDao.delCategoryTow(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过二级ID查询单行单列值
     *
     * @param id
     * @return
     */
    @Override
    public String findCategoryTowById(String id) {
        try {
            return categoryDao.findCategoryTowById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过二级类别ID查询所属商品
     *
     * @param id
     * @return
     */
    @Override
    public List<Commodity> findCommodityById(String id) {
        try {
            return categoryDao.findCommodityById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过二级类别ID连表查询商品
     *
     * @param id
     * @return
     */
    @Override
    public List<Map<String, Object>> findCategoryTowAdnCommodity(String id) {
        try {
            return categoryDao.findCategoryTowAdnCommodity(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 批量删除二级类别
     *
     * @param ids
     * @return
     */
    @Override
    public int[] delCategoryTow(String[] ids) {
        try {
            return categoryDao.delCategoryTow(ids);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new int[0];
    }

    /**
     * 通过ID修改一级类别名称
     *
     * @param name
     * @param id
     * @return
     */
    @Override
    public int updCategoryById(String name, String id) {
        try {
            return categoryDao.updCategoryById(name, id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
