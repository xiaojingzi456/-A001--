package cn.hisense.pojo;


public class Specs {

    private String sid;
    private String sname;


    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "Specs{" +
                "sid='" + sid + '\'' +
                ", sname='" + sname + '\'' +
                '}';
    }
}
