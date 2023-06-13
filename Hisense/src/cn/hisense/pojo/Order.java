package cn.hisense.pojo;


import java.sql.Timestamp;
import java.util.List;

public class Order {

    private String oid;
    private String uid;
    private String aid;
    private Timestamp otime;
    private double otatol;//总金额
    private Integer ostate;
    private String remark;

    private List<cn.hisense.pojo.Orderdetails> Orderdetails;

    //封装地址信息
    private Address address;

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


    /**
     * 得到每个订单的条目
     * @return
     */
    public List<cn.hisense.pojo.Orderdetails> getOrderdetails() {
        return Orderdetails;
    }

    public void setOrderdetails(List<cn.hisense.pojo.Orderdetails> orderdetails) {
        Orderdetails = orderdetails;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public Timestamp getOtime() {
        return otime;
    }

    public void setOtime(Timestamp otime) {
        this.otime = otime;
    }

    public double getOtatol() {
        return otatol;
    }

    public void setOtatol(double otatol) {
        this.otatol = otatol;
    }

    public Integer getOstate() {
        return ostate;
    }

    public void setOstate(Integer ostate) {
        this.ostate = ostate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", uid='" + uid + '\'' +
                ", aid='" + aid + '\'' +
                ", otime=" + otime +
                ", otatol=" + otatol +
                ", ostate=" + ostate +
                ", remark='" + remark + '\'' +
                ", Orderdetails=" + Orderdetails +
                ", address=" + address +
                '}';
    }
}
