/*
 * Powered By [Frank-Liz-Lee]
 * Copyright(C) 2012-2017 Liz Company
 * All rights reserved.
 * -----------------------------------------------
 */
package com.liz.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
public class MnCate implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer cateId;

    /*  */
    private String cateName;

    /*  */
    private Integer parentId;

    /*  */
    private Integer sortOrder;


    /* get  */
    public Integer getCateId() {
        return cateId;
    }

    /* set  */
    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }
    /* get  */
    public String getCateName() {
        return cateName;
    }

    /* set  */
    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    /* get  */
    public Integer getParentId() {
        return parentId;
    }

    /* set  */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    /* get  */
    public Integer getSortOrder() {
        return sortOrder;
    }

    /* set  */
    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String toString() {
        return "MnCate {" +
                " , cateId = " + cateId +
                " , cateName = " + cateName +
                " , parentId = " + parentId +
                " , sortOrder = " + sortOrder +
            "}";
        }
}