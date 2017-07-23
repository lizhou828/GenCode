/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.liz.mapper.BillionMapper;
import com.liz.model.Billion;
import java.util.List;

import com.liz.service.BillionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class BillionServiceImpl extends GenericService<Billion, Integer> implements BillionService {

    private BillionMapper billionMapper;

    @Autowired
    public void setBillionMapper(BillionMapper billionMapper) {
        this.billionMapper = billionMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     */
    public Billion getByPK(Integer primaryKey) {
        return billionMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     */
    public List<Billion> list() {
        return billionMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     */
    public List<Billion> listByProperty(Billion billion){
        return billionMapper.listByProperty(billion);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     */
    public int deleteByPK(Integer primaryKey) {
        return billionMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     */
    public void deleteByPKeys(List<Integer> primaryKeys) {
        billionMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param billion
     * @return
     */
    public int deleteByProperty(Billion billion){
        return billionMapper.deleteByProperty(billion);
    }

    /**
     * 保存记录
     * @param billion
     * @return
     */
    public int save(Billion billion){
        return billionMapper.save(billion);
    }

    /**
     * 更新记录
     * @param billion
     * @return
     */
    public int update(Billion billion){
        return billionMapper.update(billion);
    }

    /**
     * 根据条件查询记录条数
     * @param billion
     * @return
     */
    public int findByCount(Billion billion){
        return billionMapper.findByCount(billion);
    }

     /**
     * 根据查询条件查询分页记录
     * @return
     */
    @Override
    public Page<Billion> findByPage(Page<Billion> page, Billion billion) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<Billion> billionList = billionMapper.listByProperty(billion);
        if(null == billionList || billionList.size() == 0){
            return new Page<Billion>();
        }
        return (Page<Billion>)billionList;
    }
}
