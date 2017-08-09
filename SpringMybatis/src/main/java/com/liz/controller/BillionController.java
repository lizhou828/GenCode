/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.controller;

import com.liz.model.Billion;
import com.github.pagehelper.Page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.RequestModel;
import com.liz.service.BillionService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/billion")
public class BillionController {

    private static Log log = LogFactory.getLog(BillionController.class);

    @Autowired
    private BillionService billionService;

    /**
     * 通过主键查询实体对象
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public Billion getByPK(@PathVariable("key") Integer key) throws Exception {
        return billionService.getByPK(key);
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/findByPage"}, method = RequestMethod.POST)
    @ResponseBody
    public Page<Billion> findByPage(@RequestBody RequestModel<Billion> requestModel) throws Exception {
        Page<Billion> page = new Page<Billion>();
        page.setPageNum(requestModel.getPageNo());
        page.setPageSize(requestModel.getPageSize());
        return billionService.findByPage(page, requestModel.getParam());
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody Billion billion) throws Exception {
        billionService.save(billion);
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        billionService.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody Billion billion) throws Exception {
        billionService.update(billion);
    }

}


