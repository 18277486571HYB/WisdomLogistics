package com.buuhybWL.www.utils;

/**
 * @author 黄渝斌
 */
public class JudgeUtils {

    public static boolean ifOnlyCharacter(String s,String character){
        char ch = character.charAt(0);
        int length = s.length();
        for (int i = 0; i < length; i++) {
            if (s.charAt(i)!=ch){
                return false;
            }
        }
        return true;
    }

}
