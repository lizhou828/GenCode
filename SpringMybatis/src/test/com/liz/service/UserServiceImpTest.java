package com.liz.service;

import com.alibaba.fastjson.JSON;
import com.liz.mapper.UserMapper;
import com.liz.model.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * Created by lizhou on 2017年04月24日 22时34分
 */

// 告诉spring怎样执行
@RunWith(SpringJUnit4ClassRunner.class)
//  标明是web应用测试
@WebAppConfiguration(value = "src/main/webapp") //可以不填，默认此目录
// 配置文件地址
@ContextConfiguration(locations = { "file:src/main/resources/applicationContext.xml", "file:src/main/resources/spring-mybatis.xml", "file:src/main/resources/springMVC-servlet.xml" })

public class UserServiceImpTest {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @Before
    public void before(){
        System.out.println("准备测试！！！");
    }

    @After
    public void After(){
        System.out.println("测试结束！！！");
    }

    @Test
    public void get() {
        User user = userMapper.getByPK(1);
        System.out.println(JSON.toJSONString(user));
    }
}
