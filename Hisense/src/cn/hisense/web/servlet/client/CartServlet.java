package cn.hisense.web.servlet.client;

import cn.hisense.pojo.Cart;
import cn.hisense.pojo.Commodity;
import cn.hisense.pojo.ResultInfo;
import cn.hisense.pojo.User;
import cn.hisense.service.CartService;
import cn.hisense.service.impl.CartServiceImpl;
import cn.hisense.utils.MyBeanUtils;
import cn.hisense.web.servlet.BaseServlet;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/client/CartServlet")
public class CartServlet extends BaseServlet {


    CartService cartService = new CartServiceImpl();
    private ObjectMapper mapper = new ObjectMapper();
    private ResultInfo info = new ResultInfo();

    public String submitCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String caids = req.getParameter("caids");
        double sum = Double.parseDouble(req.getParameter("sum"));

        //通过caid得到listCart
        List<Cart> cartList = cartService.selectCheckCaid(caids);

        req.setAttribute("cartList",cartList);
        req.setAttribute("sum",sum);
        req.setAttribute("caids",caids);

        return "f:/WEB-INF/client/cartsubmit.jsp";

    }

    public void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {

//        Map<String, String[]> map = req.getParameterMap();
//        for (Map.Entry<String, String[]> entry : map.entrySet()) {
//            System.out.println(entry.getKey()+","+Arrays.asList(entry.getValue()));
//
//      }

        User user = (User) req.getSession().getAttribute("user");
        String uid = user.getUid();
        //User user = new User();
        user.setUid(uid);

        Cart cart = MyBeanUtils.toBean(req.getParameterMap(), Cart.class);
        Commodity commodity = MyBeanUtils.toBean(req.getParameterMap(), Commodity.class);
        System.out.println(cart);
        System.out.println(commodity);

        cart.setCommodity(commodity);
        cart.setUser(user);

        cartService.addToCart(cart);

        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);
    }


        /**
         * 查看购物车
         * @param req
         * @param resp
         * @return
         */
    public String getCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {


        System.out.println("查看购物车");
        //获取用户uid
        User user = (User) req.getSession().getAttribute("user");
        if(user!=null) {
            String uid = user.getUid();
//        if (uid==null){
//            uid = "1";
//        }
            //String uid = "1";
            List<Cart> cartList = cartService.getCart(uid);

            req.setAttribute("cartList", cartList);
        }

        return "f:/WEB-INF/client/cart.jsp";
    }

    /**
     * 修改购物数量
     * @param req
     * @param resp
     * @throws IOException
     */
    public void updateCartQuantity(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String caid = req.getParameter("caid");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        Cart cart = cartService.updateCart(caid, quantity);
        if (cart!= null){
            info.setFlag(true);
            info.setData(cart);
            mapper.writeValue(resp.getWriter(),info);
        }

    }

    /**
     * 删除购物车
     * @param req
     * @param resp
     * @throws IOException
     */
    public void delbarthCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String ids = req.getParameter("caids");
        System.out.println("id"+ids);
        cartService.delBatchCart(ids);
        info.setFlag(true);
        mapper.writeValue(resp.getWriter(),info);
    }

}
