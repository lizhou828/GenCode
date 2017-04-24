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
public class MnItem implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer itemId;

    /* 用户id */
    private Integer userId;

    /* 流动金额 */
    private Double money;

    /* 类型:0表示支出，1表示收入 */
    private Integer type;

    /* 类别id */
    private Integer cateId;

    /* 类别名称 */
    private String cateName;

    /* 创建时间 */
    private java.sql.Timestamp createTime;

    /* 创建人 */
    private String createUser;

    /* 备注 */
    private String remark;

    /* 名称 */
    private String itemName;

    /* 是否必需 */
    private String needful;

    /* 更新时间 */
    private java.sql.Timestamp updateTime;

    /* 更新人 */
    private String updateUser;

    /* 父类别id */
    private Integer parentCateId;

    /* 父类别名称 */
    private String parentCateName;

    /* 记账日期 */
    private String noteDate;


    /* get  */
    public Integer getItemId() {
        return itemId;
    }

    /* set  */
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    /* get 用户id */
    public Integer getUserId() {
        return userId;
    }

    /* set 用户id */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    /* get 流动金额 */
    public Double getMoney() {
        return money;
    }

    /* set 流动金额 */
    public void setMoney(Double money) {
        this.money = money;
    }
    /* get 类型:0表示支出，1表示收入 */
    public Integer getType() {
        return type;
    }

    /* set 类型:0表示支出，1表示收入 */
    public void setType(Integer type) {
        this.type = type;
    }
    /* get 类别id */
    public Integer getCateId() {
        return cateId;
    }

    /* set 类别id */
    public void setCateId(Integer cateId) {
        this.cateId = cateId;
    }
    /* get 类别名称 */
    public String getCateName() {
        return cateName;
    }

    /* set 类别名称 */
    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    /* get 创建时间 */
    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    /* set 创建时间 */
    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }
    /* get 创建人 */
    public String getCreateUser() {
        return createUser;
    }

    /* set 创建人 */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
    /* get 备注 */
    public String getRemark() {
        return remark;
    }

    /* set 备注 */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /* get 名称 */
    public String getItemName() {
        return itemName;
    }

    /* set 名称 */
    public void setItemName(String itemName) {
        this.itemName = itemName;
    }
    /* get 是否必需 */
    public String getNeedful() {
        return needful;
    }

    /* set 是否必需 */
    public void setNeedful(String needful) {
        this.needful = needful;
    }
    /* get 更新时间 */
    public java.sql.Timestamp getUpdateTime() {
        return updateTime;
    }

    /* set 更新时间 */
    public void setUpdateTime(java.sql.Timestamp updateTime) {
        this.updateTime = updateTime;
    }
    /* get 更新人 */
    public String getUpdateUser() {
        return updateUser;
    }

    /* set 更新人 */
    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
    /* get 父类别id */
    public Integer getParentCateId() {
        return parentCateId;
    }

    /* set 父类别id */
    public void setParentCateId(Integer parentCateId) {
        this.parentCateId = parentCateId;
    }
    /* get 父类别名称 */
    public String getParentCateName() {
        return parentCateName;
    }

    /* set 父类别名称 */
    public void setParentCateName(String parentCateName) {
        this.parentCateName = parentCateName;
    }
    /* get 记账日期 */
    public String getNoteDate() {
        return noteDate;
    }

    /* set 记账日期 */
    public void setNoteDate(String noteDate) {
        this.noteDate = noteDate;
    }

    public String toString() {
        return "MnItem {" +
                " , itemId = " + itemId +
                " , userId = " + userId +
                " , money = " + money +
                " , type = " + type +
                " , cateId = " + cateId +
                " , cateName = " + cateName +
                " , createTime = " + createTime +
                " , createUser = " + createUser +
                " , remark = " + remark +
                " , itemName = " + itemName +
                " , needful = " + needful +
                " , updateTime = " + updateTime +
                " , updateUser = " + updateUser +
                " , parentCateId = " + parentCateId +
                " , parentCateName = " + parentCateName +
                " , noteDate = " + noteDate +
            "}";
        }
}