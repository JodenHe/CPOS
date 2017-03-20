package com.scau.mis.util;

import com.jfinal.kit.PathKit;
 
/**
 * 条形码工具类
 * @author jodenhe
 *
 */
public class BarcodeUtilTest {
 
    public static void main(String[] args) {
    	String contextPath = PathKit.getWebRootPath();
    	String name = TimeUtils.getCurrentTime();
		String path = "/barcode/" + name +".png";
		String pathUrl = contextPath + path;
        String msg = "123456789";
        BarcodeUtil.generateFile(msg, pathUrl);
    }
}