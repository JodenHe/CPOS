package com.scau.mis.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jfinal.log.Log;
import com.scau.mis.model.Permission;
import com.scau.mis.model.Role;
import com.scau.mis.model.User;
/**
 * 
 * @author 建棠
 * 用户信息基础操作
 */
public class UserService {
	public static Log log = Log.getLog(UserService.class);
	/**
	 * 
	 * @param user
	 * @return 添加用户操作
	 */
	public Map<String,Object> addUser(User user){
		Map<String,Object> result = new HashMap<String,Object>();
		if(!isExist(user.getId(), user.getUserName())){
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
			userName = user.get(0).getUserName();
		if(userName.equals(name))
			return false;
		else
			return true;
	}
	
	/**
	 * 根据用户名查询用户拥有的角色
	 * @param userName 用户名
	 * @return Set<String>角色名
	 */
	public Set<String> getRoles(String userName) {
		Set<String> roles=new HashSet<String>();
		String sql="select r.* from user u,role r,user_role ur where ur.roleId = r.id and ur.userId = u.id and u.userName='"+userName+"'";
		List<Role> list = Role.dao.find(sql);
		for (int i = 0; i < list.size(); i++) {
			roles.add(list.get(i).getRoleName());
		}
		return roles;
	}
	
	/**
	 * 根据用户名查询用户拥有的权限
	 * @param userName 用户名
	 * @return Set<String> 权限名
	 */
	public Set<String> getPermissions(String userName) {
		Set<String> permissions=new HashSet<String>();
		String sql="select p.* from user u,role r,permission p,user_role ur,role_permission rp where ur.roleId=r.id and ur.userId = u.id and rp.roleId=r.id and rp.permissionId=p.id and u.userName='"+userName+"'";
		List<Permission> list = Permission.dao.find(sql);
		for (int i = 0; i < list.size(); i++) {
			permissions.add(list.get(i).getPermissionName());
		}
		return permissions;
	}
	
	/**
	 * 根据用户名返回user
	 * @param userName 用户名
	 * @return User
	 */
	public User getByUserName(String userName) {
		String sql="select * from user where userName='"+userName+"'";
		List<User> user = User.dao.find(sql);
		if (user.size()>0) {
			return user.get(0);
		}
		return null;
	}
	
}
