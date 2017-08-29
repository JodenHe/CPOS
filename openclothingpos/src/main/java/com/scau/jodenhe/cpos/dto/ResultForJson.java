package com.scau.jodenhe.cpos.dto;

/**
 * 所有的ajax请求返回类型，封装json结果
 * @author jodenhe
 *
 */
public class ResultForJson<T> {
	private boolean success;
	
	private T data;
	
	private String msg;

	public ResultForJson(boolean success, T data) {
		super();
		this.success = success;
		this.data = data;
	}

	public ResultForJson(boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}
	public ResultForJson(boolean success, T data, String msg) {
		super();
		this.success = success;
		this.data = data;
		this.msg = msg;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
