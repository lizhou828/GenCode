/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.controller;

import com.liz.model.IllegalWords;
import com.github.pagehelper.Page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.RequestModel;
import com.liz.service.IllegalWordsService;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/illegalWords")
public class IllegalWordsController {

    private static Log log = LogFactory.getLog(IllegalWordsController.class);

    @Autowired
    private IllegalWordsService illegalWordsService;


    @RequestMapping(value = "index",name = "首页")
    public String index() {
        return "/illegalwords/index";
    }

    /**
     * 通过主键查询实体对象
     * 请求方式：http://localhost:8080/illegalWords/getByPK/44
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public IllegalWords getByPK(@PathVariable("key") Integer key) throws Exception {
        return illegalWordsService.getByPK(key);
    }

//    @ResponseBody
//    @RequestMapping(value = "search",name = "分页查询")
//    public Map<String, Object> search(IllegalWords record) {
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("content", record.getContent());
//        map.put("status", record.getStatus());
//        PageInfoBean page = illegalWordsService.searchPage(record, map);
//        return setDataGrid(page);
//    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/findByPage"}, method = RequestMethod.POST)
    @ResponseBody
    public Page<IllegalWords> findByPage(@RequestBody RequestModel<IllegalWords> requestModel) throws Exception {
        Page<IllegalWords> page = new Page<IllegalWords>();
        page.setPageNum(requestModel.getPageNo());
        page.setPageSize(requestModel.getPageSize());
        return illegalWordsService.findByPage(page, requestModel.getParam());
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody IllegalWords illegalWords) throws Exception {
        illegalWordsService.save(illegalWords);
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        illegalWordsService.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody IllegalWords illegalWords) throws Exception {
        illegalWordsService.update(illegalWords);
    }

//    private Map<String,Object> setDataGrid(PageInfoBean pageInfoBean){
//        Map<String,Object> map = new HashMap<>();
//        map.put("total",pageInfoBean.getTotalOfData());
//        map.put("rows",pageInfoBean.getList());
//        return map;
//    }

}


