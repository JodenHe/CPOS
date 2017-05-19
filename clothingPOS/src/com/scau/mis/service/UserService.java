package com.scau.mis.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.scau.mis.model.Permission;
import com.scau.mis.model.Role;
import com.scau.mis.model.User;
import com.scau.mis.model.UserRole;
/**
 * 
 * @author 建棠
 * 用户信息基础操作
 */
public class UserService {
	public static Log log = Log.getLog(UserService.class);
	
	/**
	 * 获取所有的用户信息
	 * @return
	 */
	public List<User> getAllUser(){
		String sql = "select u.*,(select r.roleName from user_role ur,role r where u.id=ur.userId and r.id=ur.roleId) roleName from user u";
		return User.dao.find(sql);
	}
	
	/**
	 * 有特定的id获取用户信息
	 * @return
	 */
	public List<User> getUserById(long id){
		String sql = "select u.*,(select r.roleName from user_role ur,role r where u.id=ur.userId and r.id=ur.roleId) roleName from user u where u.id="+id;
		return User.dao.find(sql);
	}
	
	/**
	 * 修改用户信息
	 * @param user 用户实例
	 * @param roleId 角色id
	 * @return
	 */
	public boolean updateUser(final User user,final long roleId){
		//使用事务进行批量操作，当某条记录失败时，回滚
		boolean succeed = Db.tx(new IAtom() {

			@Override
			public boolean run() throws SQLException {
				UserRole ur = new UserRole();
				ur.setUserId(user.getId());
				ur.setRoleId(roleId);
				
				String sql = "select * from user_role where userId = "+user.getId();
				List<UserRole> list = UserRole.dao.find(sql);
				if(roleId==-1){
					if(list.size()<=0){//如果用户角色不存在就进行映射的插入
						return user.update();
					}else{//如果用户原来已有角色了，则进行角色的更新
						ur.setId(list.get(0).getId());
						return user.update()&&ur.delete();
					}
				}else{
					if(list.size()<=0){//如果用户角色不存在就进行映射的插入
						return user.update()&&ur.save();
					}else{//如果用户原来已有角色了，则进行角色的更新
						ur.setId(list.get(0).getId());
						return user.update()&&ur.update();
					}
				}
			}
		});
		return succeed;
	}
	/**
	 * 
	 * @param user
	 * @return 添加用户操作
	 */
	public Map<String,Object> addUser(User user){
		Map<String,Object> result = new HashMap<String,Object>();
		user.setCreateTime(new Date());
		if(!isExist(user.getUserName())){
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
	 * 通过id删除用户
	 * @param id
	 * @return
	 * @throws Exception 有分配角色异常
	 */
	public boolean deleteUser(long id) throws Exception{
		return User.dao.deleteById(id);
	}
	
	public boolean isExist(long id,String name){
		String userName="";
		@SuppressWarnings("unchecked")
		List<User> user = (List<User>) User.dao.findById(id);
		if(user.size()!=0)
			userName = user.get(0).getUserName();
		if(userName.equals(name))
			return false;
		else
			return true;
	}
	
	/**
	 * 判断用户名是否存在
	 * @param name 用户名
	 * @return
	 */
	public boolean isExist(String name){
		String sql = "select * from user where userName = '"+name+"'";
		List<User> user =  User.dao.find(sql);
		return user.size()>0;
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
			roles.add(list.get(i).getRoleSign());
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
			permissions.add(list.get(i).getPermissionSign());
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
