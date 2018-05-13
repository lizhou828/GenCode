package com.liz.mapper;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;

/**
 * ҵ��ײ� ����Mapper�ӿ�
 * @param <T>  ʵ����
 * @param <PK> ��������
 */
public interface GenericIBatisMapper<T, PK extends Serializable> {
    int save(T var1);

    int deleteByPK(PK var1);

    void deleteByPKeys(@Param("primaryKeys") List<PK> var1);

    int deleteByProperty(T var1);

    int update(T var1);

    T getByPK(PK var1);

    List<T> list();

    List<T> listByProperty(T var1);

    int findByCount(T var1);

    public Page<T> findByPage(Page<T> page, T t);
}
