package cn.hisense.pojo;

import java.math.BigDecimal;

/**
 * 购物车实体类
 */
public class Cart {

    private String caid;
    private Commodity commodity;
    private User user;
    private Integer canumber;

    //计算购物车小计，BigDecimal解决无限循环数据误差（1/10）问题
    public double getCountPrice(){

        BigDecimal b1 = new BigDecimal(commodity.getCoprice() +"");
        BigDecimal b2 = new BigDecimal(canumber +"");

        return b1.multiply(b2).doubleValue();

    }

    public Cart() {
    }

    public Cart(String caid, Commodity commodity, User user, Integer canumber) {
        this.caid = caid;
        this.commodity = commodity;
        this.user = user;
        this.canumber = canumber;
    }

    public String getCaid() {
        return caid;
    }

    public void setCaid(String caid) {
        this.caid = caid;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCanumber() {
        return canumber;
    }

    public void setCanumber(Integer canumber) {
        this.canumber = canumber;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "caid='" + caid + '\'' +
                ", commodity=" + commodity +
                ", user=" + user +
                ", canumber=" + canumber +
                '}';
    }

}
