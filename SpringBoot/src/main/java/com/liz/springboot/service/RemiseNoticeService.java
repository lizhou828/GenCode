/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.springboot.service;

import com.liz.springboot.model.RemiseNotice;

import java.util.List;

public interface RemiseNoticeService extends GenericIService<RemiseNotice,Integer>{

    public List<RemiseNotice> findNoticeWithoutDetail();

}
