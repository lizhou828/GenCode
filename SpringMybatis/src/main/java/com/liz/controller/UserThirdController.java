/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.controller;

import com.liz.model.UserThird;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.Pagination;
import com.liz.common.pojo.RequestModel;
import com.liz.service.UserThirdService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/userThird")
public class UserThirdController {

    private static Log log = LogFactory.getLog(UserThirdController.class);

    @Autowired
    private UserThirdService userThirdService;

    /**
     * 通过主键查询实体对象
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public UserThird getByPK(@PathVariable("key") Integer key) throws Exception {
        return userThirdService.getByPK(key);
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/listPg"}, method = RequestMethod.POST)
    @ResponseBody
    public Pagination<UserThird> findByPagination(@RequestBody RequestModel<UserThird> requestModel) throws Exception {
        Pagination<UserThird> pagination = new Pagination<UserThird>();
        pagination.setPaginationFlag(requestModel.isPaginationFlag());
        pagination.setPageNo(requestModel.getPageNo());
        pagination.setPageSize(requestModel.getPageSize());
        return userThirdService.findByPagination(pagination, requestModel.getParam());
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody UserThird userThird) throws Exception {
        userThirdService.save(userThird);
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        userThirdService.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody UserThird userThird) throws Exception {
        userThirdService.update(userThird);
    }

}


