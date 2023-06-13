package cn.hisense.pojo;


public class Admin {

    private String aid;
    private String aname;
    private String apwd;
    private Integer astate;
    private String asex;
    private String aintroduce;
    private Integer arole;
    private String atelephone;


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }


    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }


    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd;
    }


    public Integer getAstate() {
        return astate;
    }

    public void setAstate(Integer astate) {
        this.astate = astate;
    }


    public String getAsex() {
        return asex;
    }

    public void setAsex(String asex) {
        this.asex = asex;
    }


    public String getAintroduce() {
        return aintroduce;
    }

    public void setAintroduce(String aintroduce) {
        this.aintroduce = aintroduce;
    }

    public Integer getArole() {
        return arole;
    }

    public void setArole(Integer arole) {
        this.arole = arole;
    }

    public String getAtelephone() {
        return atelephone;
    }

    public void setAtelephone(String atelephone) {
        this.atelephone = atelephone;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid='" + aid + '\'' +
                ", aname='" + aname + '\'' +
                ", apwd='" + apwd + '\'' +
                ", astate=" + astate +
                ", asex='" + asex + '\'' +
                ", aintroduce='" + aintroduce + '\'' +
                ", arole=" + arole +
                ", atelephone='" + atelephone + '\'' +
                '}';
    }
}
