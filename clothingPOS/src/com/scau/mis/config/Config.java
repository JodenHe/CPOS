package com.scau.mis.config;


import cn.dreampie.shiro.freemarker.ShiroTags;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.Const;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.plugin.shiro.ShiroInterceptor;
import com.jfinal.ext.plugin.shiro.ShiroPlugin;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.FreeMarkerRender;
import com.scau.mis.handler.SessionHandler;
import com.scau.mis.interceptor.AuthInterceptor;
import com.scau.mis.model._MappingKit;

/**
 * API引导式配置
 */
public class Config extends JFinalConfig {

	/**
	 * 供Shiro插件使用。
	 */
	Routes routes;

	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		// 加载少量必要配置，随后可用PropKit.get(...)获取值
		PropKit.use("jdbc.properties");
		//默认10M,此处设置为最大1000M
		me.setMaxPostSize(100*Const.DEFAULT_MAX_POST_SIZE);
		me.setDevMode(true);
	}

	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		this.routes = me;
		me.add(new FrontRoutes());// 前端路由
		me.add(new AdminRoutes());// 后端路由
	}

	public static C3p0Plugin createC3p0Plugin() {
		return new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
	}

	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		//加载Shiro插件
		ShiroPlugin shiroPlugin = new ShiroPlugin(this.routes);
		shiroPlugin.setLoginUrl("/login");
		shiroPlugin.setUnauthorizedUrl("/unauthorized");
		me.add(shiroPlugin);

		// 配置C3p0数据库连接池插件
		C3p0Plugin C3p0Plugin = createC3p0Plugin();
		//当连接池中的连接耗尽的时候c3p0一次同时获取的连接数。Default: 3
		C3p0Plugin.setAcquireIncrement(5);
		//初始化时获取三个连接，取值应在minPoolSize与maxPoolSize之间。Default: 3
		C3p0Plugin.setInitialPoolSize(3);
		//最大空闲时间,2秒内未使用则连接被丢弃。若为0则永不丢弃。Default: 0
		C3p0Plugin.setMaxIdleTime(5);
		//连接池中保留的最大连接数。Default: 15
		C3p0Plugin.setMaxPoolSize(50);
		//连接池中保留的最小连接数
		C3p0Plugin.setMinPoolSize(3);
		me.add(C3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(C3p0Plugin);
		me.add(arp);

		// 所有配置在 MappingKit 中搞定
		_MappingKit.mapping(arp);
		arp.setShowSql(true);
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		me.add(new AuthInterceptor());
		me.add(new ShiroInterceptor());//shiro插件的拦截器
	}

	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new SessionHandler());
		me.add(new ContextPathHandler("contextPath")) ;
	}

	/**
	 * 配置Freemarker-Jfinal-shiro
	 */
	@Override
	public void afterJFinalStart() {
		super.afterJFinalStart();
		FreeMarkerRender.getConfiguration().setSharedVariable("shiro", new ShiroTags());
	}

	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8082, "/", 5);
	}
}
