package cn.hisense.vo;

/**
 * @author 王叔叔
 * @create 2022/8/11 9:28
 */
public class CriteriaOrder {

    private Integer pageNo = 1;

    private Integer pageSize = 10;

    private String oid;

    private Integer orderStatus;

    private String orderTime;

    public CriteriaOrder() {
    }

    public CriteriaOrder(Integer pageNo, Integer pageSize, String oid, Integer orderStatus, String orderTime) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.oid = oid;
        this.orderStatus = orderStatus;
        this.orderTime = orderTime;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }


    @Override
    public String toString() {
        return "CriteriaOrder{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", oid='" + oid + '\'' +
                ", orderStatus=" + orderStatus +
                ", orderTime='" + orderTime + '\'' +
                '}';
    }
}
