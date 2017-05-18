package com.scau.mis.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

public class CommonUtil {

	/**
	 * 检验字符串是否为日期格式
	 * @param inDate
	 * @return
	 */
	public static boolean isValidDate(String inDate, String format) {

		if (inDate == null)
			return false;

		//set the format to use as a constructor argument
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);

		if (inDate.trim().length() != dateFormat.toPattern().length())
			return false;

		dateFormat.setLenient(false);

		try {
			//parse the inDate parameter
			dateFormat.parse(inDate.trim());
		}
		catch (ParseException pe) {
			return false;
		}
		return true;
	}

	/**
	 * 判断是否为整数
	 * @param str 传入的字符串
	 * @return 是整数返回true,否则返回false 
	 */
	public static boolean isInteger(String str) {    
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");    
		return pattern.matcher(str).matches();    
	}  

	/**
	 * 将形如“1,2,3,4”的字符串转换为[1,2,3,4]的list数组
	 * @param str 要转型的字符串
	 * @return 转型后的list字符串数组
	 */
	public static List<String> stringToStringList(String str) {
		String[] arrayStr =new String[]{};
		arrayStr = str.split(",");
		return java.util.Arrays.asList(arrayStr);
	}
	
	/**
	 * 将形如“1,2,3,4”的字符串转换为[1,2,3,4]的list数组
	 * @param str 要转型的字符串
	 * @return 转型后的list Long数组
	 */
	public static List<Long> stringToLongList(String str) {
		List<String> t = stringToStringList(str);
		List<Long> result = new ArrayList<Long>();
		for (String s : t) {
			result.add(Long.parseLong(s));
		}
		return result;
	}

	/**
	 * 将字符串按格式转换为Date型
	 * @param time 字符串日期
	 * @param format 格式
	 * @return Date型日期
	 */
	public static Date stringToDate(String time,String format) {
		SimpleDateFormat sdf  =   new  SimpleDateFormat(format); 
		Date date=new Date();
		try {
			date=sdf.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
}
