package cn.hisense.pojo;


public class Commoditypicture {

    private String cpid;
    private String coid;
    private String cpictures;
    private String cpicture;

    public String getCpid() {
        return cpid;
    }

    public void setCpid(String cpid) {
        this.cpid = cpid;
    }

    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public String getCpictures() {
        return cpictures;
    }

    public void setCpictures(String cpictures) {
        this.cpictures = cpictures;
    }

    public String getCpicture() {
        return cpicture;
    }

    public void setCpicture(String cpicture) {
        this.cpicture = cpicture;
    }

    @Override
    public String toString() {
        return "Commoditypicture{" +
                "cpid='" + cpid + '\'' +
                ", coid='" + coid + '\'' +
                ", cpictures='" + cpictures + '\'' +
                ", cpicture='" + cpicture + '\'' +
                '}';
    }
}
