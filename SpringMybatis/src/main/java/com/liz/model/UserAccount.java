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
public class UserAccount implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer id;

    /* 用户id */
    private Integer userId;

    /* 总收入 */
    private Double income;

    /* 总支出 */
    private Double pay;

    /* 创建时间 */
    private java.sql.Timestamp createTime;

    /* 创建时间 */
    private java.sql.Timestamp updateTime;


    /* get  */
    public Integer getId() {
        return id;
    }

    /* set  */
    public void setId(Integer id) {
        this.id = id;
    }
    /* get 用户id */
    public Integer getUserId() {
        return userId;
    }

    /* set 用户id */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    /* get 总收入 */
    public Double getIncome() {
        return income;
    }

    /* set 总收入 */
    public void setIncome(Double income) {
        this.income = income;
    }
    /* get 总支出 */
    public Double getPay() {
        return pay;
    }

    /* set 总支出 */
    public void setPay(Double pay) {
        this.pay = pay;
    }
    /* get 创建时间 */
    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    /* set 创建时间 */
    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }
    /* get 创建时间 */
    public java.sql.Timestamp getUpdateTime() {
        return updateTime;
    }

    /* set 创建时间 */
    public void setUpdateTime(java.sql.Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String toString() {
        return "UserAccount {" +
                " , id = " + id +
                " , userId = " + userId +
                " , income = " + income +
                " , pay = " + pay +
                " , createTime = " + createTime +
                " , updateTime = " + updateTime +
            "}";
        }
}