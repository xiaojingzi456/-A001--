package cn.hisense.pojo;


public class Commoditydetail {

    private String codetailid;
    private String coid;
    private String commoditydetail;

    public String getCodetailid() {
        return codetailid;
    }

    public void setCodetailid(String codetailid) {
        this.codetailid = codetailid;
    }

    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public String getCommoditydetail() {
        return commoditydetail;
    }

    public void setCommoditydetail(String commoditydetail) {
        this.commoditydetail = commoditydetail;
    }

    @Override
    public String toString() {
        return "Commoditydetail{" +
                "codetailid='" + codetailid + '\'' +
                ", coid='" + coid + '\'' +
                ", commoditydetail='" + commoditydetail + '\'' +
                '}';
    }
}
