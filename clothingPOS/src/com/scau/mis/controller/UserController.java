package com.scau.mis.controller;


import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Size;
import com.scau.mis.model.User;
import com.scau.mis.service.UserService;
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
}
