package cn.hisense.dao;

import cn.hisense.pojo.Specs;
import cn.hisense.pojo.Specstow;
import cn.hisense.utils.MyQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class SpecsDao {
    private final QueryRunner qr = new MyQueryRunner();

    /**
     * 查询所有一级规格表
     *
     * @return
     * @throws SQLException
     */
    public List<Specs> findSpecsAll() throws SQLException {
        String sql = "select * from t_specs";
        return qr.query(sql, new BeanListHandler<>(Specs.class));
    }

    /**
     * 查询所有二级规格表
     *
     * @return
     * @throws SQLException
     */
    public List<Specstow> findSpecsTowAll() throws SQLException {
        String sql = "select * from t_specstow";
        return qr.query(sql, new BeanListHandler<>(Specstow.class));
    }

    /**
     * 内连接三表联查，规格一级、二级，商品表
     *
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findSpecsAndSpecsTowAndCommodity() throws SQLException {
        String sql = "select * from t_specs s inner join t_specstow ts on s.sid = ts.stid inner join t_commodity tc on ts.stid = tc.stid";
        return qr.query(sql, new MapListHandler());
    }

    /**
     * 增加一级规格
     *
     * @param id
     * @param name
     * @return
     * @throws SQLException
     */
    public int addSpecs(String id, String name) throws SQLException {
        String sql = "insert into t_specs values(?,?)";
        return qr.update(sql, id, name);
    }

    /**
     * 增加二级规格
     *
     * @param specstow
     * @return
     * @throws SQLException
     */
    public int addSpecsTow(Specstow specstow) throws SQLException {
        String sql = "insert into t_specstow values(?,?,?)";
        return qr.update(sql, specstow.getStid(), specstow.getSid(), specstow.getStname());
    }

    /**
     * 通过一级规格名称查找一级规格
     *
     * @param name
     * @return
     * @throws SQLException
     */
    public Specs findSpecsByName(String name) throws SQLException {
        String sql = "select * from t_specs where sname=?";
        return qr.query(sql, new BeanHandler<>(Specs.class), name);
    }

    /**
     * 通过二级规格名称查找二级规格
     * @param name
     * @return
     * @throws SQLException
     */
    public Specstow findSpecsTowByName(String name) throws SQLException {
        String sql = "select * from t_specstow where stname=?";
        return qr.query(sql, new BeanHandler<>(Specstow.class), name);
    }
}
