/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.Classmate;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface ClassmateMapper extends GenericIBatisMapper <Classmate, Integer>{

    public List<Classmate> findByPagination(Pagination<Classmate> pagination, Classmate classmate);

}