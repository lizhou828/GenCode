/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.MnItemMapper;
import com.liz.model.MnItem;
import java.util.List;

import com.liz.service.MnItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class MnItemServiceImpl implements MnItemService {

    private MnItemMapper mnItemMapper;

    @Autowired
    public void setMnItemMapper(MnItemMapper mnItemMapper) {
        this.mnItemMapper = mnItemMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public MnItem getByPK(Integer primaryKey) throws Exception {
        return mnItemMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<MnItem> list() throws Exception {
        return mnItemMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<MnItem> listByProperty(MnItem mnItem)throws Exception {
        return mnItemMapper.listByProperty(mnItem);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return mnItemMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        mnItemMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int deleteByProperty(MnItem mnItem) throws Exception {
        return mnItemMapper.deleteByProperty(mnItem);
    }

    /**
     * 保存记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public void save(MnItem mnItem) throws Exception {
        mnItemMapper.save(mnItem);
    }

    /**
     * 更新记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int update(MnItem mnItem) throws Exception{
        return mnItemMapper.update(mnItem);
    }

    /**
     * 根据条件查询记录条数
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int findByCount(MnItem mnItem) throws Exception {
        return mnItemMapper.findByCount(mnItem);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<MnItem> findByPagination(Pagination<MnItem> pagination, MnItem mnItem) throws Exception{
        List<MnItem> list = mnItemMapper.findByPagination(pagination, mnItem);
        pagination.setResultList(list);
        return pagination;
    }

}
