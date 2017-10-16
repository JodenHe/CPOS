package com.scau.jodenhe.cpos.enums;

/**
 * 使用枚举表达常量数据字段
 * 
 * @author jodenhe
 * 
 */
public enum CposStateEnum {
	/**
	 * SUCCESS
	 */
	SUCCESS(1, "成功"),
	/**
	 * FAIL
	 */
	FAIL(0, "失败"),
	/**
	 * Name already exits
	 */
	REPEAT_NAME(-1, "名字已存在"), 
	/**
	 * Inner error
	 */
	INNER_ERROR(-2, "系统异常");

	private int state;
	private String stateInfo;

	CposStateEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}

	public static CposStateEnum stateOf(int index) {
		for (CposStateEnum state : values()) {
			if (state.getState() == index) {
				return state;
			}
		}
		return null;
	}

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}

}
