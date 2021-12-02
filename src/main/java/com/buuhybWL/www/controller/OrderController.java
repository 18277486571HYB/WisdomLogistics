package com.buuhybWL.www.controller;

import com.buuhybWL.www.bean.Msg;
import com.buuhybWL.www.bean.Orders;
import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.service.OrderService;
import com.buuhybWL.www.service.UserService;

import com.buuhybWL.www.utils.ErrorUtils;
import com.buuhybWL.www.utils.OrderUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author 黄渝斌
 */
@Controller
@RequestMapping(value = {"/order"})
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @Autowired
    ErrorUtils errorUtils;

    @ResponseBody
    @RequestMapping(value = {"/del"},method = RequestMethod.DELETE)
    public Msg delAction(@RequestParam(value = "orderNumber",defaultValue = "-1")String orderNumber
    ){
        if ("-1".equals(orderNumber)){
            return Msg.fail().add("delAlert","订单号为空");
        }
        boolean emptyOrderNumber = orderService.isEmptyOrderNumber(orderNumber);
        if (emptyOrderNumber){
            return Msg.fail().add("delAlert","订单号为空");
        }
        orderService.delOrderByOrderNumber(orderNumber);
        return Msg.success().add("delAlert","删除成功！");
    }

    @ResponseBody
    @RequestMapping(value = {"/delAll"},method = RequestMethod.DELETE)
    public Msg delAllAction(@RequestParam(value = "orderNumbers",defaultValue = "-1")String orderNumbers){
        if ("-1".equals(orderNumbers)){
            return Msg.fail().add("delAllAlert","订单号为空");
        }
        String[] split = orderNumbers.split("-");
        List<String> list = new ArrayList<String>(Arrays.asList(split));
        orderService.delAllOrders(list);
        return Msg.success().add("delAllAlert","删除成功！");
    }



    @ResponseBody
    @RequestMapping(value={"/others"},method=RequestMethod.POST)
    public Msg otherPayRowAction(HttpServletRequest request,@RequestParam(value = "orderNumber",defaultValue = "-1")String orderNumber
    ,@RequestParam(value = "msg",defaultValue = "other")String msg
    ){
//

        if ("-1".equals(orderNumber)||(!"payAll".equals(msg)&&!"pay".equals(msg)&&!"back".equals(msg))){
            return Msg.fail().add("payAlert","非法操作，请检查订单状态");
        }

//        如果不为空，但订单号和价格都为修改了
        String[] orders = orderNumber.split("-");
//        重置订单，将错误的订单号去除，保留有效的才能更新session域
        List<String> newOrders = new ArrayList<String>();

        if ("payAll".equals(msg)||"pay".equals(msg)){
            newOrders=orderService.resetOrders(orders, "0");
//            如果传过来的刚好是一个

            if (newOrders.size()==1){
                if(!"0".equals(orderService.queryStatusByOrderNumber(OrderUtils.parseStringBuffer(newOrders,"").toString()))){
                    return Msg.fail().add("payAlert","该订单已支付");
                }
            }

        }
        if ("back".equals(msg)){
            newOrders=orderService.resetOrders(orders, "1");
            if (newOrders.size()==1){
                if(!"1".equals(orderService.queryStatusByOrderNumber(orderNumber))){
                    return Msg.fail().add("payAlert","该订单退款");
                }
            }

        }
        if (newOrders.size()==0){
            return Msg.fail().add("payAlert","订单已全部支付");
        }
        Double prices = orderService.countPrices(newOrders);
        request.getSession().setAttribute("price",prices);
        StringBuffer stringBuffer = OrderUtils.parseStringBuffer(newOrders, "-");
        request.getSession().setAttribute("orderNumber", stringBuffer.substring(0,stringBuffer.length()-1));
        request.getSession().setAttribute("msg",msg);
        return Msg.success();
    }


//    @ResponseBody
//    @RequestMapping(value ={"/update"},method = RequestMethod.PUT)
//    public Msg updateOrderAction(HttpServletRequest request,
//         @RequestParam(value = "orderNumber",defaultValue = "-1")String orderNumber
//
//    ){
//
////        为了提醒用户，不安全，前端可以跨过这个if
//        if ("-1".equals(orderNumber)){
//            return Msg.fail().add("updateAlert","此订单号不存在");
//        }
////        必须进行一次数据库校验，若订单不存在，返回失败
//        if(orderService.isEmptyOrderNumber(orderNumber)){
//            return Msg.fail().add("updateAlert","订单号不存在！");
//        }
//
////        防止多次付款
//        String status=orderService.queryStatusByOrderNumber(orderNumber);
//        if ("1".equals(status)){
//            return Msg.fail().add("updateAlert","不可重复支付");
//        }
//        if (!"0".equals(status)){
//            return Msg.fail().add("updateAlert","此订单已为其他状态，无法支付");
//        }
//
//        Orders order = new Orders(null,null,null,"1",null,null,null,null);
//        orderService.updateOrderAttribute(order,orderNumber);
//
//
//        return Msg.success().add("updateAlert","付款成功！");
//    }

    @ResponseBody
    @RequestMapping(value = {"/update"},method = RequestMethod.PUT)
    public Msg payAllAction(@RequestParam(value = "orderNumber",defaultValue = "-1")String orderNumber){
        if ("-1".equals(orderNumber)){
            return Msg.fail().add("updateAlert","非法操作，请检查订单");
        }
//        检查订单号是否合法
        String[] orders = orderNumber.split("-");
//        重置订单，排除非法订单
        List<String> newOrders = orderService.resetOrders(orders, "0");
        for (String s:newOrders) {
            Orders newOrder = new Orders(null,null,null,"1",null,null,null);
            orderService.updateOrderAttribute(newOrder,s);
        }
        return Msg.success().add("updateAlert","支付成功！");
    }

    @ResponseBody
    @RequestMapping(value ={"/backPay"},method=RequestMethod.PUT)
    public Msg backPayAction(@RequestParam(value = "orderNumber",defaultValue = "-1")String orderNumber){

//        为了提醒用户，不安全，前端可以跨过这个if
        if ("-1".equals(orderNumber)){
            return Msg.fail().add("updateAlert","此订单号不存在");
        }
        String[] orders = orderNumber.split("-");
        List<String> newOrders = orderService.resetOrders(orders, "1");
        for (String s :
                newOrders) {
            Orders order = new Orders(null,null,null,"5",null,null,null);
            orderService.updateOrderAttribute(order,s);
        }
        return Msg.success().add("backPayAlert","退款成功");
    }

    @RequestMapping(value ={"/list"},method = RequestMethod.GET)
    public String listOrderAction(HttpServletRequest request,
    @RequestParam(value="page",defaultValue = "1") Integer page
      ,@RequestParam(value="search",defaultValue = "all") String search
    ){
        User user =(User) request.getSession().getAttribute("user");
        Integer uId = userService.queryUserIdByUserName(user.getUsername());

        if ("all".equals(search)|| "".equals(search)){
            PageHelper.startPage(page,5);
            List<Orders> orders = orderService.queryAllOrdersByUserId(uId);
            PageInfo<Orders> info = new PageInfo<Orders>(orders, 5);
            request.getSession().setAttribute("pageInfo",info);
        }else {
            List<Orders> list =orderService.queryAllOrdersByUserId(uId);
            /*
            * 每次startPage只对相邻的第一个查询数据库的方法有效
            * 而且获取到集合不能对其操作，因为获取到的对象是Page类型的
            * 而你对这个Page类型操作后，会变回List集合，但是PageHelper里又难以支持List集合转换为Page类型
            * 所以，你只能对这个集合操作后，继续操作里面的属性
            * */
            List<Orders> newList =  orderService.queryOneOrderBySearch(search, list);
            PageInfo<Orders> pageInfo = new PageInfo<Orders>(newList, 5);
            request.getSession().setAttribute("pageInfo",pageInfo);
        }
        request.getSession().setAttribute("search",search);
        return "order";
    }


}
