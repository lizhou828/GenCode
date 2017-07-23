package com.liz.service;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * Created by lizhou on 2017年07月23日 16时51分
 */

// 告诉spring怎样执行
@RunWith(SpringJUnit4ClassRunner.class)
//  标明是web应用测试
@WebAppConfiguration(value = "src/main/webapp") //可以不填，默认此目录
// 配置文件地址
@ContextConfiguration(locations = { "file:src/main/resources/applicationContext.xml", "file:src/main/resources/spring-mybatis.xml", "file:src/main/resources/springMVC-servlet.xml" })

public class BaseUnitTest {

}
