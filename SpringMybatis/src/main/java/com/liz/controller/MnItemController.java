/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.controller;

import com.liz.model.MnItem;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.Pagination;
import com.liz.common.pojo.RequestModel;
import com.liz.service.MnItemService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/mnItem")
public class MnItemController {

    private static Log log = LogFactory.getLog(MnItemController.class);

    @Autowired
    private MnItemService mnItemService;

    /**
     * 通过主键查询实体对象
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public MnItem getByPK(@PathVariable("key") Integer key) throws Exception {
        return mnItemService.getByPK(key);
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/listPg"}, method = RequestMethod.POST)
    @ResponseBody
    public Pagination<MnItem> findByPagination(@RequestBody RequestModel<MnItem> requestModel) throws Exception {
        Pagination<MnItem> pagination = new Pagination<MnItem>();
        pagination.setPaginationFlag(requestModel.isPaginationFlag());
        pagination.setPageNo(requestModel.getPageNo());
        pagination.setPageSize(requestModel.getPageSize());
        return mnItemService.findByPagination(pagination, requestModel.getParam());
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody MnItem mnItem) throws Exception {
        mnItemService.save(mnItem);
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        mnItemService.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody MnItem mnItem) throws Exception {
        mnItemService.update(mnItem);
    }

}


