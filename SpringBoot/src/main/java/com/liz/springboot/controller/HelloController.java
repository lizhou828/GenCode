package com.liz.springboot.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lizhou on 2017年06月12日 21时05分
 */
@RestController
public class HelloController {

    private static final Logger log = LogManager.getLogger(HelloController.class);

    @RequestMapping("/hello")
    public String   hello() {
        log.debug("debug");
        log.info("info");
        log.warn("warn");
        log.error("error");
        return "hello";
    }

}
