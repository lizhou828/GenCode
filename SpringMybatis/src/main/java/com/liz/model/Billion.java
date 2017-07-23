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
public class Billion implements Serializable {

    private static final long serialVersionUID = 1L;

    /* 主键 */
    private Long id;

    /* IP地址 */
    private String ip;

    /* URL地址 */
    private String url;

    /* 标题 */
    private String title;

    /* 内容 */
    private String content;

    /* 创建者 */
    private String creator;

    /* 创建时间 */
    private java.sql.Timestamp createTime;

    /* 修改者 */
    private String modifier;

    /* 修改时间 */
    private java.sql.Timestamp modifierTime;


    /* get 主键 */
    public Long getId() {
        return id;
    }

    /* set 主键 */
    public void setId(Long id) {
        this.id = id;
    }
    /* get IP地址 */
    public String getIp() {
        return ip;
    }

    /* set IP地址 */
    public void setIp(String ip) {
        this.ip = ip;
    }
    /* get URL地址 */
    public String getUrl() {
        return url;
    }

    /* set URL地址 */
    public void setUrl(String url) {
        this.url = url;
    }
    /* get 标题 */
    public String getTitle() {
        return title;
    }

    /* set 标题 */
    public void setTitle(String title) {
        this.title = title;
    }
    /* get 内容 */
    public String getContent() {
        return content;
    }

    /* set 内容 */
    public void setContent(String content) {
        this.content = content;
    }
    /* get 创建者 */
    public String getCreator() {
        return creator;
    }

    /* set 创建者 */
    public void setCreator(String creator) {
        this.creator = creator;
    }
    /* get 创建时间 */
    public java.sql.Timestamp getCreateTime() {
        return createTime;
    }

    /* set 创建时间 */
    public void setCreateTime(java.sql.Timestamp createTime) {
        this.createTime = createTime;
    }
    /* get 修改者 */
    public String getModifier() {
        return modifier;
    }

    /* set 修改者 */
    public void setModifier(String modifier) {
        this.modifier = modifier;
    }
    /* get 修改时间 */
    public java.sql.Timestamp getModifierTime() {
        return modifierTime;
    }

    /* set 修改时间 */
    public void setModifierTime(java.sql.Timestamp modifierTime) {
        this.modifierTime = modifierTime;
    }

    public String toString() {
        return "Billion {" +
                    " id = " + id +
                    " , ip = " + ip +
                    " , url = " + url +
                    " , title = " + title +
                    " , content = " + content +
                    " , creator = " + creator +
                    " , createTime = " + createTime +
                    " , modifier = " + modifier +
                    " , modifierTime = " + modifierTime +
            "}";
        }
}