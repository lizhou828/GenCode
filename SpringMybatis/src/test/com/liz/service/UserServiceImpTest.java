package com.liz.service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liz.mapper.UserMapper;
import com.liz.model.Billion;
import com.liz.model.User;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

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

    @Autowired
    private BillionService billionService;

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

    @Test
    public void findByPage() throws Exception {
        Page<User> page = new Page<>();
        page.setPageNum(1);
        page.setPageSize(2);
        User user = new User();
        Page<User>  userPage = userService.findByPage(page, user);
        System.out.println("userPage=" + userPage);

    }

    @Test
    public void listByProperty() throws Exception {
        User user = new User();
        List<User> userList = userService.listByProperty(user);
        System.out.println(userList);

    }

    @Test
    public void TestStartPage() throws Exception {
        User user = new User();
        PageHelper.startPage(2, 2);//从第2页开始显示，每页显示2条
        Page<User> userPage = (Page<User>) userService.listByProperty(user);
        System.out.println("userPage=" + userPage);
//        userPage=Page{count=true, pageNum=2, pageSize=2, startRow=2, endRow=4, total=3, pages=2, reasonable=false, pageSizeZero=false, resultList=[User { , userId = 3 , userName = system , nickName = system , password = e10adc3949ba59abbe56e057f20f883e , userState = 1 , userType = 1 , headPortrait = null , mobilePhone = null , email = null , thirdType = null , fromModule = null , tId = null , registerTime = null , registerIp = null , lastLoginTime = null , lastLoginIp = null , loginCount = null}]}
    }

    @Test
    public void TestOffsetPage() throws Exception {
        User user = new User();
        PageHelper.offsetPage(2, 2);
        Page<User> userPage = (Page<User>) userService.listByProperty(user);
        System.out.println("userPage=" + userPage);
//        userPage=Page{count=true, pageNum=2, pageSize=2, startRow=2, endRow=4, total=3, pages=2, reasonable=false, pageSizeZero=false, resultList=[User { , userId = 3 , userName = system , nickName = system , password = e10adc3949ba59abbe56e057f20f883e , userState = 1 , userType = 1 , headPortrait = null , mobilePhone = null , email = null , thirdType = null , fromModule = null , tId = null , registerTime = null , registerIp = null , lastLoginTime = null , lastLoginIp = null , loginCount = null}]}
    }


    @Test
    public void billionServiceTest(){
        Billion billion = billionService.getByPK(1);
        System.out.println("billion=" + billion);
    }


}
