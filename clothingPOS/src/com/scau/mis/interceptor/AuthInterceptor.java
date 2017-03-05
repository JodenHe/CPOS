package com.scau.mis.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;

/**
 * 全局拦截器，用于验证,保存操作记录等
 * @author jodenhe
 *
 */
public class AuthInterceptor implements Interceptor {
	public static Log log = Log.getLog(AuthInterceptor.class);

	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
		log.info(controller.getRequest().getRemoteAddr()+" 请求链接：" + inv.getActionKey()+"  请求参数："+controller.getParaMap());
		inv.invoke();
	}
}
