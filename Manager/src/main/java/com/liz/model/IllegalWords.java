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
public class IllegalWords implements Serializable {

    private static final long serialVersionUID = 1L;

    /*  */
    private Integer id;

    /* 脏词内容 */
    private String content;

    /* 要替换成的字符 */
    private String replaceChar;

    /* 状态(0为关闭，1为启动) */
    private Integer status;

    /*  */
    private String creator;

    /*  */
    private java.sql.Timestamp createDate;

    /*  */
    private String modifier;

    /*  */
    private java.sql.Timestamp modifyDate;


    /* get  */
    public Integer getId() {
        return id;
    }

    /* set  */
    public void setId(Integer id) {
        this.id = id;
    }
    /* get 脏词内容 */
    public String getContent() {
        return content;
    }

    /* set 脏词内容 */
    public void setContent(String content) {
        this.content = content;
    }
    /* get 要替换成的字符 */
    public String getReplaceChar() {
        return replaceChar;
    }

    /* set 要替换成的字符 */
    public void setReplaceChar(String replaceChar) {
        this.replaceChar = replaceChar;
    }
    /* get 状态(0为关闭，1为启动) */
    public Integer getStatus() {
        return status;
    }

    /* set 状态(0为关闭，1为启动) */
    public void setStatus(Integer status) {
        this.status = status;
    }
    /* get  */
    public String getCreator() {
        return creator;
    }

    /* set  */
    public void setCreator(String creator) {
        this.creator = creator;
    }
    /* get  */
    public java.sql.Timestamp getCreateDate() {
        return createDate;
    }

    /* set  */
    public void setCreateDate(java.sql.Timestamp createDate) {
        this.createDate = createDate;
    }
    /* get  */
    public String getModifier() {
        return modifier;
    }

    /* set  */
    public void setModifier(String modifier) {
        this.modifier = modifier;
    }
    /* get  */
    public java.sql.Timestamp getModifyDate() {
        return modifyDate;
    }

    /* set  */
    public void setModifyDate(java.sql.Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

    public String toString() {
        return "IllegalWords {" +
                    " id = " + id +
                    " , content = " + content +
                    " , replaceChar = " + replaceChar +
                    " , status = " + status +
                    " , creator = " + creator +
                    " , createDate = " + createDate +
                    " , modifier = " + modifier +
                    " , modifyDate = " + modifyDate +
            "}";
        }
}