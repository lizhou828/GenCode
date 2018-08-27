package com.liz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lizhou on 2018年05月14日 07时17分
 */
@Controller
@RequestMapping(value = "/index",name = "首页")
public class IndexController {

    @RequestMapping(name = "首页")
    public String index(){
        return "/index";
    }

}
