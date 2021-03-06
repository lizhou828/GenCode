/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.springboot.service.impl;

import com.liz.springboot.mapper.RemiseNoticeMapper;
import com.liz.springboot.model.RemiseNotice;
import com.liz.springboot.service.RemiseNoticeService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(rollbackFor = Exception.class)
@Service
public class RemiseNoticeServiceImpl extends GenericService<RemiseNotice, Integer> implements RemiseNoticeService {

    private RemiseNoticeMapper remiseNoticeMapper;

    @Autowired
    public void setRemiseNoticeMapper(RemiseNoticeMapper remiseNoticeMapper) {
        this.remiseNoticeMapper = remiseNoticeMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     */
    public RemiseNotice getByPK(Integer primaryKey) {
        return remiseNoticeMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     */
    public List<RemiseNotice> list() {
        return remiseNoticeMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     */
    public List<RemiseNotice> listByProperty(RemiseNotice remiseNotice){
        return remiseNoticeMapper.listByProperty(remiseNotice);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     */
    public int deleteByPK(Integer primaryKey) {
        return remiseNoticeMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     */
    public void deleteByPKeys(List<Integer> primaryKeys) {
        remiseNoticeMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param remiseNotice
     * @return
     */
    public int deleteByProperty(RemiseNotice remiseNotice){
        return remiseNoticeMapper.deleteByProperty(remiseNotice);
    }

    /**
     * 保存记录
     * @param remiseNotice
     * @return
     */
    public int save(RemiseNotice remiseNotice){
        return remiseNoticeMapper.save(remiseNotice);
    }

    /**
     * 更新记录
     * @param remiseNotice
     * @return
     */
    public int update(RemiseNotice remiseNotice){
        return remiseNoticeMapper.update(remiseNotice);
    }

    /**
     * 根据条件查询记录条数
     * @param remiseNotice
     * @return
     */
    public int findByCount(RemiseNotice remiseNotice){
        return remiseNoticeMapper.findByCount(remiseNotice);
    }

     /**
     * 根据查询条件查询分页记录
     * @return
     */
    @Override
    public Page<RemiseNotice> findByPage(Page<RemiseNotice> page, RemiseNotice remiseNotice) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<RemiseNotice> remiseNoticeList = remiseNoticeMapper.listByProperty(remiseNotice);
        if(null == remiseNoticeList || remiseNoticeList.size() == 0){
            return new Page<RemiseNotice>();
        }
        return (Page<RemiseNotice>)remiseNoticeList;
    }

    public List<RemiseNotice> findNoticeWithoutDetail(){
        return remiseNoticeMapper.findNoticeWithoutDetail();
    }
}
