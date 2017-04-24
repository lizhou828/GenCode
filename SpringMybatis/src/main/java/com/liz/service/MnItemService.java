/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service;

import com.liz.model.MnItem;
import com.liz.common.pojo.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface MnItemService{

    /**
     * 通过主键查询实体对象
     *
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public MnItem getByPK(Integer primaryKey) throws Exception;

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<MnItem> list() throws Exception;

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<MnItem> listByProperty(MnItem mnItem) throws Exception;


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception;

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception;

    /**
     * 根据传入参数删除记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int deleteByProperty(MnItem mnItem) throws Exception;

    /**
     * 保存记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public void save(MnItem mnItem) throws Exception;

    /**
     * 更新记录
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int update(MnItem mnItem) throws Exception;

    /**
     * 根据条件查询记录条数
     * @param mnItem
     * @return
     * @throws Exception
     */
    public int findByCount(MnItem mnItem) throws Exception;

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<MnItem> findByPagination(Pagination<MnItem> pagination, MnItem mnItem) throws Exception;

}
