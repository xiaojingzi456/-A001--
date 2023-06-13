package cn.hisense.test;

import cn.hisense.dao.AdminDao;
import cn.hisense.dao.CategoryDao;
import org.junit.Test;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class AdminTest {
    private final AdminDao adminDao = new AdminDao();
    private final CategoryDao categoryDao = new CategoryDao();

    /**
     * 测试内连接查询类别一级二级
     *
     * @throws SQLException
     */
    @Test
    public void testFindCategoryInnerCategoryTow() throws SQLException {
        List<Map<String, Object>> categoryInnerCategoryTow = categoryDao.findCategoryInnerCategoryTow();
        for (Map<String, Object> map : categoryInnerCategoryTow) {
            System.out.println(map);
        }
    }
}
