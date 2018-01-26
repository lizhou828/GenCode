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
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private java.lang.Integer userId;

    /* 用户名 */
    private java.lang.String userName;

    /* 用户昵称 */
    private java.lang.String nickName;

    /* 用户登录密码 */
    private java.lang.String password;

    /* 用户状态：1表示正常 */
    private java.lang.Integer userState;

    /* 用户类型：1表示普通用户 */
    private java.lang.Integer userType;

    /* 头像URL */
    private java.lang.String headPortrait;

    /* 手机号码 */
    private java.lang.String mobilePhone;

    /* 邮箱 */
    private java.lang.String email;

    /* 第三方用户类型 */
    private java.lang.String thirdType;

    /* 来源于哪个模块 */
    private java.lang.String fromModule;

    /* 推荐人id */
    private java.lang.Integer tId;

    /* 注册时间 */
    private java.sql.Timestamp registerTime;

    /* 注册ip */
    private java.lang.String registerIp;

    /* 最后登录时间 */
    private java.sql.Timestamp lastLoginTime;

    /* 最后登录ip */
    private java.lang.String lastLoginIp;

    /* 登录总次数 */
    private java.lang.Integer loginCount;


    /* get  */
    public java.lang.Integer getUserId() {
        return userId;
    }

    /* set  */
    public void setUserId(java.lang.Integer userId) {
        this.userId = userId;
    }
    /* get 用户名 */
    public java.lang.String getUserName() {
        return userName;
    }

    /* set 用户名 */
    public void setUserName(java.lang.String userName) {
        this.userName = userName;
    }
    /* get 用户昵称 */
    public java.lang.String getNickName() {
        return nickName;
    }

    /* set 用户昵称 */
    public void setNickName(java.lang.String nickName) {
        this.nickName = nickName;
    }
    /* get 用户登录密码 */
    public java.lang.String getPassword() {
        return password;
    }

    /* set 用户登录密码 */
    public void setPassword(java.lang.String password) {
        this.password = password;
    }
    /* get 用户状态：1表示正常 */
    public java.lang.Integer getUserState() {
        return userState;
    }

    /* set 用户状态：1表示正常 */
    public void setUserState(java.lang.Integer userState) {
        this.userState = userState;
    }
    /* get 用户类型：1表示普通用户 */
    public java.lang.Integer getUserType() {
        return userType;
    }

    /* set 用户类型：1表示普通用户 */
    public void setUserType(java.lang.Integer userType) {
        this.userType = userType;
    }
    /* get 头像URL */
    public java.lang.String getHeadPortrait() {
        return headPortrait;
    }

    /* set 头像URL */
    public void setHeadPortrait(java.lang.String headPortrait) {
        this.headPortrait = headPortrait;
    }
    /* get 手机号码 */
    public java.lang.String getMobilePhone() {
        return mobilePhone;
    }

    /* set 手机号码 */
    public void setMobilePhone(java.lang.String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }
    /* get 邮箱 */
    public java.lang.String getEmail() {
        return email;
    }

    /* set 邮箱 */
    public void setEmail(java.lang.String email) {
        this.email = email;
    }
    /* get 第三方用户类型 */
    public java.lang.String getThirdType() {
        return thirdType;
    }

    /* set 第三方用户类型 */
    public void setThirdType(java.lang.String thirdType) {
        this.thirdType = thirdType;
    }
    /* get 来源于哪个模块 */
    public java.lang.String getFromModule() {
        return fromModule;
    }

    /* set 来源于哪个模块 */
    public void setFromModule(java.lang.String fromModule) {
        this.fromModule = fromModule;
    }
    /* get 推荐人id */
    public java.lang.Integer getTId() {
        return tId;
    }

    /* set 推荐人id */
    public void setTId(java.lang.Integer tId) {
        this.tId = tId;
    }
    /* get 注册时间 */
    public java.sql.Timestamp getRegisterTime() {
        return registerTime;
    }

    /* set 注册时间 */
    public void setRegisterTime(java.sql.Timestamp registerTime) {
        this.registerTime = registerTime;
    }
    /* get 注册ip */
    public java.lang.String getRegisterIp() {
        return registerIp;
    }

    /* set 注册ip */
    public void setRegisterIp(java.lang.String registerIp) {
        this.registerIp = registerIp;
    }
    /* get 最后登录时间 */
    public java.sql.Timestamp getLastLoginTime() {
        return lastLoginTime;
    }

    /* set 最后登录时间 */
    public void setLastLoginTime(java.sql.Timestamp lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }
    /* get 最后登录ip */
    public java.lang.String getLastLoginIp() {
        return lastLoginIp;
    }

    /* set 最后登录ip */
    public void setLastLoginIp(java.lang.String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }
    /* get 登录总次数 */
    public java.lang.Integer getLoginCount() {
        return loginCount;
    }

    /* set 登录总次数 */
    public void setLoginCount(java.lang.Integer loginCount) {
        this.loginCount = loginCount;
    }

    public String toString() {
        return "User {" +
                " userId = " + userId +
                " , userName = " + userName +
                " , nickName = " + nickName +
                " , password = " + password +
                " , userState = " + userState +
                " , userType = " + userType +
                " , headPortrait = " + headPortrait +
                " , mobilePhone = " + mobilePhone +
                " , email = " + email +
                " , thirdType = " + thirdType +
                " , fromModule = " + fromModule +
                " , tId = " + tId +
                " , registerTime = " + registerTime +
                " , registerIp = " + registerIp +
                " , lastLoginTime = " + lastLoginTime +
                " , lastLoginIp = " + lastLoginIp +
                " , loginCount = " + loginCount +
                "}";
    }
}