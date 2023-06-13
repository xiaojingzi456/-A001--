package cn.hisense.pojo;


public class Advert {

    private String aid;
    private String apicture;


    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getApicture() {
        return apicture;
    }

    public void setApicture(String apicture) {
        this.apicture = apicture;
    }

    @Override
    public String toString() {
        return "Advert{" +
                "aid='" + aid + '\'' +
                ", apicture='" + apicture + '\'' +
                '}';
    }
}
