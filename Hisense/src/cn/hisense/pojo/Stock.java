package cn.hisense.pojo;


public class Stock {

    private String sid;
    private String coid;
    private Integer snumber;


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

    public Integer getSnumber() {
        return snumber;
    }

    public void setSnumber(Integer snumber) {
        this.snumber = snumber;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "sid='" + sid + '\'' +
                ", coid='" + coid + '\'' +
                ", snumber=" + snumber +
                '}';
    }
}
