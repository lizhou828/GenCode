package com.liz.utils;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by TonyZeng on 2017/2/24.
 */
public class StringUtil {

    private static List<Pattern> patterns = null;

    private static Logger logger = LoggerFactory.getLogger(StringUtil.class);

    /**
     * 插入换行符<br/>
     *
     * @param source
     * @param span   每隔x这个字符就插入一个换行符
     * @return
     */
    public static String insertBreakChar(String source, int span) {
        StringBuilder result = new StringBuilder();
        if (source != null) {
            char[] charArray = source.toCharArray();
            int count = 0;
            for (char x : source.toCharArray()) {
                count++;
                result.append(x);
                //如果到了跨度值，则插入，并将计数器归0
                if (count == span) {
                    result.append("<br/>");
                    count = 0;
                }
            }
        }
        return result.toString();
    }

    /**
     * 去掉结尾指定字符
     *
     * @param input
     * @param charsToTrim
     * @return
     */
    public static String trimEnd(String input, String charsToTrim) {
        return input.replaceAll("[" + charsToTrim + "]+$", "");
    }

    /**
     * 去掉开头指定字符
     *
     * @param input
     * @param charsToTrim
     * @return
     */
    public static String trimStart(String input, String charsToTrim) {
        return input.replaceAll("^[" + charsToTrim + "]+", "");
    }

    /**
     * 去掉首尾指定字符
     *
     * @param input
     * @param charsToTrim
     * @return
     */
    public static String trim(String input, String charsToTrim) {
        return input.replaceAll("^[" + charsToTrim + "]+|[" + charsToTrim + "]+$", "");
    }


    /**
     * 去掉首尾指定字符
     *
     * @param input
     * @param charsToTrim 只要首尾的字符是此字符数字中包含的，就会被去掉
     * @return
     */
    public static String trim(String input, char[] charsToTrim) {
        if (input == null || input.equals("") || charsToTrim.length == 0)
            return "";
        int start = 0, end = 0;
        for (char c : charsToTrim) {
            if (input.indexOf(c) == 0) {
                if (start == 1) continue;
                input = input.substring(1);
                start++;
            }
            if (input.lastIndexOf(c) == input.length() - 1) {
                if (end == 1) continue;
                input = input.substring(0, input.length() - 1);
                end++;
            }
        }
        return input;
    }

    /**
     * @param input
     * @param regex 分隔符
     * @return
     */
    public static List<String> splitToStringList(String input, String regex) {
        List<String> result = new ArrayList<>();
        if (input != null && !input.equals("")) {
            String[] strArray = input.split(regex);

            for (String x : strArray) {
                result.add(x);
            }
        }
        return result;
    }

    /**
     * @param input
     * @param regex 分隔符
     * @return
     */
    public static List<Long> splitToLongList(String input, String regex) {
        List<Long> result = new ArrayList<>();
        if (input != null && !input.equals("")) {
            String[] strArray = input.split(regex);

            for (String x : strArray) {
                result.add(Long.parseLong(x));
            }
        }
        return result;
    }

    /**
     * 把String数组 转 Long 数组
     *
     * @param args String数组
     * @return Long数组
     */
    public static Long[] StringsToLongs(String[] args) {
        if (args == null || args.length < 1) {
            return null;
        }
        Long[] arr = new Long[args.length];
        for (int i = 0; i < args.length; i++) {
            arr[i] = Long.valueOf(args[i]);
        }
        return arr;
    }

    /**
     * 将long数组组合成分隔符分隔的字符串
     *
     * @param list
     * @param regex 分隔符
     * @return
     */
    public static String longListToString(List<Long> list, String regex) {
        String result = "";
        if (list != null && list.size() > 0) {
            for (Long x : list) {
                result += x + regex;
            }
        }
        return trimEnd(result, regex);
    }

    /**
     * 将int数组组合成分隔符分隔的字符串
     *
     * @param list
     * @param regex 分隔符
     * @return
     */
    public static String integerListToString(List<Integer> list, String regex) {
        String result = "";
        if (list != null && list.size() > 0) {
            for (Integer x : list) {
                result += x + regex;
            }
        }
        return trimEnd(result, regex);
    }

    /**
     * 将String数组组合成分隔符分隔的字符串
     *
     * @param list
     * @param regex 分隔符
     * @return
     */
    public static String stringListToString(List<String> list, String regex) {
        String result = "";
        if (list != null && list.size() > 0) {
            for (String x : list) {
                result += x + regex;
            }
        }
        return trimEnd(result, regex);
    }

    /**
     * 将String数组组合成分隔符分隔的字符串
     *
     * @param list
     * @param regex 分隔符
     * @return
     */
    public static String stringListToString(Object[] list, String regex) {
        String result = "";
        if (list != null && list.length > 0) {
            for (int i = 0; i < list.length; i++) {
                result += list[i] + regex;
            }
        }
        return trimEnd(result, regex);
    }

    /**
     * 把String数组 转Integer 数组
     *
     * @param args String数组
     * @return Integer数组
     */
    public static Integer[] StringsToIntegers(String[] args) {
        if (args == null || args.length < 1) {
            return null;
        }
        Integer[] arr = new Integer[args.length];
        for (int i = 0; i < args.length; i++) {
            arr[i] = Integer.valueOf(args[i]);
        }
        return arr;
    }

    /**
     * 把String类型转 Timestamp
     *
     * @param time String类型的时间
     * @return Timestamp
     */
    public static Timestamp StringToTimestamp(String time) {
        if (isNotValid(time)) {
            return null;
        }
        if (time.length() < 12) {
            time += " 00:00:00";
        }
        return Timestamp.valueOf(time);
    }

    static final Pattern reUnicode = Pattern.compile("\\\\u([0-9a-zA-Z]{4})");

    /**
     * 转换输入字符串中的任何转义字符。
     *
     * @param str 包含要转换的文本的输入字符串。
     * @return 包含任何转换为非转义形式的转义字符的字符串。
     */
    public static String unEscape(String str) {
        Matcher m = reUnicode.matcher(str);
        StringBuffer sb = new StringBuffer(str.length());
        while (m.find()) {
            m.appendReplacement(sb,
                    Character.toString((char) Integer.parseInt(m.group(1), 16)));
        }
        m.appendTail(sb);
        return sb.toString();
    }

    /**
     * 获取一定长度的随机字符串，包含数字和小写字母
     *
     * @param length 指定字符串长度
     * @return 一定长度的字符串
     */
    public static String getRandomStringByLength(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 充值使用的随机生成的订单号
     *
     * @return
     */
    public static String getTradeNo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(new Date()) + getRandomStringByLength(6);
    }

    /**
     * 资金流水使用的流水号生成
     *
     * @return
     */
    public static String getSerialNo() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        return sdf.format(new Date()) + getRandomStringByLength(8);
    }

    /**
     * 转换驼峰命名方式
     *
     * @param name
     * @return
     */
    public static String toCapitalizeCamelCase(String name) {
        if (name == null) {
            return null;
        }
        //name = name.toLowerCase();

        StringBuilder sb = new StringBuilder(name.length());
        boolean upperCase = false;
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);

            if (c == '_') {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(c));
                upperCase = false;
            } else {
                sb.append(c);
            }
        }
        name = sb.toString();
        return name.substring(0, 1).toUpperCase() + name.substring(1);
    }

    public static boolean isNotValid(String string) {
        return string == null || "".equals(string) || "".equals(string.trim()) || "null".equalsIgnoreCase(string);
    }
    public static boolean isValid(String string) {
        return !isNotValid(string);
    }



    private static List<Object[]> getXssPatternList() {
        ArrayList ret = new ArrayList();
        ret.add(new Object[]{"<(no)?script[^>]*>.*?</(no)?script>", Integer.valueOf(2)});
        ret.add(new Object[]{"eval\\((.*?)\\)", Integer.valueOf(42)});
        ret.add(new Object[]{"expression\\((.*?)\\)", Integer.valueOf(42)});
        ret.add(new Object[]{"(javascript:|vbscript:|view-source:)*", Integer.valueOf(2)});
        ret.add(new Object[]{"<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>", Integer.valueOf(42)});
        ret.add(new Object[]{"(window|location|window\\.location|window\\.|\\.location|document\\.cookie|document\\.|alert\\(.*?\\)|window\\.open\\()*", Integer.valueOf(42)});
        ret.add(new Object[]{"<+\\s*\\w*\\s*(oncontrolselect|oncopy|oncut|ondataavailable|ondatasetchanged|ondatasetcomplete|ondblclick|ondeactivate|ondrag|ondragend|ondragenter|ondragleave|ondragover|ondragstart|ondrop|onerror=|onerroupdate|onfilterchange|onfinish|onfocus|onfocusin|onfocusout|onhelp|onkeydown|onkeypress|onkeyup|onlayoutcomplete|onload|onlosecapture|onmousedown|onmouseenter|onmouseleave|onmousemove|onmousout|onmouseover|onmouseup|onmousewheel|onmove|onmoveend|onmovestart|onabort|onactivate|onafterprint|onafterupdate|onbefore|onbeforeactivate|onbeforecopy|onbeforecut|onbeforedeactivate|onbeforeeditocus|onbeforepaste|onbeforeprint|onbeforeunload|onbeforeupdate|onblur|onbounce|oncellchange|onchange|onclick|oncontextmenu|onpaste|onpropertychange|onreadystatechange|onreset|onresize|onresizend|onresizestart|onrowenter|onrowexit|onrowsdelete|onrowsinserted|onscroll|onselect|onselectionchange|onselectstart|onstart|onstop|onsubmit|onunload)+\\s*=+", Integer.valueOf(42)});
        return ret;
    }

    private static List<Pattern> getPatterns() {
        if(patterns == null) {
            ArrayList list = new ArrayList();
            String regex = null;
            Integer flag = null;
            boolean arrLength = false;
            Iterator var4 = getXssPatternList().iterator();

            while(var4.hasNext()) {
                Object[] arr = (Object[])var4.next();
                int var7 = arr.length;

                for(int i = 0; i < var7; ++i) {
                    regex = (String)arr[0];
                    flag = (Integer)arr[1];
                    list.add(Pattern.compile(regex, flag.intValue()));
                }
            }

            patterns = list;
        }

        return patterns;
    }
//    public static String cleanXSS(String value) {
//        if(isValid(value)) {
//            if(value.contains("\\x")) {
//                value = value.replaceAll("\\\\x", "%");
//            }
//
//            if(value.contains("%")) {
//                try {
//                    value = URLDecoder.decode(value, "utf-8");
//                } catch (IllegalArgumentException e) {
//                    logger.error("value-->{}", value);
//                    e.printStackTrace();
//                } catch (UnsupportedEncodingException var4) {
//                    var4.printStackTrace();
//                }
//            }
//
//            Matcher matcher = null;
//            Iterator var2 = getPatterns().iterator();
//
//            while(var2.hasNext()) {
//                Pattern pattern = (Pattern)var2.next();
//                matcher = pattern.matcher(value);
//                if(matcher.find()) {
//                    value = matcher.replaceAll("");
//                }
//            }
//
//            value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
//            value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
//            value = value.replaceAll("\'", "& #39;");
//            value = value.replaceAll("eval\\((.*)\\)", "");
//            value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
//            value = value.replaceAll("script", "");
//            value = StringEscapeUtils.escapeSql(value);
//        }
//
//        return value;
//    }

    /**
     *	检查一个字符串是否是一个合法的密码（8-20位的数字和字符串组合）
     *	要求：
     *		1、必须要要有8-20位(含)
     *		2、不能全是数字
     *		3、不能全是字母
     * @param source
     * @return
     */
    public static Boolean validPassword(String source){
        if(isNotValid(source)){
            return false;
        }
        if(source.length() < 8  || source.length() > 20){
            return  false;
        }

        String regEx = "^[A-Za-z]+$";
        if(Pattern.compile(regEx).matcher(source).matches()){
            //纯字母
            return false;
        }
        regEx = "^[0-9]+$";
        if(Pattern.compile(regEx).matcher(source).matches()){
            //纯数字
            return false;
        }
        return true;
    }

    public static Map<String,String> validPasswordWithMsg(String source){
        Map<String,String> map = new HashMap<>();
        if(isNotValid(source)){
            map.put("result","false");
            map.put("message","密码不能为空");
            return map;
        }
        if(source.length() < 8  || source.length() > 20){
            map.put("result","false");
            map.put("message","密码长度在8-20位之间");
            return map;
        }


        String regEx = "^[A-Za-z]+$";
        if(Pattern.compile(regEx).matcher(source).matches()){
            //纯字母
            map.put("result","false");
            map.put("message","密码不能全都是字母");
            return map;
        }
        regEx = "^[0-9]+$";
        if(Pattern.compile(regEx).matcher(source).matches()){
            //纯数字
            map.put("result","false");
            map.put("message","密码不能全都是数字");
            return map;
        }
        map.put("result","true");
        return map;
    }

    public static boolean isValidPhoneNO(String phoneNum){
        if(isNotValid(phoneNum)) return false;
        String regexp="^1[3|4|5|7|8][0-9]\\d{8}$";
        return phoneNum.matches(regexp);
    }

    /**
     * 判断是否包含内网IPv4
     * @param ip 合法的ip地址
     * @return boolean
     */
    public static  boolean isContainInnerIPv4(String ip) {
        String reg = "(10|172|192)\\.([0-1][0-9]{0,2}|[2][0-5]{0,2}|[3-9][0-9]{0,1})\\.([0-1][0-9]{0,2}|[2][0-5]{0,2}|[3-9][0-9]{0,1})\\.([0-1][0-9]{0,2}|[2][0-5]{0,2}|[3-9][0-9]{0,1})";
        Pattern p = Pattern.compile(reg);
        Matcher matcher = p.matcher(ip);
        return matcher.find();
    }

    public static void main(String[] args) {
//        System.out.println(validPasswordWithMsg(""));
//        System.out.println(validPasswordWithMsg("123456"));
//        System.out.println(validPasswordWithMsg("12345126"));
//        System.out.println(validPasswordWithMsg("123swe"));
//        System.out.println(validPasswordWithMsg("12123123swe"));

        System.out.println("13827460306" +(isValidPhoneNO("13827460306") ? " 是 " : " 不是 " ) + "合法的手机号码");

        System.out.println("//192.168.2.111 " + (isContainInnerIPv4("//192.168.2.111") ? " 包含 " : " 不包含 ") + "合法的内网ipv4地址" );
    }

}
