package com.buuhybWL.www.controller;

import com.buuhybWL.www.bean.Logistics;
import com.buuhybWL.www.bean.Msg;
import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.bean.pageAddress;
import com.buuhybWL.www.service.AddressService;
import com.buuhybWL.www.service.UserService;
import com.buuhybWL.www.utils.ErrorUtils;
import com.buuhybWL.www.utils.JudgeUtils;
import com.buuhybWL.www.utils.OrderUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/address")
public class AddressController {

    @Autowired
    AddressService addressService;

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping(value="/add",method = RequestMethod.PUT)
    public <T extends Annotation> Msg addAction(@Valid pageAddress address, BindingResult result, HttpServletRequest request) throws Exception {

        List<Class<T>> list=new ArrayList<Class<T>>();
        list.add((Class<T>) Pattern.class);
        list.add((Class<T>) NotBlank.class);
        Msg error = ErrorUtils.getError(pageAddress.class, list, result, "result", "undefined");
        if (error!=null){return error;}


        Map<String, Object> map = ErrorUtils.setNullMessage(pageAddress.class, list, "undefined");
//        由于我们地址栏为空时也会有逗号隔开，所以要判断是否为空，不然地址栏不进行选择
        String pAddress="pAddress";
        map.put(pAddress,"undefined");
        String[] split = address.getpAddress().split(",");
        String s = OrderUtils.parseString(split);
        if(s==null||"".equals(s)||s.contains("请选择")||s.contains("城市")){
            map.put(pAddress,"地址栏不完整");
            return Msg.fail().add("result",map);
        }
        User user =(User) request.getSession().getAttribute("user");
        Integer id = userService.queryUserIdByUserName(user.getUsername());
        address.setuId(id);
        addressService.insertAddress(address);
        return Msg.success().add("result",map);
    }

    @ResponseBody
    @RequestMapping(value = "/del",method = RequestMethod.DELETE)
    public Msg delAction(@RequestParam(value = "id",defaultValue = "0")Integer id){
        if (id==0){
            return Msg.fail();
        }
        addressService.delAddress(id);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public <T extends Annotation> Msg updateAction(@Valid pageAddress address,BindingResult result,@RequestParam(value = "id",defaultValue = "-1")Integer id, HttpServletRequest request) throws Exception {
        List<Class<T>> list=new ArrayList<Class<T>>();
        list.add((Class<T>) Pattern.class);
        list.add((Class<T>) NotBlank.class);
        Msg error = ErrorUtils.getError(pageAddress.class, list, result, "result", "undefined");
        if (error!=null){return error;}


        Map<String, Object> map = ErrorUtils.setNullMessage(pageAddress.class, list, "undefined");
//        由于我们地址栏为空时也会有逗号隔开，所以要判断是否为空，不然地址栏不进行选择
        String pAddress="pAddress";
        map.put(pAddress,"undefined");
        String[] split = address.getpAddress().split(",");
        String s = OrderUtils.parseString(split);
        if(s==null||"".equals(s)||s.contains("请选择")||s.contains("城市")){
            map.put(pAddress,"地址栏不完整");
            return Msg.fail().add("result",map);
        }
        address.setId(id);
        addressService.updateAddress(address);
        return Msg.success().add("result",map);
    }

    @GetMapping(value ="/selectAll")
    public String selectAllAction(@RequestParam(value="page",defaultValue = "1")Integer page, HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("user");
        Integer uId = userService.queryUserIdByUserName(user.getUsername());
        PageHelper.startPage(page,5);
        List<pageAddress> list = addressService.selectAll(uId);
        if (list.size()==0){
            request.getSession().setAttribute("addresses",null);
            return "address";
        }
        request.getSession().setAttribute("addresses",new PageInfo<pageAddress>(list,5));
        return "address";
    }


    @ResponseBody
    @GetMapping(value ="/selectDetail")
    public Msg selectDetailAction(@RequestParam(value="page",defaultValue = "1")Integer page, HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("user");
        Integer uId = userService.queryUserIdByUserName(user.getUsername());
        PageHelper.startPage(page,5);
        List<pageAddress> list = addressService.selectDetail("1",uId);
        if (list.size()==0){
            return Msg.fail();
        }
        return Msg.success().add("pageInfo",new PageInfo<pageAddress>(list,5));
    }


    @ResponseBody
    @RequestMapping(value="/delAll",method = RequestMethod.DELETE)
    public Msg delAllAction(@RequestParam(value = "ids",defaultValue = "0")String ids,HttpServletRequest request){
        if (ids.length()==0){
            return Msg.fail().add("delAlert","订单已全部删除");
        }
        String[] strings = ids.split("-");
        List<Integer> list=new ArrayList<Integer>();
        for (String str:
             strings) {
            list.add(Integer.parseInt(str));
        }
        addressService.delPathAddress(list);
        request.getSession().setAttribute("addresses",null);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value="/setHobby",method=RequestMethod.PUT)
    public Msg setHobbyAddressesAction(@RequestParam(value="id")Integer  id,HttpServletRequest request){
        pageAddress address = new pageAddress(id, null, null, null, "1", null);
        addressService.updateAddress(address);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value="/setHobbies",method=RequestMethod.PUT)
    public Msg setHobbiesAddressesAction(@RequestParam(value="ids")String  ids){
        pageAddress address = new pageAddress(null, null, null, null, "1", null);
        List<Integer> list=new ArrayList<Integer>();
        String[] split = ids.split("-");
        for (String str:
             split) {
            list.add(Integer.parseInt(str));
        }
        addressService.updatePathAddress(address,list);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value="/delHobby",method = RequestMethod.PUT)
    public Msg delHobbyAction(@RequestParam("id")Integer id){
        pageAddress address = new pageAddress(id, null, null, null, "0", null);
        addressService.updateAddress(address);
        return Msg.success();
    }
}
