package cn.hisense.vo;

import java.util.List;

/**
 * @author 王叔叔
 * @create 2022/8/11 9:28
 */
public class Page<T> {

    private int pageNo = 1;

    private List<T> list;

    private int pageSize;

    private long totalItemNum;

    //构造器需要对pageNo初始化
    public Page(int pageNo) {
        super();
        this.pageNo = pageNo;
    }
    //并没有set设置当前页的方法,所以需要初始化pageNo
    //需要校验，传过来的值要在页数范围之内
    public int getPageNo() {
        if(pageNo < 0)//输入页码小于0直接在第一页
            pageNo = 1;
        if (pageNo > getTotalPageNum()){
            pageNo = getTotalPageNum();
        }
        return pageNo;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    //每页显示数目
    public int getPageSize()    {
        return pageSize;
    }


    public List<T> getList() {
        return list;
    }
    public void setList(List<T> list) {
        this.list = list;
    }

    //得到总页数
    public int getTotalPageNum() {
        //总页数由总条数和，每页条数决定
        int totalPageNum = (int)totalItemNum/pageSize;
        if(totalItemNum % pageSize!= 0){//总条数/每页条数
            totalPageNum += 1;//totalPageNum ++;
        }
        return totalPageNum;
    }

    //设置总条数
    public void setTotalItemNum(long totalItemNum) {
        this.totalItemNum = totalItemNum;
    }

    public long getTotalItemNum() {
        return totalItemNum;
    }

    public boolean isHasNext(){
        //当前页码小于总页码，有下一页
        if (getPageNo() <getTotalPageNum()){
            return true;
        }
        return false;//否则没有
    }

    //是否有上一页
    public boolean isHasPrev(){
        if (getPageNo() > 1){
            return true;
        }
        return false;
    }

    //上一页
    public int getPrevPage(){
        if (isHasPrev()){//有上一页
            return getPageNo() - 1;//页码减1
        }
        return getPageNo();
    }
    //下一页
    public int getNextPage(){

        if (isHasNext()){
            return getPageNo() + 1;
        }
        return getPageNo();
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", list=" + list +
                ", pageSize=" + pageSize +
                ", totalItemNum=" + totalItemNum +
                '}';
    }

}
