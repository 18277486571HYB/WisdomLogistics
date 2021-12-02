package com.buuhybWL.www.controller;

import com.buuhybWL.www.bean.Logistics;
import com.buuhybWL.www.bean.Msg;
import com.buuhybWL.www.bean.Orders;
import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.service.LogisticsService;
import com.buuhybWL.www.service.OrderService;
import com.buuhybWL.www.service.UserService;

/*必须导入Javax的包*/
//import javax.validation.Valid;

import com.buuhybWL.www.utils.ErrorUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wf.captcha.utils.CaptchaUtil;
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
@RequestMapping(value ="/user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    OrderService orderService;

    @Autowired
    LogisticsService logisticsService;

    @RequestMapping(value = {"/loginIn"},method = RequestMethod.POST)
    @ResponseBody
    public Msg loginInAction(User user, HttpServletRequest request, @RequestParam("checkedcode") String checkedcode){
//        从框架中获取当前页面的验证码
//        和传入的验证码进行比较
//        记住比较后要立马进行删除，防止再次使用
        List<User> obj= userService.getUserByName(user.getUsername());
        for (User queryUser:obj) {
            if (queryUser.getUsername().equals(user.getUsername())&&queryUser.getPassword().equals(user.getPassword())){
                request.getSession().setAttribute("user",user);
                Msg msg = Msg.success().add("msg", "");
                if (!CaptchaUtil.ver(checkedcode, request)) {
                    CaptchaUtil.clear(request);
                    msg.add("checkedText","验证码不正确").add("checked",false);
                }else {
//                保存一个url，方便定位到哪张页面
//                值得注意的是，当在首页的时候，这个url为空
                    Object url = request.getSession().getAttribute("url");
                    if (url==null){
                        msg.add("url",request.getContextPath()+"/nav/index");
                    }else {
                        msg.add("url",url);
                    }
                    msg.add("checkedText","").add("checked",true);
                }
                return msg;
            }
        }
        return Msg.fail().add("msg","用户名或密码不正确").add("checkedText","");

    }

    @RequestMapping(value = {"/loginOut"})
    public String loginOutAction(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }


    @RequestMapping(value ={"/register"},method = RequestMethod.POST)
    @ResponseBody
    public <T extends Annotation> Msg registerAction(
            @Valid User user,
            BindingResult result,
            @RequestParam(value = "checkedcode",defaultValue = "-1")String checkedcode ,
            @RequestParam(value = "confirmPassword",defaultValue = "-1") String confirmPassword,
            HttpServletRequest request) throws Exception {

        List<Class<T>> list=new ArrayList<Class<T>>();
        list.add((Class<T>) Pattern.class);


        Msg error = ErrorUtils.getError(User.class,list,result,"resultMap","undefined");
        if (error!=null){
            return error;
        }
        Map<String, Object> undefined = ErrorUtils.setNullMessage(User.class,list,"undefined");
        boolean isNotEmpty=userService.queryIsEmptyUserName(user.getUsername());
        if (isNotEmpty){
            return Msg.fail().add("resultMap",undefined).add("isEmpty",false).add("isEmptyText","用户名已存在").add("confirm",true).add("confirmText","");
        }
        if (!confirmPassword.equals(user.getPassword())){
            return Msg.fail().add("resultMap",undefined).add("isEmpty",true).add("isEmptyText","").add("confirm",false).add("confirmText","两次密码必须一致");
        }
        if (!CaptchaUtil.ver(checkedcode, request)) {
            CaptchaUtil.clear(request);
            return Msg.success().add("resultMap",undefined)
                    .add("isEmpty",true)
                    .add("isEmptyText","")
                    .add("checkedText","验证码不正确").add("checked",false);
        }
        User newUser = new User(null,user.getUsername(),user.getPassword()
                ,user.getEmail(),user.getPhone(),"1");
        userService.createUser(newUser);
        return Msg.success().add("resultMap",undefined)
                .add("isEmpty",true)
                .add("isEmptyText","")
                .add("checkedText","")
                .add("checked",true);
    }

    @GetMapping(value="/list")
    public String listAction(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<User> oldUser = userService.getUserByName(user.getUsername());
        if (oldUser.size()==0){
            request.getSession().setAttribute("userMsg",null);
            return "user";
        }
        request.getSession().setAttribute("userMsg",oldUser.get(0));
        return "user";
    }

    @ResponseBody
    @RequestMapping(value="/update",method = RequestMethod.PUT)
    public <T extends Annotation> Msg updateAction(@Valid User user,BindingResult result,HttpServletRequest request) throws Exception {
//        给校验注解设计默认值
        List<Class<T>> list=new ArrayList<Class<T>>();
        list.add((Class<T>) Pattern.class);
        Msg error = ErrorUtils.getError(User.class, list, result, "resultMap", "undefined");
        if (error!=null){
            return error;
        }
//        判断用户名是否存在
        Map<String, Object> undefined = ErrorUtils.setNullMessage(User.class,list,"undefined");
        User oldUser =(User) request.getSession().getAttribute("user");
        if (!oldUser.getUsername().equals(user.getUsername())){
            boolean isNotEmpty=userService.queryIsEmptyUserName(user.getUsername());
            if (isNotEmpty){
                return Msg.fail().add("resultMap",undefined).add("isEmptyText","用户名已存在");
            }
        }
//        新密码和旧密码不能相同
        if (oldUser.getPassword().equals(user.getPassword())){
            return Msg.fail().add("resultMap",undefined).add("isEmptyText","").add("confirmText","新密码和旧密码不能一致");
        }
//        更新数据库
        userService.updateUser(user,oldUser);
//        更新session域
        oldUser.setUsername(user.getUsername());
        oldUser.setPassword(user.getPassword());
        request.getSession().setAttribute("user",oldUser);
        return Msg.success().add("resultMap","更新成功！").add("isEmptyText","").add("confirmText","");
    }

    @GetMapping(value = "/detail")
    public String userDetailAction(@RequestParam(value = "page",defaultValue = "1")Integer page,@RequestParam(value = "status",defaultValue = "3")String status, HttpServletRequest request){
        User user=(User) request.getSession().getAttribute("user");
        Integer id = userService.queryUserIdByUserName(user.getUsername());
        List<String> orders = orderService.queryallNumbersByIdStatus(id, status);
        if (orders==null){
            request.getSession().setAttribute("pageInfo",null);
            request.getSession().setAttribute("status",status);
            return "myOrder";
        }
        PageHelper.startPage(page,5);
        List<Logistics> logisticses=logisticsService.queryBathLogistics(orders);
        request.getSession().setAttribute("pageInfo",new PageInfo<Logistics>(logisticses,5));
        request.getSession().setAttribute("status",status);
        return "myOrder";
    }
}


