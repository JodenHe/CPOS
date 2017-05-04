/**
 * Copyright (C) 2014 陕西威尔伯乐信息技术有限公司
 * @Package com.wellbole.web.core.realm  
 * @Title: ShiroDbRealm.java  
 * @Description: 基于db实现的shiro realm   
 * @author 李飞 (lifei@wellbole.com)    
 * @date 2014年9月8日  下午10:10:38  
 * @since V1.0.0 
 *
 * Modification History:
 * Date         Author      Version     Description
 * -------------------------------------------------------------
 * 2014年9月8日   李飞        V1.0.0        新建文件   
 */
package com.scau.mis.shiro;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Model;
import com.scau.mis.model.Role;
import com.scau.mis.model.User;

public class ShiroDbRealm extends AuthorizingRealm {
	public String getName() {
		return "DbRealm";
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		Model m = (Model) principals.fromRealm(getName()).iterator().next();
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();

		if( null == m){
			return info;
		}

		Role role=Role.dao.findFirst("select * from roles where id = ? limit 1", m.getInt("roleid"));
		if( null == role){
			return info;
		}

		info.addRole(role.getStr("rolename"));

		return info;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
			throws AuthenticationException {

		CaptchaUsernamePasswordToken authcToken = (CaptchaUsernamePasswordToken) token;

		if (authcToken.getUsername()==null||StrKit.isBlank(authcToken.getUsername())) {
			throw new AuthenticationException("用户名不可以为空");
		}

		String loginName=authcToken.getUsername();

		String extraStr=authcToken.getExtra();
		if (StringUtils.equals(extraStr, "admin")) {
			User admin = User.dao.findFirst("select * from admin where loginname = ? and islock=0 limit 1",loginName);
			if (null == admin) {
				throw new AuthenticationException("用户名或者密码错误");
			}else{
				return new SimpleAuthenticationInfo(admin, admin.getStr("loginpass"), getName());
			}
		}else {
			User student = User.dao.findFirst("select * from students where loginname = ? and enable =1 limit 1",loginName);
			if (null == student) {
				throw new AuthenticationException("用户名或者密码错误");
			}else{
				return new SimpleAuthenticationInfo(student, student.getStr("loginpass"), getName());
			}
		}   
	}
}