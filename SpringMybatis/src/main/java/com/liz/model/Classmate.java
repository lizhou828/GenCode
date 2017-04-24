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
public class Classmate implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer id;

    /* 姓名 */
    private String name;

    /* 工作单位 */
    private String workUnit;

    /* 职务 */
    private String job;

    /* 固定电话 */
    private String telephone;

    /* 手机号码 */
    private String mobilePhone;

    /* qq号码 */
    private Long qqNo;

    /* 微信号 */
    private String weixinNo;

    /* 添加时间 */
    private java.sql.Timestamp addTime;

    /* 班级全称 */
    private String className;

    /* user_agent */
    private String userAgent;


    /* get  */
    public Integer getId() {
        return id;
    }

    /* set  */
    public void setId(Integer id) {
        this.id = id;
    }
    /* get 姓名 */
    public String getName() {
        return name;
    }

    /* set 姓名 */
    public void setName(String name) {
        this.name = name;
    }
    /* get 工作单位 */
    public String getWorkUnit() {
        return workUnit;
    }

    /* set 工作单位 */
    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit;
    }
    /* get 职务 */
    public String getJob() {
        return job;
    }

    /* set 职务 */
    public void setJob(String job) {
        this.job = job;
    }
    /* get 固定电话 */
    public String getTelephone() {
        return telephone;
    }

    /* set 固定电话 */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    /* get 手机号码 */
    public String getMobilePhone() {
        return mobilePhone;
    }

    /* set 手机号码 */
    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }
    /* get qq号码 */
    public Long getQqNo() {
        return qqNo;
    }

    /* set qq号码 */
    public void setQqNo(Long qqNo) {
        this.qqNo = qqNo;
    }
    /* get 微信号 */
    public String getWeixinNo() {
        return weixinNo;
    }

    /* set 微信号 */
    public void setWeixinNo(String weixinNo) {
        this.weixinNo = weixinNo;
    }
    /* get 添加时间 */
    public java.sql.Timestamp getAddTime() {
        return addTime;
    }

    /* set 添加时间 */
    public void setAddTime(java.sql.Timestamp addTime) {
        this.addTime = addTime;
    }
    /* get 班级全称 */
    public String getClassName() {
        return className;
    }

    /* set 班级全称 */
    public void setClassName(String className) {
        this.className = className;
    }
    /* get user_agent */
    public String getUserAgent() {
        return userAgent;
    }

    /* set user_agent */
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public String toString() {
        return "Classmate {" +
                " , id = " + id +
                " , name = " + name +
                " , workUnit = " + workUnit +
                " , job = " + job +
                " , telephone = " + telephone +
                " , mobilePhone = " + mobilePhone +
                " , qqNo = " + qqNo +
                " , weixinNo = " + weixinNo +
                " , addTime = " + addTime +
                " , className = " + className +
                " , userAgent = " + userAgent +
            "}";
        }
}