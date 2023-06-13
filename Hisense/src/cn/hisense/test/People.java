package cn.hisense.test;


public class People {
    private String uName;
    private String uPwd;
    private String uAge;

    public People() {
    }

    public People(String uName, String uPwd, String uAge) {
        this.uName = uName;
        this.uPwd = uPwd;
        this.uAge = uAge;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    public String getuAge() {
        return uAge;
    }

    public void setuAge(String uAge) {
        this.uAge = uAge;
    }

    @Override
    public String toString() {
        return "people{" +
                "uName='" + uName + '\'' +
                ", uPwd='" + uPwd + '\'' +
                ", uAge='" + uAge + '\'' +
                '}';
    }
}
