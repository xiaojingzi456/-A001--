package cn.hisense.pojo;


public class Table {

    private Integer uid;
    private double balance;
    private String user;


    public Table(Integer uid, double balance, String user) {
        this.uid = uid;
        this.balance = balance;
        this.user = user;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }


    @Override
    public String toString() {
        return "Table{" +
                "uid=" + uid +
                ", balance=" + balance +
                ", user='" + user + '\'' +
                '}';
    }
}
