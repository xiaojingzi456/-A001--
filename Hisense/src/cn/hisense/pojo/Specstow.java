package cn.hisense.pojo;


public class Specstow {

    private String stid;
    private String sid;
    private String coid;
    private String stname;


    public String getStid() {
        return stid;
    }

    public void setStid(String stid) {
        this.stid = stid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public String getStname() {
        return stname;
    }

    public void setStname(String stname) {
        this.stname = stname;
    }

    @Override
    public String toString() {
        return "Specstow{" +
                "stid='" + stid + '\'' +
                ", sid='" + sid + '\'' +
                ", coid='" + coid + '\'' +
                ", stname='" + stname + '\'' +
                '}';
    }
}
