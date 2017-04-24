/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.User;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface UserMapper extends GenericIBatisMapper <User, Integer>{

    public List<User> findByPagination(Pagination<User> pagination, User user);

}