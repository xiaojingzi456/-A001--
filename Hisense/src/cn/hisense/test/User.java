package cn.hisense.test;


public class User {
    private Integer uid;
    private String upwd;
    private String uphone;
    private String uname;
    private String usex;
    private String uemail;
    private String uportrait;

    public User() {
    }

    public User(Integer uid, String upwd, String uphone, String uname, String usex, String uemail, String uportrait) {
        this.uid = uid;
        this.upwd = upwd;
        this.uphone = uphone;
        this.uname = uname;
        this.usex = usex;
        this.uemail = uemail;
        this.uportrait = uportrait;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
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


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
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

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", upwd='" + upwd + '\'' +
                ", uphone='" + uphone + '\'' +
                ", uname='" + uname + '\'' +
                ", usex='" + usex + '\'' +
                ", uemail='" + uemail + '\'' +
                ", uportrait='" + uportrait + '\'' +
                '}';
    }
}
