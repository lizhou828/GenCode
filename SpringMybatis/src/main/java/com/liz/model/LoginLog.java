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
public class LoginLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer id;

    /* 用户id */
    private Integer userId;

    /* 用户名 */
    private String userName;

    /* 登陆ip */
    private String loginIp;

    /* 登陆时间 */
    private java.sql.Timestamp loginTime;

    /* 请求的referer */
    private String referer;

    /* 设备类型 */
    private String deviceType;

    /* 浏览器类型 */
    private String browserType;

    /* 登陆的url */
    private String loginUrl;

    /* 浏览器的userAgent */
    private String userAgent;


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
    /* get 用户名 */
    public String getUserName() {
        return userName;
    }

    /* set 用户名 */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    /* get 登陆ip */
    public String getLoginIp() {
        return loginIp;
    }

    /* set 登陆ip */
    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }
    /* get 登陆时间 */
    public java.sql.Timestamp getLoginTime() {
        return loginTime;
    }

    /* set 登陆时间 */
    public void setLoginTime(java.sql.Timestamp loginTime) {
        this.loginTime = loginTime;
    }
    /* get 请求的referer */
    public String getReferer() {
        return referer;
    }

    /* set 请求的referer */
    public void setReferer(String referer) {
        this.referer = referer;
    }
    /* get 设备类型 */
    public String getDeviceType() {
        return deviceType;
    }

    /* set 设备类型 */
    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }
    /* get 浏览器类型 */
    public String getBrowserType() {
        return browserType;
    }

    /* set 浏览器类型 */
    public void setBrowserType(String browserType) {
        this.browserType = browserType;
    }
    /* get 登陆的url */
    public String getLoginUrl() {
        return loginUrl;
    }

    /* set 登陆的url */
    public void setLoginUrl(String loginUrl) {
        this.loginUrl = loginUrl;
    }
    /* get 浏览器的userAgent */
    public String getUserAgent() {
        return userAgent;
    }

    /* set 浏览器的userAgent */
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public String toString() {
        return "LoginLog {" +
                " , id = " + id +
                " , userId = " + userId +
                " , userName = " + userName +
                " , loginIp = " + loginIp +
                " , loginTime = " + loginTime +
                " , referer = " + referer +
                " , deviceType = " + deviceType +
                " , browserType = " + browserType +
                " , loginUrl = " + loginUrl +
                " , userAgent = " + userAgent +
            "}";
        }
}