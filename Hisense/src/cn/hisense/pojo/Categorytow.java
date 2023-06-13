package cn.hisense.pojo;


public class Categorytow {

    private String ctid;
    private String caid;
    private String ctname;
    private String capicture;


    public String getCtid() {
        return ctid;
    }

    public void setCtid(String ctid) {
        this.ctid = ctid;
    }

    public String getCaid() {
        return caid;
    }

    public void setCaid(String caid) {
        this.caid = caid;
    }

    public String getCtname() {
        return ctname;
    }

    public void setCtname(String ctname) {
        this.ctname = ctname;
    }

    public String getCapicture() {
        return capicture;
    }

    public void setCapicture(String capicture) {
        this.capicture = capicture;
    }

    @Override
    public String toString() {
        return "Categorytow{" +
                "ctid='" + ctid + '\'' +
                ", caid='" + caid + '\'' +
                ", ctname='" + ctname + '\'' +
                ", capicture='" + capicture + '\'' +
                '}';
    }
}
