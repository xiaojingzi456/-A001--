package cn.hisense.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class Evaluate {

    private String eid;
    private String uid;
    private String coid;
    private Integer num;
    private String econtent;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp etime;

    private User user;

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getCoid() {
        return coid;
    }

    public void setCoid(String coid) {
        this.coid = coid;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getEcontent() {
        return econtent;
    }

    public void setEcontent(String econtent) {
        this.econtent = econtent;
    }

    public Timestamp getEtime() {
        return etime;
    }

    public void setEtime(Timestamp etime) {
        this.etime = etime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Evaluate{" +
                "eid='" + eid + '\'' +
                ", uid='" + uid + '\'' +
                ", coid='" + coid + '\'' +
                ", num=" + num +
                ", econtent='" + econtent + '\'' +
                ", etime='" + etime + '\'' +
                ", user=" + user +
                '}';
    }
}
