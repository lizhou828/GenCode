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
public class UserThird implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer id;

    /* 用户id */
    private Integer userId;

    /* QQ号码 */
    private String qqNumber;

    /* QQ昵称 */
    private String qqNcikName;

    /* QQopenId */
    private String qqOpenId;

    /* QQ头像 */
    private String qqPortrait;

    /* 微信openId */
    private String weixinOpenId;

    /* 微信昵称 */
    private String weixinNickNmae;

    /* 创建时间 */
    private java.sql.Timestamp createTime;

    /* 更新时间 */
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
    /* get QQ号码 */
    public String getQqNumber() {
        return qqNumber;
    }

    /* set QQ号码 */
    public void setQqNumber(String qqNumber) {
        this.qqNumber = qqNumber;
    }
    /* get QQ昵称 */
    public String getQqNcikName() {
        return qqNcikName;
    }

    /* set QQ昵称 */
    public void setQqNcikName(String qqNcikName) {
        this.qqNcikName = qqNcikName;
    }
    /* get QQopenId */
    public String getQqOpenId() {
        return qqOpenId;
    }

    /* set QQopenId */
    public void setQqOpenId(String qqOpenId) {
        this.qqOpenId = qqOpenId;
    }
    /* get QQ头像 */
    public String getQqPortrait() {
        return qqPortrait;
    }

    /* set QQ头像 */
    public void setQqPortrait(String qqPortrait) {
        this.qqPortrait = qqPortrait;
    }
    /* get 微信openId */
    public String getWeixinOpenId() {
        return weixinOpenId;
    }

    /* set 微信openId */
    public void setWeixinOpenId(String weixinOpenId) {
        this.weixinOpenId = weixinOpenId;
    }
    /* get 微信昵称 */
    public String getWeixinNickNmae() {
        return weixinNickNmae;
    }

    /* set 微信昵称 */
    public void setWeixinNickNmae(String weixinNickNmae) {
        this.weixinNickNmae = weixinNickNmae;
    }
    /* get 创建时间 */
    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    /* set 创建时间 */
    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }
    /* get 更新时间 */
    public java.sql.Timestamp getUpdateTime() {
        return updateTime;
    }

    /* set 更新时间 */
    public void setUpdateTime(java.sql.Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String toString() {
        return "UserThird {" +
                " , id = " + id +
                " , userId = " + userId +
                " , qqNumber = " + qqNumber +
                " , qqNcikName = " + qqNcikName +
                " , qqOpenId = " + qqOpenId +
                " , qqPortrait = " + qqPortrait +
                " , weixinOpenId = " + weixinOpenId +
                " , weixinNickNmae = " + weixinNickNmae +
                " , createTime = " + createTime +
                " , updateTime = " + updateTime +
            "}";
        }
}