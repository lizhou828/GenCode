/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.UserMapper;
import com.liz.model.User;
import java.util.List;

import com.liz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public User getByPK(Integer primaryKey) throws Exception {
        return userMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<User> list() throws Exception {
        return userMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<User> listByProperty(User user)throws Exception {
        return userMapper.listByProperty(user);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return userMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        userMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param user
     * @return
     * @throws Exception
     */
    public int deleteByProperty(User user) throws Exception {
        return userMapper.deleteByProperty(user);
    }

    /**
     * 保存记录
     * @param user
     * @return
     * @throws Exception
     */
    public void save(User user) throws Exception {
        userMapper.save(user);
    }

    /**
     * 更新记录
     * @param user
     * @return
     * @throws Exception
     */
    public int update(User user) throws Exception{
        return userMapper.update(user);
    }

    /**
     * 根据条件查询记录条数
     * @param user
     * @return
     * @throws Exception
     */
    public int findByCount(User user) throws Exception {
        return userMapper.findByCount(user);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<User> findByPagination(Pagination<User> pagination, User user) throws Exception{
        List<User> list = userMapper.findByPagination(pagination, user);
        pagination.setResultList(list);
        return pagination;
    }

}
