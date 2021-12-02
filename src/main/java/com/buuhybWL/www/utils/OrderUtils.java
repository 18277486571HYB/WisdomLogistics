package com.buuhybWL.www.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author 黄渝斌
 */
public class OrderUtils {


    public static String getOrderIdByTime(Integer id) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        StringBuilder result= new StringBuilder();
        Random random=new Random();
        for(int i=0;i<3;i++){
            result.append(random.nextInt(10));
        }
        return id+newDate+result;
    }

    public static StringBuffer parseStringBuffer(List<String> strings, String character){
        StringBuffer str = new StringBuffer();
        for (String s: strings) {
            str.append(s).append(character);
        }
        return str;
    }

    public static String parseString(Object[] strings){
        String s="";
        for (int i = 0; i < strings.length; i++) {
           s+=strings[i];
        }
        return s;
    }
}
