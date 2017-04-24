/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service;

import com.liz.model.LoginLog;
import com.liz.common.pojo.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface LoginLogService{

    /**
     * 通过主键查询实体对象
     *
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public LoginLog getByPK(Integer primaryKey) throws Exception;

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<LoginLog> list() throws Exception;

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<LoginLog> listByProperty(LoginLog loginLog) throws Exception;


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
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int deleteByProperty(LoginLog loginLog) throws Exception;

    /**
     * 保存记录
     * @param loginLog
     * @return
     * @throws Exception
     */
    public void save(LoginLog loginLog) throws Exception;

    /**
     * 更新记录
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int update(LoginLog loginLog) throws Exception;

    /**
     * 根据条件查询记录条数
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int findByCount(LoginLog loginLog) throws Exception;

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<LoginLog> findByPagination(Pagination<LoginLog> pagination, LoginLog loginLog) throws Exception;

}
