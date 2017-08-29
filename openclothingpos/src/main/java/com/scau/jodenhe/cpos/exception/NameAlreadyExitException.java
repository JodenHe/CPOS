package com.scau.jodenhe.cpos.exception;

/**
 * 
 * <p>Title: 实体保存异常</p>
 * <p>Description: </p>
 * <p>Company: scau</p>
 * <p>Copyright: </p>
 * @author jodenhe
 * @version 1.0
 * @since 2017年8月29日 下午12:33:10
 */
public class NameAlreadyExitException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public NameAlreadyExitException(String message) {
		super(message);
	}

	public NameAlreadyExitException(String message, Throwable cause) {
		super(message, cause);
	}
}
