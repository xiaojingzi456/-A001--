package cn.hisense.pojo;


public class Orderdetails {

    private String otid;
    private Order order;
    private Commodity commodity;
    private Integer onumber;
    private double oprice;
    private double oactual;

    public String getOtid() {
        return otid;
    }

    public void setOtid(String otid) {
        this.otid = otid;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Integer getOnumber() {
        return onumber;
    }

    public void setOnumber(Integer onumber) {
        this.onumber = onumber;
    }

    public double getOprice() {
        return oprice;
    }

    public void setOprice(double oprice) {
        this.oprice = oprice;
    }

    public double getOactual() {
        return oactual;
    }

    public void setOactual(double oactual) {
        this.oactual = oactual;
    }

    @Override
    public String toString() {
        return "Orderdetails{" +
                "otid='" + otid + '\'' +
                ", order=" + order +
                ", commodity=" + commodity +
                ", onumber=" + onumber +
                ", oprice=" + oprice +
                ", oactual=" + oactual +
                '}';
    }
}
