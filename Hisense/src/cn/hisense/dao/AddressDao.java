package cn.hisense.dao;

import cn.hisense.pojo.Address;

import java.util.List;

/**
 * @author
 * @create 2022/8/6 8:39
 */
public class AddressDao extends BaseDao<Address> {


    /**
     * 获取用户的所有地址
     * @param uid
     * @return
     */
    public List<Address> getAddressByuid(String uid){

        String sql = "select * from t_address where adstatus = 1 and uid = ?";
        List<Address> addressList = this.getBeanList(sql, uid);

        return addressList;
    }

    /**
     * 添加地址
     * @param address
     */
    public void addToAddress(Address address){

        String sql = "insert into t_address values(?,?,?,?,?,?,?,?,?,?,?,?)";
        this.update(sql,address.getAid(),address.getUid(),address.getAprovince(),
                address.getAcity(),address.getAarea(),address.getAspecific(),
                address.getAname(),address.getAphone(), address.getAtelephone(),
                address.getApostcode(),address.getAdefault(),address.getAdstatus());

    }

    /**
     * 修改用户地址
     * @param address
     */
    public void updateAddress(String uid, Address address){

        String sql = "update t_address set `aprovince` =?,`acity`=?,`aarea`=?,"
                + " `aspecific`=?, `aname`=?, `aphone`=?, `atelephone`=?,"
                + " `apostcode`=? where uid =? and aid=?";

        this.update(sql,address.getAprovince(),address.getAcity(),address.getAarea(),
                address.getAspecific(),address.getAname(),address.getAphone(),
                address.getAtelephone(),address.getApostcode(),uid,address.getAid());

    }

    /**
     * 删除地址
     * @param status
     * @param aid
     * @param uid
     */
    public void updateAddressByadstatus(String status,String aid,String uid){

        String sql = "update t_address set adstatus =? where aid =? and uid =?";
        this.update(sql,status,aid,uid);

    }

    /**
     * 根据用户和aid查询地址
     * @param uid
     * @param aid
     * @return
     */
    public Address getAddressByaid(String uid, String aid) {

        String sql = "select * from t_address where uid =? and aid=?";
        return this.getBean(sql,uid,aid);
    }

    /**
     * 根据地址编号查询地址
     * @param aid
     * @return
     */
    public Address getAddressByoid(String aid){

        String sql = "select * from t_address where aid = ?";
        return this.getBean(sql,aid);
    }
}
