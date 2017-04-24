/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.LoginLogMapper;
import com.liz.model.LoginLog;
import java.util.List;

import com.liz.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class LoginLogServiceImpl implements LoginLogService {

    private LoginLogMapper loginLogMapper;

    @Autowired
    public void setLoginLogMapper(LoginLogMapper loginLogMapper) {
        this.loginLogMapper = loginLogMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public LoginLog getByPK(Integer primaryKey) throws Exception {
        return loginLogMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<LoginLog> list() throws Exception {
        return loginLogMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<LoginLog> listByProperty(LoginLog loginLog)throws Exception {
        return loginLogMapper.listByProperty(loginLog);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return loginLogMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        loginLogMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int deleteByProperty(LoginLog loginLog) throws Exception {
        return loginLogMapper.deleteByProperty(loginLog);
    }

    /**
     * 保存记录
     * @param loginLog
     * @return
     * @throws Exception
     */
    public void save(LoginLog loginLog) throws Exception {
        loginLogMapper.save(loginLog);
    }

    /**
     * 更新记录
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int update(LoginLog loginLog) throws Exception{
        return loginLogMapper.update(loginLog);
    }

    /**
     * 根据条件查询记录条数
     * @param loginLog
     * @return
     * @throws Exception
     */
    public int findByCount(LoginLog loginLog) throws Exception {
        return loginLogMapper.findByCount(loginLog);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<LoginLog> findByPagination(Pagination<LoginLog> pagination, LoginLog loginLog) throws Exception{
        List<LoginLog> list = loginLogMapper.findByPagination(pagination, loginLog);
        pagination.setResultList(list);
        return pagination;
    }

}
