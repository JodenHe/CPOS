package com.scau.mis.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;

import com.jfinal.kit.PropKit;

public class CryptographyUtil {

	/**
	 * base64加密
	 * @param str
	 * @return
	 */
	public static String encBase64(String str){
		return Base64.encodeToString(str.getBytes());
	}
	
	/**
	 * base64解密
	 * @param str
	 * @return
	 */
	public static String decBase64(String str){
		return Base64.decodeToString(str);
	}
	
	/**
	 * Md5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str,String salt){
		return new Md5Hash(str,salt).toString();
	}
	
	public static void main(String[] args) {
		String password="123456";
		String salt = PropKit.use("common.properties").get("md5_salt");
		System.out.println("salt:"+salt);
		System.out.println("Base64加密："+CryptographyUtil.encBase64(password));
		System.out.println("Base64解密："+CryptographyUtil.decBase64(CryptographyUtil.encBase64(password)));
		
		System.out.println("Md5加密："+CryptographyUtil.md5(password, salt));
	}
}