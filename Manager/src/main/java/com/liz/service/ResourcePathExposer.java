package com.liz.service;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

/**
 * Created by lizhou on 2018年05月13日 16时43分
 */
@Component
public class ResourcePathExposer implements ServletContextAware {

    private ServletContext servletContext;

    @Override
    public void setServletContext(ServletContext servletContext) {
        // TODO Auto-generated method stub
        this.servletContext=servletContext;
    }
    public ServletContext getServletContext() {
        return servletContext;
    }

    public void init(){
        Long resourceVersion = System.currentTimeMillis();
        System.out.println("============ Spring初始化数据============ resourceVersion：" + resourceVersion);
        getServletContext().setAttribute("resourceVersion", resourceVersion);

    }
}
