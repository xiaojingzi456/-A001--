package cn.hisense.pojo;


public class Extension {

    private String eid;
    private String sid;
    private String coid;


    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
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

    @Override
    public String toString() {
        return "Extension{" +
                "eid='" + eid + '\'' +
                ", sid='" + sid + '\'' +
                ", coid='" + coid + '\'' +
                '}';
    }
}
