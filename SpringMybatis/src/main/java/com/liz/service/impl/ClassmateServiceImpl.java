/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.ClassmateMapper;
import com.liz.model.Classmate;
import java.util.List;

import com.liz.service.ClassmateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class ClassmateServiceImpl implements ClassmateService {

    private ClassmateMapper classmateMapper;

    @Autowired
    public void setClassmateMapper(ClassmateMapper classmateMapper) {
        this.classmateMapper = classmateMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public Classmate getByPK(Integer primaryKey) throws Exception {
        return classmateMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<Classmate> list() throws Exception {
        return classmateMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<Classmate> listByProperty(Classmate classmate)throws Exception {
        return classmateMapper.listByProperty(classmate);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return classmateMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        classmateMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param classmate
     * @return
     * @throws Exception
     */
    public int deleteByProperty(Classmate classmate) throws Exception {
        return classmateMapper.deleteByProperty(classmate);
    }

    /**
     * 保存记录
     * @param classmate
     * @return
     * @throws Exception
     */
    public void save(Classmate classmate) throws Exception {
        classmateMapper.save(classmate);
    }

    /**
     * 更新记录
     * @param classmate
     * @return
     * @throws Exception
     */
    public int update(Classmate classmate) throws Exception{
        return classmateMapper.update(classmate);
    }

    /**
     * 根据条件查询记录条数
     * @param classmate
     * @return
     * @throws Exception
     */
    public int findByCount(Classmate classmate) throws Exception {
        return classmateMapper.findByCount(classmate);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<Classmate> findByPagination(Pagination<Classmate> pagination, Classmate classmate) throws Exception{
        List<Classmate> list = classmateMapper.findByPagination(pagination, classmate);
        pagination.setResultList(list);
        return pagination;
    }

}
