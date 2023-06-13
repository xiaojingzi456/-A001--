package cn.hisense.pojo;


public class Carousel {

    private String crid;
    private String coid;
    private String crpicture;

    public String getCrid() {
        return crid;
    }

    public void setCrid(String crid) {
        this.crid = crid;
    }

    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public String getCrpicture() {
        return crpicture;
    }

    public void setCrpicture(String crpicture) {
        this.crpicture = crpicture;
    }

    @Override
    public String toString() {
        return "Carousel{" +
                "crid='" + crid + '\'' +
                ", coid='" + coid + '\'' +
                ", crpicture='" + crpicture + '\'' +
                '}';
    }
}
