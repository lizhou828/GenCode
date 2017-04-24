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
    private Integer userId;

    /* 用户名 */
    private String userName;

    /* 用户昵称 */
    private String nickName;

    /* 用户登录密码 */
    private String password;

    /* 用户状态：1表示正常 */
    private Integer userState;

    /* 用户类型：1表示普通用户 */
    private Integer userType;

    /* 头像URL */
    private String headPortrait;

    /* 手机号码 */
    private String mobilePhone;

    /* 邮箱 */
    private String email;

    /* 第三方用户类型 */
    private String thirdType;

    /* 来源于哪个模块 */
    private String fromModule;

    /* 推荐人id */
    private Integer tId;

    /* 注册时间 */
    private java.sql.Timestamp registerTime;

    /* 注册ip */
    private String registerIp;

    /* 最后登录时间 */
    private java.sql.Timestamp lastLoginTime;

    /* 最后登录ip */
    private String lastLoginIp;

    /* 登录总次数 */
    private Integer loginCount;


    /* get  */
    public Integer getUserId() {
        return userId;
    }

    /* set  */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    /* get 用户名 */
    public String getUserName() {
        return userName;
    }

    /* set 用户名 */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    /* get 用户昵称 */
    public String getNickName() {
        return nickName;
    }

    /* set 用户昵称 */
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    /* get 用户登录密码 */
    public String getPassword() {
        return password;
    }

    /* set 用户登录密码 */
    public void setPassword(String password) {
        this.password = password;
    }
    /* get 用户状态：1表示正常 */
    public Integer getUserState() {
        return userState;
    }

    /* set 用户状态：1表示正常 */
    public void setUserState(Integer userState) {
        this.userState = userState;
    }
    /* get 用户类型：1表示普通用户 */
    public Integer getUserType() {
        return userType;
    }

    /* set 用户类型：1表示普通用户 */
    public void setUserType(Integer userType) {
        this.userType = userType;
    }
    /* get 头像URL */
    public String getHeadPortrait() {
        return headPortrait;
    }

    /* set 头像URL */
    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }
    /* get 手机号码 */
    public String getMobilePhone() {
        return mobilePhone;
    }

    /* set 手机号码 */
    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }
    /* get 邮箱 */
    public String getEmail() {
        return email;
    }

    /* set 邮箱 */
    public void setEmail(String email) {
        this.email = email;
    }
    /* get 第三方用户类型 */
    public String getThirdType() {
        return thirdType;
    }

    /* set 第三方用户类型 */
    public void setThirdType(String thirdType) {
        this.thirdType = thirdType;
    }
    /* get 来源于哪个模块 */
    public String getFromModule() {
        return fromModule;
    }

    /* set 来源于哪个模块 */
    public void setFromModule(String fromModule) {
        this.fromModule = fromModule;
    }
    /* get 推荐人id */
    public Integer getTId() {
        return tId;
    }

    /* set 推荐人id */
    public void setTId(Integer tId) {
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
    public String getRegisterIp() {
        return registerIp;
    }

    /* set 注册ip */
    public void setRegisterIp(String registerIp) {
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
    public String getLastLoginIp() {
        return lastLoginIp;
    }

    /* set 最后登录ip */
    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }
    /* get 登录总次数 */
    public Integer getLoginCount() {
        return loginCount;
    }

    /* set 登录总次数 */
    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public String toString() {
        return "User {" +
                " , userId = " + userId +
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