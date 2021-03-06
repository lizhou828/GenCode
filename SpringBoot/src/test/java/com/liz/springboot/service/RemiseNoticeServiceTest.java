package com.liz.springboot.service;

import com.github.pagehelper.PageHelper;
import com.liz.springboot.ApplicationTests;
import com.liz.springboot.model.RemiseNotice;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by lizhou on 2018年08月22日 21时48分
 */
public class RemiseNoticeServiceTest extends ApplicationTests {

    private static final Logger log = LogManager.getLogger(RemiseNoticeServiceTest.class);
    @Autowired
    private RemiseNoticeService remiseNoticeService;


    @Test
    public void addTest() throws Exception {
        RemiseNotice remiseNotice = new RemiseNotice();
        remiseNotice.setType(1);
        remiseNotice.setTitle("title");
        remiseNotice.setAreaId(1123);
        remiseNotice.setAreaName("地区");
        remiseNotice.setContent("a撒旦法阿斯顿发flkasdfasdfasdflask");
        remiseNotice.setCreator("创建者");
        remiseNotice.setHref("http://www.baidu.com");
        remiseNotice.setNoticeNum("1231231231");
        remiseNotice.setPublishTime(new Timestamp(System.currentTimeMillis()));
        remiseNotice.setCreateTime(new Timestamp(System.currentTimeMillis()));
        int result = remiseNoticeService.save(remiseNotice);
        log.info("result="+result + ",remiseNotice=" + remiseNotice);
    }

    @Test
    public void getByPKTest() throws Exception {
        RemiseNotice remiseNotice  = remiseNoticeService.getByPK(4);
        System.out.println(remiseNotice );
    }

    @Test
    public void listByPropertyTest(){
        RemiseNotice remiseNotice = new RemiseNotice();
        remiseNotice.setType(3);
        List<RemiseNotice> listPage = remiseNoticeService.listByProperty(remiseNotice);
        log.info(listPage);
    }

    @Test
    public void findNoticeWithoutDetailTest(){
        List<RemiseNotice> remiseNoticeList = remiseNoticeService.findNoticeWithoutDetail();
        System.out.println(remiseNoticeList);
    }

    @Test
    public void pageQueryTest(){
        RemiseNotice remiseNotice = new RemiseNotice();
        remiseNotice.setType(3);

        PageHelper.startPage(2, 2);//设置分页,紧接着查询语句才能生效
        List<RemiseNotice> listPage = remiseNoticeService.listByProperty(remiseNotice);

        log.info(listPage);
    }




}
