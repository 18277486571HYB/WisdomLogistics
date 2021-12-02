package com.buuhybWL.www.utils;

import com.buuhybWL.www.bean.Msg;
import com.buuhybWL.www.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.*;

/**
 * @author 黄渝斌
 */
@Component
public class ErrorUtils {

    @Autowired
    OrderService orderService;


    public static <T extends Annotation,K> Msg getError(Class<K> className, List<Class<T>> annotations, BindingResult result, String field, String defaultValue) throws Exception {

//        设置有校验注解的属性的默认值

        Map<String, Object> map = ErrorUtils.setNullMessage(className, annotations, defaultValue);
//        如果有错，就将其代替
        if (result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors
            ) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add(field, map);
        }
        return null;
    }


    /*
     * 这个方法，主要是用来解决前端获取ajax请求后台得到的数据时，会报undefined的问题
     * 产生这个bug，是因为你输入数据全部校验成功，错误校验也就不会执行，前端获取到属性也就为undefined了
     * 而要解决这个问题，就是要当我们都校验成功的时候，让这些属性重新被定义，给个默认值，这样前端永远都不会undefined了
     *
     * 而思路是：我们可以在类Msg的add方法中，直接放入这些属性，给个默认值
     * 这样我们每次调用add方法，都会给bean 的属性加个默认值，而前台也永远不会undefined了
     *
     * 但是对于Msg这个类而言，肯定不能将具体的类写死在add方法中，所以这个方法有点不可行，只能解决短期的问题
     *
     * 所以，我们可以用到反射，我们将具体的类传进来，（将具体的注解传进来），将要给的默认值传进来
     *
     * 利用反射获取其属性名称，然后保存一个map，用的时候每次将这个map传到add里面去就可以了。
     *
     *  */

    public static <T extends Annotation, K> Map<String, Object> setNullMessage(Class<K> className, List<Class<T>> annotations, String newMessageValue) throws Exception {
//        获取这个类的一个实例
        Object t = className.newInstance();
//        获取这个实例所有的属性名，保存在一个域中
        Field[] field = t.getClass().getDeclaredFields();
//        定义个map，保存我们要修改的数据
        Map<String, Object> resultMap = new HashMap<String, Object>();

        int size = annotations.size();

        for (Class<T> annotation : annotations) {
            for (Field value : field) {


//            获取到每个属性整体
                Field declaredField = className.getDeclaredField(value.getName());

                declaredField.setAccessible(true);


//            根据这个属性整体，获取该属性的注解
                T an = declaredField.getAnnotation(annotation);
//            有些没有该校验注解的属性我们必须返回，不能要
                if (an == null) {
                    continue;
                }

//            有校验注解的属性我们就将默认值放进来，然后返回这个map
                resultMap.put(declaredField.getName(), newMessageValue);

            }
        }

        return resultMap;
    }







    /*
    * 获取注解上的某个value值
    * */
    public static <T extends Annotation, K>  Map<String, Object>  setAttributeMessage(Class<K> className, Object name,String newMessage) throws Exception {

//        获取这个类的一个实例
        Object t = className.newInstance();

        Field field= t.getClass().getDeclaredField((String) name);


        Map<String, Object> map=new HashMap<String, Object>();

        map.put(field.getName(),newMessage);


        return map;
    }



}