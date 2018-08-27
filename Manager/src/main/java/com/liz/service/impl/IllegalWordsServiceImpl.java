/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.liz.mapper.IllegalWordsMapper;
import com.liz.model.IllegalWords;
import java.util.List;

import com.liz.service.IllegalWordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class IllegalWordsServiceImpl extends GenericService<IllegalWords, Integer> implements IllegalWordsService {

    private IllegalWordsMapper illegalWordsMapper;

    @Autowired
    public void setIllegalWordsMapper(IllegalWordsMapper illegalWordsMapper) {
        this.illegalWordsMapper = illegalWordsMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     */
    public IllegalWords getByPK(Integer primaryKey) {
        return illegalWordsMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     */
    public List<IllegalWords> list() {
        return illegalWordsMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     */
    public List<IllegalWords> listByProperty(IllegalWords illegalWords){
        return illegalWordsMapper.listByProperty(illegalWords);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     */
    public int deleteByPK(Integer primaryKey) {
        return illegalWordsMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     */
    public void deleteByPKeys(List<Integer> primaryKeys) {
        illegalWordsMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param illegalWords
     * @return
     */
    public int deleteByProperty(IllegalWords illegalWords){
        return illegalWordsMapper.deleteByProperty(illegalWords);
    }

    /**
     * 保存记录
     * @param illegalWords
     * @return
     */
    public int save(IllegalWords illegalWords){
        return illegalWordsMapper.save(illegalWords);
    }

    /**
     * 更新记录
     * @param illegalWords
     * @return
     */
    public int update(IllegalWords illegalWords){
        return illegalWordsMapper.update(illegalWords);
    }

    /**
     * 根据条件查询记录条数
     * @param illegalWords
     * @return
     */
    public int findByCount(IllegalWords illegalWords){
        return illegalWordsMapper.findByCount(illegalWords);
    }

     /**
     * 根据查询条件查询分页记录
     * @return
     */
    @Override
    public Page<IllegalWords> findByPage(Page<IllegalWords> page, IllegalWords illegalWords) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<IllegalWords> illegalWordsList = illegalWordsMapper.listByProperty(illegalWords);
        if(null == illegalWordsList || illegalWordsList.size() == 0){
            return new Page<IllegalWords>();
        }
        return (Page<IllegalWords>)illegalWordsList;
    }
}
