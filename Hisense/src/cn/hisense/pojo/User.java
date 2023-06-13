package cn.hisense.pojo;


public class User {

    private String uid;
    private String uname;
    private String upwd;
    private String uphone;
    private String usex;
    private String uemail;
    private String uportrait;
    private Integer ustate;


    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUportrait() {
        return uportrait;
    }

    public void setUportrait(String uportrait) {
        this.uportrait = uportrait;
    }

    public Integer getUstate() {
        return ustate;
    }

    public void setUstate(Integer ustate) {
        this.ustate = ustate;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", uname='" + uname + '\'' +
                ", upwd='" + upwd + '\'' +
                ", uphone='" + uphone + '\'' +
                ", usex='" + usex + '\'' +
                ", uemail='" + uemail + '\'' +
                ", uportrait='" + uportrait + '\'' +
                ", ustate='" + ustate + '\'' +
                '}';
    }
}
