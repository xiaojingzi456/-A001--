package cn.hisense.pojo;


import java.util.List;

public class Commodity {

    private String coid;
    private String ctid;
    private String comodel;
    private String coname;
    private String copicture;
    private double coprice;
    private double disprice;
    private Integer csold;
    private Integer snumber;
    private Integer cstate;
    private String stid;

    //轮播图片
    private List<Commoditypicture> commoditypictures;

    //详情图片
    private List<Commoditydetail> commoditydetails;

    public List<Commoditydetail> getCommoditydetails() {
        return commoditydetails;
    }

    public void setCommoditydetails(List<Commoditydetail> commoditydetails) {
        this.commoditydetails = commoditydetails;
    }

    public List<Commoditypicture> getCommoditypictures() {
        return commoditypictures;
    }

    public void setCommoditypictures(List<Commoditypicture> commoditypictures) {
        this.commoditypictures = commoditypictures;
    }


    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public String getCtid() {
        return ctid;
    }

    public void setCtid(String ctid) {
        this.ctid = ctid;
    }

    public String getStid() {
        return stid;
    }

    public void setStid(String stid) {
        this.stid = stid;
    }

    public String getComodel() {
        return comodel;
    }

    public void setComodel(String comodel) {
        this.comodel = comodel;
    }

    public String getConame() {
        return coname;
    }

    public void setConame(String coname) {
        this.coname = coname;
    }

    public String getCopicture() {
        return copicture;
    }

    public void setCopicture(String copicture) {
        this.copicture = copicture;
    }

    public double getCoprice() {
        return coprice;
    }

    public void setCoprice(double coprice) {
        this.coprice = coprice;
    }

    public double getDisprice() {
        return disprice;
    }

    public void setDisprice(double disprice) {
        this.disprice = disprice;
    }

    public Integer getCsold() {
        return csold;
    }

    public void setCsold(Integer csold) {
        this.csold = csold;
    }

    public Integer getCstate() {
        return cstate;
    }

    public void setCstate(Integer cstate) {
        this.cstate = cstate;
    }

    public Integer getSnumber() {
        return snumber;
    }

    public void setSnumber(Integer snumber) {
        this.snumber = snumber;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "coid='" + coid + '\'' +
                ", ctid='" + ctid + '\'' +
                ", comodel='" + comodel + '\'' +
                ", coname='" + coname + '\'' +
                ", copicture='" + copicture + '\'' +
                ", coprice=" + coprice +
                ", disprice=" + disprice +
                ", csold=" + csold +
                ", snumber=" + snumber +
                ", cstate=" + cstate +
                ", stid='" + stid + '\'' +
                ", commoditypictures=" + commoditypictures +
                ", commoditydetails=" + commoditydetails +
                '}';
    }
}
