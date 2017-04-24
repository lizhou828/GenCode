/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service;

import com.liz.model.User;
import com.liz.common.pojo.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService{

    /**
     * 通过主键查询实体对象
     *
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public User getByPK(Integer primaryKey) throws Exception;

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<User> list() throws Exception;

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<User> listByProperty(User user) throws Exception;


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
     * @param user
     * @return
     * @throws Exception
     */
    public int deleteByProperty(User user) throws Exception;

    /**
     * 保存记录
     * @param user
     * @return
     * @throws Exception
     */
    public void save(User user) throws Exception;

    /**
     * 更新记录
     * @param user
     * @return
     * @throws Exception
     */
    public int update(User user) throws Exception;

    /**
     * 根据条件查询记录条数
     * @param user
     * @return
     * @throws Exception
     */
    public int findByCount(User user) throws Exception;

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<User> findByPagination(Pagination<User> pagination, User user) throws Exception;

}
