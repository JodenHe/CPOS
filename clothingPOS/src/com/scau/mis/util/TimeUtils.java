package com.scau.mis.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
	/** 默认的格式化方式 */
	private static final String defaultFormat = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 格式化当前日期的格式，如2017-01-02 10:20:02
	 * @return 格式化的字符串日期
	 */
	public static String getDate() {
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Date currentDate = new Date();
		String formatCurrentDate = dateFormat.format(currentDate).toString();
		return formatCurrentDate;
	}

	/**
	 * 格式化当前日期的格式，如2017-01-02
	 * @return 格式化的字符串日期
	 */
	public static String getCurrentDate() {
		String format = "yyyy-MM-dd";
		Date date = new Date();
		date.setTime(System.currentTimeMillis());
		if (format == null || "".equals(format.trim())) {
			format = defaultFormat;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}

	/**
	 * 格式化当前日期的格式，如20170102102002
	 * @return 格式化的字符串日期
	 */
	public static String getCurrentTime() {
		String format = "yyyyMMddHHmmss";
		Date date = new Date();
		date.setTime(System.currentTimeMillis());
		if (format == null || "".equals(format.trim())) {
			format = defaultFormat;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(date);
	}
}