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
	/**
	 * 添加一个用户
	 */
	public void addd(){
		User user = getModel(User.class);
		renderJson(userService.addUser(user));
	}
	/**
	 * 删除一个用户
	 */
	public void delete(){
		long id = getParaToLong("id");
		renderJson(userService.deleteUser(id));
	}

	/**
	 * 用户登录验证
	 */
	public void login(){
		User user = getModel(User.class);
		Subject subject=SecurityUtils.getSubject();
		String salt = PropKit.use("common.properties").get("md5_salt");//读取配置文件中的md5加密佐料
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
				e.printStackTrace();
				setAttr("errorInfo", "用户名或者密码错误");
				forwardAction("/login");
			}
		}
	}
}
