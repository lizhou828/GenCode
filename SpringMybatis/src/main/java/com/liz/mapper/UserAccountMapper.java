/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.UserAccount;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface UserAccountMapper extends GenericIBatisMapper <UserAccount, Integer>{

    public List<UserAccount> findByPagination(Pagination<UserAccount> pagination, UserAccount userAccount);

}