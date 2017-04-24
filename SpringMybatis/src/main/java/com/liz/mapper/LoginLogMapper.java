/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.LoginLog;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface LoginLogMapper extends GenericIBatisMapper <LoginLog, Integer>{

    public List<LoginLog> findByPagination(Pagination<LoginLog> pagination, LoginLog loginLog);

}