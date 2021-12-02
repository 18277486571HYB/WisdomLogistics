package com.buuhybWL.www.controller;

import com.buuhybWL.www.bean.Logistics;
import com.buuhybWL.www.bean.Msg;
import com.buuhybWL.www.bean.Orders;
import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.service.LogisticsService;
import com.buuhybWL.www.service.OrderPriceService;
import com.buuhybWL.www.service.OrderService;
import com.buuhybWL.www.service.UserService;
import com.buuhybWL.www.utils.ErrorUtils;
import com.buuhybWL.www.utils.JudgeUtils;
import com.buuhybWL.www.utils.OrderUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.validation.Valid;
import jakarta.validation.constraints.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 黄渝斌
 */
@Controller
@RequestMapping("/logistics")
public class  LogisticsController {

    @Autowired
    LogisticsService logisticsService;

    @Autowired
    OrderPriceService orderPriceService;

    @Autowired
    OrderService orderService;

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(value = {"/toLogistics"},method = RequestMethod.POST)
    public <T extends Annotation>  Msg toLogisticsAction(@Valid Logistics logistics,
    BindingResult result, @RequestParam(value = "weight",defaultValue = "1") Integer weight,
    @RequestParam(value = "kinds",defaultValue = "1") String kinds,
    HttpServletRequest request
    ) throws Exception {
//        定义集合，设置所有的校验注解的默认值，防止前端出现莫名错误
        List<Class<T>> list= new ArrayList<Class<T>>();
        list.add((Class<T>) Pattern.class);
        list.add((Class<T>) NotBlank.class);
        list.add((Class<T>) Min.class);

//      获取错误，传入类，和当前绑定的错误，在这个错误的方法里，我们调用了一次setNullMessage(...)
//        field 代表要将错误保存的域，这个域要和你保存默认值的域一样
//        后面给了一个默认值
        Msg error = ErrorUtils.getError(Logistics.class,list,result,"result","undefined");

        if (error!=null) {
            return error;
        }
//        上面有了错误会返回，我们设置了默认值，
//        但是没有了校验错误，可能还有其他错误，所以也要设计默认值，
//        这个其他错误，举个例子：如果没有jsr303的校验错误。
//        而你还需要校验其他错误，也要判断是否undefined，这样前端也会出现类似的问题
        Map<String, Object> map = ErrorUtils.setNullMessage(Logistics.class, list, "undefined");

//        由于我们地址栏为空时也会有逗号隔开，所以要判断是否为空，不然地址栏不进行选择
        String addressText_1="addressText_1";
        String addressText_2="addressText_1";
        map.put(addressText_1,"undefined");
        map.put(addressText_2,"undefined");
        String[] split_1 = logistics.getToAddress().split(",");
        String[] split_2 = logistics.getAddress().split(",");
        String s1 = OrderUtils.parseString(split_1);
        String s2 = OrderUtils.parseString(split_2);
        if (s1==null||"".equals(s1)||logistics.getAddress().contains("请选择")||logistics.getToAddress().contains("请选择")
        ||logistics.getToAddress().contains("城市")||logistics.getAddress().contains("城市")
        ) {
            map.put(addressText_1,"地址栏不完整");
            return Msg.fail().add("result",map);
        }

        if (s2==null||"".equals(s2)||logistics.getToAddress().contains("请选择")){
            map.put(addressText_2,"地址栏不完整");
            return Msg.fail().add("result",map);
        }


//        产生价格
        Double price = orderPriceService.getPrice(weight, kinds);

//        产生订单号
//        获取用户id产生订单号
        User user = (User) request.getSession().getAttribute("user");
        Integer userId=userService.getUserIdbyUsername(user.getUsername());
        String orderNumberByTime= OrderUtils.getOrderIdByTime(userId);
//        保存订单号
        Orders order=orderService.createOrder(request,logistics.getPhone(),price,orderNumberByTime);
//        产生物流信息
        Logistics newLogistics = new Logistics(
                null,logistics.getToAddress(),logistics.getToName(),
                logistics.getToPhone(),logistics.getAddress(),
                logistics.getName(),logistics.getPhone(),
                logistics.getWay(),weight,
                price,kinds,orderNumberByTime,order);

        logisticsService.create(newLogistics);
        request.getSession().setAttribute("price",price);
        request.getSession().setAttribute("orderNumber",orderNumberByTime);
        request.getSession().setAttribute("msg","createOrder");
        return  Msg.success().add("result",map);
    }


    @ResponseBody
    @RequestMapping(value="/qyN",method = RequestMethod.GET)
    public Msg queryByNumberAction(@RequestParam("number")String number){
        List<Logistics> logistics = logisticsService.queryByNumber(number);
        if (logistics.size()==0){
            return Msg.fail().add("alert","该订单不存在！");
        }
        return Msg.success().add("msg",logistics.get(0));
    }

    @ResponseBody
    @GetMapping(value="/qyP")
    public Msg queryByPhoneAction(@RequestParam(value = "phone",defaultValue = "0")String phone,@RequestParam(value = "page",defaultValue = "1")Integer page){
        PageHelper.startPage(page,4);
        List<Logistics> logistics = logisticsService.queryByPhone(phone);
        if (logistics.size()==0){
            return Msg.fail();
        }
        return Msg.success().add("pageInfo",new PageInfo<Logistics>(logistics,4));
    }

}
