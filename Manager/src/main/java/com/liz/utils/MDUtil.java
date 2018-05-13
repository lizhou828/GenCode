/*
 *Project: core
 *File: com.glorypty.credentials.core.utils.MD5Util.java <15 Nov 2017>
 ****************************************************************
 * 版权所有@2017 国裕网络科技  保留所有权利.
 ***************************************************************/
package com.liz.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 密码加密
 * @author Guohao<15 Nov 2017>
 */
public class MDUtil {

	private static MessageDigest messageDigest = null;

	public static String sha1(String text) {
		if(text == null){
			return null;
		}
		MessageDigest md = null;
		String outStr = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(text.getBytes());
			outStr = byteToString(digest);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		return outStr;
		}

	private static String byteToString(byte[] digest) {
		StringBuilder buf = new StringBuilder();
		for (int i = 0; i < digest.length; i++) {
			String tempStr = Integer.toHexString(digest[i] & 0xff);
		if (tempStr.length() == 1) {
			buf.append("0").append(tempStr);
		} else {
			buf.append(tempStr);
		}
		}
		return buf.toString().toLowerCase();
	}


	/**
	 * MD5加密
	 * @param data
	 * @return
	 */
	public static final synchronized String md5Encrypt(String data) {
		if(messageDigest == null) {
			try {
				messageDigest = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException var2) {
				System.err.println("Failed to load the MD5 MessageDigest. We will be unable to function normally.");
				var2.printStackTrace();
			}
		}

		messageDigest.update(data.getBytes());
		return encodeHex(messageDigest.digest());
	}

	private static final String encodeHex(byte[] bytes) {
		StringBuffer buf = new StringBuffer(bytes.length * 2);
		for(int i = 0; i < bytes.length; ++i) {
			if((bytes[i] & 255) < 16) {
				buf.append("0");
			}
			buf.append(Long.toString((long)(bytes[i] & 255), 16));
		}
		return buf.toString().toUpperCase();
	}

	public static void main(String[] args) {
		System.out.println(md5Encrypt("123456"));
	}
}
