package com.scau.mis.controller;


import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.scau.mis.model.User;
import com.scau.mis.service.UserService;
import com.scau.mis.util.CryptographyUtil;
/**
 * 
 * @author 建棠
 * 用户信息基础操作
 */
public class UserController extends Controller {
	public static Log log = Log.getLog(UserController.class);
	private UserService userService  = new UserService();
	private String salt = PropKit.use("common.properties").get("md5_salt");//读取配置文件中的md5加密佐料
	
	/**
	 * 获取所有用户信息
	 */
	public void getAllUser(){
		renderJson(userService.getAllUser());
	}
	
	/**
	 * 根据id获取用户信息
	 */
	public void getUserById(){
		long id = getParaToLong("id");
		renderJson(userService.getUserById(id));
	}
	
	/**
	 * 添加一个用户
	 */
	public void add(){
		User user = getModel(User.class);
		user.setPassword(CryptographyUtil.md5(user.getPassword(), salt));
		System.out.println(user);
		renderJson(userService.addUser(user));
	}
	/**
	 * 删除一个用户
	 */
	public void delete(){
		long id = getParaToLong("id");
		try {
			if (userService.deleteUser(id)) {
				renderJson(" {\"status\":true,\"msg\":\"成功删除用户！\"} ");
			}else{
				renderJson(" {\"status\":false,\"msg\":\"删除用户失败！\"} ");
			}
			
		} catch (Exception e) {
			log.warn(e+e.getMessage());
			renderJson(" {\"status\":false,\"msg\":\"无法删除用户请先移除用户分配的角色！\"} ");
		}
	}

	/**
	 * 更新用户信息，包括角色的映射
	 */
	public void update(){
		User user = getModel(User.class);
		long roleId = null==getParaToLong("roleId")?-1L:getParaToLong("roleId");
		
		User oldUser = User.dao.findById(user.getId());
		if(!oldUser.getPassword().equals(user.getPassword())){
			user.setPassword(CryptographyUtil.md5(user.getPassword(), salt));
		}
		if(userService.updateUser(user, roleId)){
			renderJson(" {\"status\":true,\"msg\":\"更新成功！\"} ");
		}else{
			renderJson(" {\"status\":false,\"msg\":\"更新失败！\"} ");
		}
	}
	
	/**
	 * 用户登录验证
	 */
	public void login(){
		User user = getModel(User.class);
		Subject subject=SecurityUtils.getSubject();
		String errorInfo = "";

		if (null == user.getUserName() || null == user.getPassword()) {
			errorInfo = "用户名或者密码错误";
			setAttr("errorInfo", errorInfo);
			forwardAction("/login");
		}else{
			UsernamePasswordToken token=new UsernamePasswordToken(user.getUserName(), CryptographyUtil.md5(user.getPassword(), salt));
			try{
				subject.login(token);
				Session session=subject.getSession();
				log.info("\n"+new Date()+"\n用户："+user.getUserName()+"登入系统;\nip地址:"+session.getHost());
				session.setAttribute("info", "session的数据");
				redirect("/admin");
			}catch(Exception e){
				log.error(e+":"+e.getMessage());
				setAttr("errorInfo", "用户名或者密码错误");
				forwardAction("/login");
			}
		}
	}
}
