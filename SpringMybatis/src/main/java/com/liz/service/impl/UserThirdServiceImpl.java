/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */

package com.liz.service.impl;

import com.liz.common.pojo.Pagination;
import com.liz.mapper.UserThirdMapper;
import com.liz.model.UserThird;
import java.util.List;

import com.liz.service.UserThirdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional(rollbackFor = Exception.class)
@Service
public class UserThirdServiceImpl implements UserThirdService {

    private UserThirdMapper userThirdMapper;

    @Autowired
    public void setUserThirdMapper(UserThirdMapper userThirdMapper) {
        this.userThirdMapper = userThirdMapper;
    }

    /**
     * 通过主键查询实体对象
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public UserThird getByPK(Integer primaryKey) throws Exception {
        return userThirdMapper.getByPK(primaryKey);
    }

    /**
     * 查询所有记录
     * @return
     * @throws Exception
     */
    public List<UserThird> list() throws Exception {
        return userThirdMapper.list();
    }

    /**
     * 根据查询条件查询所有记录
     * @return
     * @throws Exception
     */
    public List<UserThird> listByProperty(UserThird userThird)throws Exception {
        return userThirdMapper.listByProperty(userThird);
    }


    /**
     * 根据主键删除记录
     * @param primaryKey
     * @return
     * @throws Exception
     */
    public int deleteByPK(Integer primaryKey) throws Exception {
        return userThirdMapper.deleteByPK(primaryKey);
    }

    /**
     * 根据多个主键删除记录
     * @param primaryKeys
     * @throws Exception
     */
    public void deleteByPKeys(List<Integer> primaryKeys) throws Exception {
        userThirdMapper.deleteByPKeys(primaryKeys);
    }

    /**
     * 根据传入参数删除记录
     * @param userThird
     * @return
     * @throws Exception
     */
    public int deleteByProperty(UserThird userThird) throws Exception {
        return userThirdMapper.deleteByProperty(userThird);
    }

    /**
     * 保存记录
     * @param userThird
     * @return
     * @throws Exception
     */
    public void save(UserThird userThird) throws Exception {
        userThirdMapper.save(userThird);
    }

    /**
     * 更新记录
     * @param userThird
     * @return
     * @throws Exception
     */
    public int update(UserThird userThird) throws Exception{
        return userThirdMapper.update(userThird);
    }

    /**
     * 根据条件查询记录条数
     * @param userThird
     * @return
     * @throws Exception
     */
    public int findByCount(UserThird userThird) throws Exception {
        return userThirdMapper.findByCount(userThird);
    }

    /**
     * 根据查询条件查询分页记录
     * @return
     * @throws Exception
     */
    public Pagination<UserThird> findByPagination(Pagination<UserThird> pagination, UserThird userThird) throws Exception{
        List<UserThird> list = userThirdMapper.findByPagination(pagination, userThird);
        pagination.setResultList(list);
        return pagination;
    }

}
