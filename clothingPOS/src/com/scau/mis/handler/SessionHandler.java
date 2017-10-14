package com.scau.mis.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jfinal.handler.Handler;

/**
 * 修复 url:test;jsessionid=XXXXXXXXXXX 形式url会话丢失问题
 * @author jodenhe
 * @create 2017年10月14日 下午7:47:53
 */
public class SessionHandler extends Handler {	

	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		int index = target.lastIndexOf(";jsessionid");
		target = index==-1?target:target.substring(0, index);
		next.handle(target, request, response, isHandled);
	}
}
