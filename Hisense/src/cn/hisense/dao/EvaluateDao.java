package cn.hisense.dao;

import cn.hisense.pojo.Evaluate;
import cn.hisense.pojo.Order;
import cn.hisense.pojo.Orderdetails;
import cn.hisense.pojo.User;
import cn.hisense.utils.MyBeanUtils;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;


public class EvaluateDao extends BaseDao<Evaluate> {


    /**
     * 获取商品所有评论
     * @param coid
     * @return
     */
    public List<Evaluate> getEvaluateBycoid(String coid) {

        String sql = "select * from t_evaluate where coid =?";

        List<Evaluate> beanList = this.getBeanList(sql, coid);
        for (Evaluate evaluate : beanList) {
            setUser(evaluate);
        }
        return beanList;
    }

    /**
     * 为评论加载所属用户
     * @param evaluate
     */
    public void setUser(Evaluate evaluate){

        String sql = "select * from t_user where uid =?";
        User user = new UserDao().getUserByuid(evaluate.getUid());
        evaluate.setUser(user);
    }

    /**
     * 添加评论
     * @param evaluate
     */
    public void addEvaluateByoid(String oid, Evaluate evaluate) throws SQLException {

        String sql = "insert into t_evaluate values(?,?,?,?,?,?)";

        Order order = new OrderDao().getOrder(oid);
        List<Orderdetails> list = order.getOrderdetails();
        Object[][] params = new Object[list.size()][6];
        for (int i = 0; i < list.size(); i++) {
            params[i][0] = MyBeanUtils.uuid();
            params[i][1] = order.getUid();
            params[i][2] = list.get(i).getCommodity().getCoid();
            params[i][3] = evaluate.getNum();
            params[i][4] = evaluate.getEcontent();
            params[i][5] = new java.sql.Timestamp(new Date().getTime());
            
        }

        this.batchUpdate(sql,params);

    }
}
