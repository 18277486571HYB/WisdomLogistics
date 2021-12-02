package com.buuhybWL.www.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
//    状态码，
    private String code;
    private String msg;

//    用Map保存数据
    private Map<String,Object> map=new HashMap<String, Object>();

    /*
    * 报错PageInfo的数据，做链式方法
    * */
    public Msg add(String s, Object v){
        this.map.put(s,v);
        return this;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode("100");
        msg.setMsg("处理失败！");
        return msg;
    }

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode("200");
        msg.setMsg("处理成功！");
        return msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
