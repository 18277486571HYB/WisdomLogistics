package com.buuhybWL.www.controller;


import com.buuhybWL.www.bean.Orders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * @author 黄渝斌
 */
@Controller
public class NavController {

    @RequestMapping(value = "/nav/{string}",method = RequestMethod.GET)
    public String otherBtn(@PathVariable("string") String string){
        return string;
    }

    @GetMapping(value = "/nav/list")
    public String listAction(HttpServletRequest request){
        byte[] data = null;
        // 读取图片字节数组
        try {
            InputStream in = new FileInputStream("E:\\1.0.png");
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("image","data:image/png;base64,"+ encoder.encode(Objects.requireNonNull(data)));
        request.getSession().setAttribute("result",map);
        return "ak";
    }

}
