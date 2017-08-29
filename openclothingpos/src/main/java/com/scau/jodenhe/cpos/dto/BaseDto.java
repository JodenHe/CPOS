package com.scau.jodenhe.cpos.dto;

import com.scau.jodenhe.cpos.enums.CposStateEnum;

/**
 * 
 * <p>Title: 基础dto对象</p>
 * <p>Description: </p>
 * <p>Copyright: 1.0</p>
 * <p>Company: scau</p>
 * @author 何晓锋
 * @version 1.0
 * 2017年8月29日   下午2:39:24
 */
public class BaseDto<T> {
	//执行结果状态
	private int state;
	//状态信息
	private String stateInfo;
	//操作对象
	private T o;
	
	public BaseDto (CposStateEnum stateEnum, T o) {
		super();
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
		this.o = o;
	}
	
	public BaseDto (CposStateEnum stateEnum) {
		super();
		this.state = stateEnum.getState();
		this.stateInfo = stateEnum.getStateInfo();
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public void setStateInfo(String stateInfo) {
		this.stateInfo = stateInfo;
	}

	public T getO() {
		return o;
	}

	public void setO(T o) {
		this.o = o;
	}

	@Override
	public String toString() {
		return "BaseDto [state=" + state + ", stateInfo=" + stateInfo + ", o=" + o + "]";
	}
	
}
