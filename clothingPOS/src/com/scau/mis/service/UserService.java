package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.User;
/**
 * 
 * @author 建棠
 * 用户信息基础操作
 */
public class UserService {
	public static Log log = Log.getLog(SizeService.class);
	/**
	 * 
	 * @param user
	 * @return 添加用户操作
	 */
	public Map<String,Object> addUser(User user){
		Map<String,Object> result = new HashMap<String,Object>();
		if(!isExist(user.getId(), user.getUsername())){
			if(user.save()){
				result.put("status", true);
				result.put("data", "新增用户成功！");
			}else{
				result.put("status", false);
				result.put("data", "添加用户失败");
			}
		}else{
			result.put("status", false);
			result.put("data", "用户名已存在");
		}
		return result;
	}
	/**
	 * 
	 * @param id
	 * @return 通过id删除用户
	 */
	public Map<String,Object> deleteUser(long id){
		Map<String,Object> result = new HashMap<String,Object>();
		User user = User.dao.findById(id);
		if(user.delete()){
			result.put("status", true);
			result.put("data", "删除用户成功！");
		}else{
			result.put("status", false);
			result.put("data", "删除用户失败");
		}
		return result;
	}
	public boolean isExist(long id,String name){
		String userName="";
		List<User> user = (List<User>) User.dao.findById(id);
		if(user.size()!=0)
			userName = user.get(0).getUsername();
		if(userName.equals(name))
			return false;
		else
			return true;
	}
	
}
