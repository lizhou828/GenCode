/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.mapper;

import java.util.List;

import com.liz.model.MnItem;
import com.liz.mapper.GenericIBatisMapper;
import com.liz.common.pojo.Pagination;

public interface MnItemMapper extends GenericIBatisMapper <MnItem, Integer>{

    public List<MnItem> findByPagination(Pagination<MnItem> pagination, MnItem mnItem);

}