package cn.hisense.dao;

import cn.hisense.pojo.Category;
import cn.hisense.pojo.Categorytow;
import cn.hisense.pojo.Commodity;
import cn.hisense.utils.MyQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public class CategoryDao {
    private final QueryRunner qr = new MyQueryRunner();

    /**
     * 查询所有一级类别
     *
     * @return
     * @throws SQLException
     */
    public List<Category> findCategoryAll() throws SQLException {
        String sql = "select * from t_category";
        return qr.query(sql, new BeanListHandler<Category>(Category.class));
    }

    /**
     * 查询所有二级类别
     *
     * @return
     * @throws SQLException
     */
    public List<Categorytow> findCategoryTowAll() throws SQLException {
        String sql = "select * from t_categorytow";
        return qr.query(sql, new BeanListHandler<Categorytow>(Categorytow.class));
    }

    /**
     * 内连接查询类别一级二级
     *
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findCategoryInnerCategoryTow() throws SQLException {
        String sql = "select * from t_category c inner join t_categorytow tc on c.caid = tc.caid";
        return qr.query(sql, new MapListHandler());
    }

    /**
     * 通过一级类别ID连表查询一级二级查询
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findCategoryAdnCategoryTowById(String id) throws SQLException {
        String sql = "select * from t_category c inner join t_categorytow tc on c.caid = tc.caid where c.caid=?";
        return qr.query(sql, new MapListHandler(), id);
    }

    /**
     * 通过类别名查询一级类别
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public String findCategory(String name) throws SQLException {
        String sql = "select caname from t_category where caname=?";
        return qr.query(sql, new ScalarHandler<>(), name);
    }

    /**
     * 通过ID查询一级类别
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public Category findCategoryById(String id) throws SQLException {
        String sql = "select * from t_category where caid=?";
        return qr.query(sql, new BeanHandler<Category>(Category.class), id);
    }

    /**
     * 通过类别名查询二级类别
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public String findCategoryTow(String name) throws SQLException {
        String sql = "select ctname from t_categorytow where ctname=?";
        return qr.query(sql, new ScalarHandler<>(), name);
    }

    /**
     * 增加一级类别
     *
     * @return
     */
    public int addCategory(String id, String name) throws SQLException {
        String sql = "insert into t_category values(?,?)";
        return qr.update(sql, id, name);
    }

    /**
     * 增加二级类别
     *
     * @param categorytow
     * @return
     * @throws SQLException
     */
    public int addCategoryTow(Categorytow categorytow) throws SQLException {
        String sql = "insert into t_categorytow values(?,?,?,?)";
        return qr.update(sql, categorytow.getCtid(), categorytow.getCaid(), categorytow.getCtname(), categorytow.getCapicture());
    }

    /**
     * 通过一级ID删除一级类别
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public int delCategory(String id) throws SQLException {
        String sql = "delete from t_category where caid=?";
        return qr.update(sql, id);
    }

    /**
     * 通过二级ID删除二级类别
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public int delCategoryTow(String id) throws SQLException {
        String sql = "delete from t_categorytow where ctid=?";
        return qr.update(sql, id);
    }

    /**
     * 通过二级ID查询单行单列值
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public String findCategoryTowById(String id) throws SQLException {
        String sql = "select ctid from t_categoryTow where ctid=?";
        return qr.query(sql, new ScalarHandler<>(), id);
    }

    /**
     * 通过二级类别ID查询商品
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public List<Commodity> findCommodityById(String id) throws SQLException {
        String sql = "select * from t_commodity where ctid=?";
        return qr.query(sql, new BeanListHandler<Commodity>(Commodity.class), id);
    }

    /**
     * 通过二级类别ID连表查询商品
     *
     * @param id
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findCategoryTowAdnCommodity(String id) throws SQLException {
        String sql = "select * from t_categorytow c inner join t_commodity tc on c.ctid = tc.ctid where c.ctid=?";
        return qr.query(sql, new MapListHandler(), id);
    }

    /**
     * 批量删除二级类别
     *
     * @param ids
     * @return
     * @throws SQLException
     */
    public int[] delCategoryTow(String[] ids) throws SQLException {
        String sql = "delete from t_categorytow where ctid=?";
        Object[][] params = new Object[ids.length][];
        for (int i = 0; i < params.length; i++) {
            params[i] = new Object[]{ids[i]};
        }
        return qr.batch(sql, params);
    }

    /**
     * 通过ID修改一级类别
     *
     * @param name
     * @param id
     * @return
     * @throws SQLException
     */
    public int updCategoryById(String name, String id) throws SQLException {
        String sql = "update t_category set caname=? where caid=?";
        return qr.update(sql, name, id);
    }

//    public List<Categorytow> findCategoryById(String)
}
