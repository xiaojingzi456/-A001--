package cn.hisense.pojo;


public class Category {

    private String caid;
    private String caname;


    public String getCaid() {
        return caid;
    }

    public void setCaid(String caid) {
        this.caid = caid;
    }

    public String getCaname() {
        return caname;
    }

    public void setCaname(String caname) {
        this.caname = caname;
    }

    @Override
    public String toString() {
        return "Category{" +
                "caid='" + caid + '\'' +
                ", caname='" + caname + '\'' +
                '}';
    }
}
