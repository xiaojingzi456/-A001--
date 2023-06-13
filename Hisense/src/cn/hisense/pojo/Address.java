package cn.hisense.pojo;


public class Address {

    private String aid;
    private String uid;
    private String aprovince;
    private String acity;
    private String aarea;
    private String aspecific;
    private String aname;
    private String aphone;
    private String atelephone;
    private Integer apostcode;
    private Integer adefault;
    private Integer adstatus;

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getAprovince() {
        return aprovince;
    }

    public void setAprovince(String aprovince) {
        this.aprovince = aprovince;
    }

    public String getAcity() {
        return acity;
    }

    public void setAcity(String acity) {
        this.acity = acity;
    }

    public String getAarea() {
        return aarea;
    }

    public void setAarea(String aarea) {
        this.aarea = aarea;
    }

    public String getAspecific() {
        return aspecific;
    }

    public void setAspecific(String aspecific) {
        this.aspecific = aspecific;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getAphone() {
        return aphone;
    }

    public void setAphone(String aphone) {
        this.aphone = aphone;
    }

    public String getAtelephone() {
        return atelephone;
    }

    public void setAtelephone(String atelephone) {
        this.atelephone = atelephone;
    }

    public Integer getApostcode() {
        return apostcode;
    }

    public void setApostcode(Integer apostcode) {
        this.apostcode = apostcode;
    }

    public Integer getAdefault() {
        return adefault;
    }

    public void setAdefault(Integer adefault) {
        this.adefault = adefault;
    }

    public Integer getAdstatus() {
        return adstatus;
    }

    public void setAdstatus(Integer adstatus) {
        this.adstatus = adstatus;
    }

    @Override
    public String toString() {
        return "Address{" +
                "aid='" + aid + '\'' +
                ", uid='" + uid + '\'' +
                ", aprovince='" + aprovince + '\'' +
                ", acity='" + acity + '\'' +
                ", aarea='" + aarea + '\'' +
                ", aspecific='" + aspecific + '\'' +
                ", aname='" + aname + '\'' +
                ", aphone='" + aphone + '\'' +
                ", atelephone='" + atelephone + '\'' +
                ", apostcode=" + apostcode +
                ", adefault=" + adefault +
                ", adstatus=" + adstatus +
                '}';
    }
}
