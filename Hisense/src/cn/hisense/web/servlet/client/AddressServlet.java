package cn.hisense.web.servlet.client;

import cn.hisense.pojo.Address;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.pojo.User;
import cn.hisense.service.AddressService;
import cn.hisense.service.impl.AddressServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/client/AddressServlet")
public class AddressServlet extends BaseServlet {


    AddressService addService = new AddressServiceImpl();
    private ObjectMapper mapper = new ObjectMapper();
    private ResultInfo info = new ResultInfo();

    public void getAddress(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();

//        String uid = "1";
        List<Address> addressList = addService.getAddressByuid(uid);

        info.setFlag(true);
        info.setData(addressList);
        mapper.writeValue(resp.getWriter(), info);

//        mapper.writeValueAsString(info);
    }

    //用户个人中心管理地址
    public String getUserAddress(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();

//        String uid = "1";
        List<Address> addressList = addService.getAddressByuid(uid);
        req.setAttribute("addressList",addressList);

        return "f:/WEB-INF/client/address.jsp";

    }

    public void getAddressByaid(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();

//        String uid = "1";
        String aid = req.getParameter("aid");
        Address address = addService.getAddressByaid(uid, aid);
        info.setFlag(true);
        info.setData(address);
        mapper.writeValue(resp.getWriter(), info);

    }

    public void updateAddressByuid(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        user.getUid();

//        String uid = "1";
        Address address = MyBeanUtils.toBean(req.getParameterMap(), Address.class);
        System.out.println(address);
        addService.updateAddress( user.getUid(), address);
        info.setFlag(true);
        mapper.writeValue(resp.getWriter(), info);
    }

    public void addAddress(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();

//        String uid = "1";
        Address address = MyBeanUtils.toBean(req.getParameterMap(), Address.class);
        address.setAid(MyBeanUtils.uuid());
        address.setUid(uid);
        address.setAdefault(0);
        address.setAdstatus(1);
        System.out.println(address);
        addService.addAddress(address);

        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);

    }

    public void delAddress(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();

//        String uid = "1";
        String aid = req.getParameter("aid");
        addService.delAddress(uid,aid);

        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);

    }

}