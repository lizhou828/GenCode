/*
 *Project: credentials
 *File: com.glorypty.credentials.core.utils.CookieUtils.java <2018年01月12日}>
 ****************************************************************
 * 版权所有@2015 国裕网络科技  保留所有权利.
 ***************************************************************/

package com.liz.utils;

/**
 * cookie工具类
 * 功能：主要用于 在用户登陆后，校验cookie中的数据是否被篡改
 * 实现：
 *      1、登陆之后对当前域中的 JSESSIONID的值，进行加密,增加一个cookie进行保存
 *      2、登陆之后的操作，在过滤器中进行处理：在coookie中 获取保存的这个cookie的值，验证JSESSIONID是否被篡改
 * @author lizhou
 * @version 1.0
 * @Date 2018年01月12日 09时23分
 */
public class CookieUtils {
    private static String privateEncryptKey = "*scxn%iz53F0Z$87rky6&gnuecH%mzv7Jsglt0sK2S2tOa4pQ$0*x@i6Q5VYhwWoJK2LC#U%4Kwau^kbBCIC188EyYY!*KEvP^a";

    private static String domainSign = "_gsp_gr158_";

    public static final String split = "|";

    public static final String SAFE_COOKIE_NAME = "gspKey"; //gr158 key的简写


    /* 加密(对源字符串加密) */
    public static String encrypt(String cookieValue){
        if(!StringUtil.isValid(cookieValue)){
            return "";
        }
        return md5Encrypt(cookieValue);
    }

    /**
     * 校验 cookieValue的合法性
     * @param cookieValue 加密后的cookie值
     * @return false 表示 cookieValue被篡改，true表示验证成功
     * @author lizhou
     * @version v 1.0
     * @Date 2017-11-16 15:50:31
     */
    public static boolean validate(String cookieValue,String encryptCookieValue){
        if(!StringUtil.isValid(cookieValue) || !StringUtil.isValid(encryptCookieValue)){
            return false;
        }
        return encryptCookieValue.equals(md5Encrypt(cookieValue));
    }

    private static String md5Encrypt(String src){
        String result = MDUtil.md5Encrypt(src + domainSign + privateEncryptKey);
        return MDUtil.md5Encrypt(result);
    }

    public static void main(String[] args) {
        String jessionID = "9A0AD008B9C0BDCE155923D37201752A";
        String str = encrypt(jessionID);
        System.out.println(str);
        System.out.println(validate(jessionID,str));
        System.out.println("篡改后去校验" + validate("9A0AD008B9C0BDCE155923D37201752B",str));
    }
}
