package cn.hisense.pojo;


public class Member {

    private String mid;
    private String uid;
    private String mlevel;
    private double mbalance;


    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getMlevel() {
        return mlevel;
    }

    public void setMlevel(String mlevel) {
        this.mlevel = mlevel;
    }

    public double getMbalance() {
        return mbalance;
    }

    public void setMbalance(double mbalance) {
        this.mbalance = mbalance;
    }

    @Override
    public String toString() {
        return "Member{" +
                "mid='" + mid + '\'' +
                ", uid='" + uid + '\'' +
                ", mlevel='" + mlevel + '\'' +
                ", mbalance=" + mbalance +
                '}';
    }
}
