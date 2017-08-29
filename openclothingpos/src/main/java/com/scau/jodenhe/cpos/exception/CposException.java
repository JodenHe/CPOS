package com.scau.jodenhe.cpos.exception;

/**
 * 
 * <p>Title: CPOS业务异常类</p>
 * <p>Description: </p>
 * <p>Copyright: 1.0</p>
 * <p>Company: SCAU</p>
 * @author 何晓锋
 * @version 1.0
 * 2017年8月29日   下午2:26:17
 */
public class CposException extends Exception {

	private static final long serialVersionUID = 1L;

	public CposException(String message) {
		super(message);
	}

	public CposException(String message, Throwable cause) {
		super(message, cause);
	}
}
