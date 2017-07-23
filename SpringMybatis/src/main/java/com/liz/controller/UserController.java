/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.controller;

import com.liz.model.User;
import com.github.pagehelper.Page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.RequestModel;
import com.liz.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

    private static Log log = LogFactory.getLog(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 通过主键查询实体对象
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public User getByPK(@PathVariable("key") Integer key) throws Exception {
        return userService.getByPK(key);
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/findByPage"}, method = RequestMethod.POST)
    @ResponseBody
    public Page<User> findByPage(@RequestBody RequestModel<User> requestModel) throws Exception {
        Page<User> page = new Page<User>();
        page.setPageNum(requestModel.getPageNo());
        page.setPageSize(requestModel.getPageSize());
        return userService.findByPage(page, requestModel.getParam());
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/searchByPage"}, method = RequestMethod.POST)
    public String searchByPage(@RequestBody RequestModel<User> requestModel,ModelMap modelMap) throws Exception {
        Page<User> page = new Page<User>();
        page.setPageNum(requestModel.getPageNo());
        page.setPageSize(requestModel.getPageSize());

        Page<User> userPage =  userService.findByPage(page, requestModel.getParam());
        modelMap.put("userPage",userPage);
        return "/user/searchByPage";
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody User user) throws Exception {
        userService.save(user);
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        userService.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody User user) throws Exception {
        userService.update(user);
    }

    @RequestMapping(value = "/404")
    public String errorPage404() throws Exception {
        return "/errorPage/404";
    }

    @RequestMapping(value = "/405")
    public String errorPage405() throws Exception {
        return "/errorPage/405";
    }
    @RequestMapping(value = "/500")
    public String errorPage500() throws Exception {
        return "/errorPage/500";
    }

}


