/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.UserThird;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface UserThirdMapper extends GenericIBatisMapper <UserThird, Integer>{

    public List<UserThird> findByPagination(Pagination<UserThird> pagination, UserThird userThird);

}