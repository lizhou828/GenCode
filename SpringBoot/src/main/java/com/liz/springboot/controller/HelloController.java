package com.liz.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lizhou on 2017年06月12日 21时05分
 */
@Controller
public class HelloController {

    @RequestMapping("/hello")
    public String   hello(ModelMap map) {
        map.addAttribute("name", "其实我是个演员");
        map.addAttribute("host", "http://blog.52itstyle.com");
        return "hello";
    }

    @RequestMapping("/greeting")
    @ResponseBody
    public Map greeting() {
        Map map = new HashMap<>();
        map.put("name", "其实我是个演员");
        map.put("host", "http://blog.52itstyle.com");
        return map;
    }


}
