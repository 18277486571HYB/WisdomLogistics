package com.buuhybWL.www.service;

import com.buuhybWL.www.bean.Orders;
import com.buuhybWL.www.bean.OrdersExample;
import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.dao.OrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


/**
 * @author 黄渝斌
 */
@Service
public class OrderService {

    @Autowired
    OrdersMapper ordersMapper;


    @Autowired
    UserService userService;


    public Orders createOrder(HttpServletRequest request,String phone,Double price,String orderIdByTime ) throws ParseException {
//              获取当前时间
        Date date = new Date(new java.util.Date().getTime());

//        将订单号插入到订单表中
        User user =(User) request.getSession().getAttribute("user");
        Integer uId = userService.queryUserIdByUserName(user.getUsername());
        Orders order = new Orders(null,orderIdByTime,date,"0",null,price,uId);
        ordersMapper.insertSelective(order);
        return order;
    }


    public void updateOrderAttribute(Orders order,String attributeNumber) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(attributeNumber);
        ordersMapper.updateByExampleSelective(order,e);
    }

    public String queryStatusByOrderNumber(String number) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(number);
        List<Orders> orders = ordersMapper.selectByExample(e);
        return orders.get(0).getoStatus();
    }

    public List<Orders> queryAllOrdersByUserId(Integer uId) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andOUidEqualTo(uId);
        return  ordersMapper.selectByExample(e);
    }

    public  List<Orders> queryOneOrderBySearch(String search, List<Orders> orders) {

        List<Orders> list=new ArrayList<Orders>();
        for (Orders order : orders) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String format = simpleDateFormat.format(order.getoDate());
            String string = order.getoNumber()
                    + order.getoStatus()
                    + format
                    + order.getoPrice()
                    + order.getoSId() + "";
            if (string.contains(search)) {
                list.add(order);
            }
        }
        return list;
    }

    public boolean isEmptyOrderNumber(String orderNumber) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(orderNumber);
        List<Orders> list = ordersMapper.selectByExample(e);
        return list.size()==0;
    }

    public void delOrderByOrderNumber(String number) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(number);
        ordersMapper.deleteByExample(e);
    }

    public void delAllOrders(List<String> list) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberIn(list);
        ordersMapper.deleteByExample(e);
    }

    public Orders queryOneOrderByOrderNumber(String orderNumber) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(orderNumber);
        List<Orders> list = ordersMapper.selectByExample(e);
        if (list.size()==0){
            return null;
        }
        return list.get(0);
    }


    //    支付状态的检查，只有价格不为0.00，状态为0,且msg为pay的才可以 支付
//    退款状态的检查，只有价格不为0.00 状态为1，且msg为back才可以 退款
    public  double countPrices(String[] orderNumbers, String status){
        double prices=0;
        for (String s :
                orderNumbers) {
            Orders order = queryOneOrderByOrderNumber(s);
            if (order.getoPrice()==0){
                continue;
            }else if (!status.equals(order.getoStatus())){
                continue;
            }
            prices+=order.getoPrice();
        }
        return prices;
    }

    public  Double countPrices(List<String> orderNumbers){
        double prices=0;
        for (String s : orderNumbers) {
            Orders order = queryOneOrderByOrderNumber(s);
            prices+=order.getoPrice();
        }
        return prices;
    }

    public List<String> resetOrders(String[] orderNumbers, String status){
        List<String> orders=new ArrayList<String>();
        for (String orderNumber : orderNumbers) {
            Orders order = queryOneOrderByOrderNumber(orderNumber);
            if (order==null){
                continue;
            }
            if (order.getoPrice() == 0) {
                continue;
            } else if (!status.equals(order.getoStatus())) {
                continue;
            }
            orders.add(orderNumber);
        }
        return orders;
    }

//    判断事件是否已经执行过一遍
    public boolean isSecondUpdateByOrderNumber(String orderNumber,String checkStatus){
        OrdersExample e = new OrdersExample();
        e.createCriteria().andONumberEqualTo(orderNumber);
        List<Orders> list = ordersMapper.selectByExample(e);
        return list.size() == 0 || !checkStatus.equals(list.get(0).getoStatus());
    }

    public List<String> queryallNumbersByIdStatus(Integer id, String status) {
        OrdersExample e = new OrdersExample();
        e.createCriteria().andOUidEqualTo(id).andOStatusEqualTo(status);
        List<String> newList=new ArrayList<String>();
        List<Orders> list = ordersMapper.selectByExample(e);
        if (list.size()==0){
            return null;
        }
        for (Orders order :
                list) {
            newList.add(order.getoNumber());
        }
        return newList;
    }
}
