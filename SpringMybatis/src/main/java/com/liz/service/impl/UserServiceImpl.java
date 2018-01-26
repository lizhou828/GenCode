/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.liz.mapper.UserMapper;
import com.liz.model.User;
import java.util.List;

import com.liz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserServiceImpl extends GenericService<User, Integer> implements UserService {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     */
    public User getByPK(java.lang.Integer primaryKey) {
        return userMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     */
    public List<User> list() {
        return userMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     */
    public List<User> listByProperty(User user){
        return userMapper.listByProperty(user);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     */
    public int deleteByPK(java.lang.Integer primaryKey) {
        return userMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     */
    public void deleteByPKeys(List<java.lang.Integer> primaryKeys) {
        userMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param user
     * @return
     */
    public int deleteByProperty(User user){
        return userMapper.deleteByProperty(user);
    }

    /**
     * 保存记录
     * @param user
     * @return
     */
    public int save(User user){
        return userMapper.save(user);
    }

    /**
     * 更新记录
     * @param user
     * @return
     */
    public int update(User user){
        return userMapper.update(user);
    }

    /**
     * 根据条件查询记录条数
     * @param user
     * @return
     */
    public int findByCount(User user){
        return userMapper.findByCount(user);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     */
    @Override
    public Page<User> findByPage(Page<User> page, User user) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<User> userList = userMapper.listByProperty(user);
        if(null == userList || userList.size() == 0){
            return new Page<User>();
        }
        return (Page<User>)userList;
    }
}
