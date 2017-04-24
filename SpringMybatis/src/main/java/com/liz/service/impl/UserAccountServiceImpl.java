/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.UserAccountMapper;
import com.liz.model.UserAccount;
import java.util.List;

import com.liz.service.UserAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserAccountServiceImpl implements UserAccountService {

    private UserAccountMapper userAccountMapper;

    @Autowired
    public void setUserAccountMapper(UserAccountMapper userAccountMapper) {
        this.userAccountMapper = userAccountMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public UserAccount getByPK(Integer primaryKey) throws Exception {
        return userAccountMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<UserAccount> list() throws Exception {
        return userAccountMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<UserAccount> listByProperty(UserAccount userAccount)throws Exception {
        return userAccountMapper.listByProperty(userAccount);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return userAccountMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        userAccountMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param userAccount
     * @return
     * @throws Exception
     */
    public int deleteByProperty(UserAccount userAccount) throws Exception {
        return userAccountMapper.deleteByProperty(userAccount);
    }

    /**
     * 保存记录
     * @param userAccount
     * @return
     * @throws Exception
     */
    public void save(UserAccount userAccount) throws Exception {
        userAccountMapper.save(userAccount);
    }

    /**
     * 更新记录
     * @param userAccount
     * @return
     * @throws Exception
     */
    public int update(UserAccount userAccount) throws Exception{
        return userAccountMapper.update(userAccount);
    }

    /**
     * 根据条件查询记录条数
     * @param userAccount
     * @return
     * @throws Exception
     */
    public int findByCount(UserAccount userAccount) throws Exception {
        return userAccountMapper.findByCount(userAccount);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<UserAccount> findByPagination(Pagination<UserAccount> pagination, UserAccount userAccount) throws Exception{
        List<UserAccount> list = userAccountMapper.findByPagination(pagination, userAccount);
        pagination.setResultList(list);
        return pagination;
    }

}
