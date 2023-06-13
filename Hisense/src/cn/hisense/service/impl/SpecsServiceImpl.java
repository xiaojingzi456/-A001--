package cn.hisense.service.impl;

import cn.hisense.dao.SpecsDao;
import cn.hisense.pojo.Specs;
import cn.hisense.pojo.Specstow;
import cn.hisense.service.SpecsService;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SpecsServiceImpl implements SpecsService {
    private final SpecsDao specsDao = new SpecsDao();

    /**
     * 查询所有一级规格表
     *
     * @return
     */
    @Override
    public List<Specs> findSpecsAll() {
        try {
            return specsDao.findSpecsAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查询所有二级规格表
     *
     * @return
     */
    @Override
    public List<Specstow> findSpecsTowAll() {
        try {
            return specsDao.findSpecsTowAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 内连接三表联查，规格一级、二级，商品表
     *
     * @return
     */
    @Override
    public List<Map<String, Object>> findSpecsAndSpecsTowAndCommodity() {
        try {
            return specsDao.findSpecsAndSpecsTowAndCommodity();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 增加一级规格
     *
     * @param name
     * @return
     */
    @Override
    public int addSpecs(String name) {
        String uuid = MyBeanUtils.uuid();
        try {
            return specsDao.addSpecs(uuid, name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 增加二级规格
     *
     * @param specstow
     * @return
     */
    @Override
    public int addSpecsTow(Specstow specstow) {
        specstow.setStid(MyBeanUtils.uuid());
        try {
            return specsDao.addSpecsTow(specstow);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 通过一级规格名称查找一级规格
     *
     * @param name
     * @return
     */
    @Override
    public Specs findSpecsByName(String name) {
        try {
            return specsDao.findSpecsByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过二级规格名称查找二级规格
     *
     * @param name
     * @return
     */
    @Override
    public Specstow findSpecsTowByName(String name) {
        try {
            return specsDao.findSpecsTowByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
