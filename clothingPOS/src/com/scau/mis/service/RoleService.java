package com.scau.mis.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.scau.mis.model.Role;
import com.scau.mis.model.UserRole;

/**
 * 角色管理业务逻辑
 * @author jodenhe
 *
 */
public class RoleService {
	public final static Log log = Log.getLog(RoleService.class);

	/**
	 * 获取所有角色
	 * @return
	 */
	public List<Role> getAllRoles() {
		String sql = "select * from role r";
		List<Role> role = Role.dao.find(sql);
		return role;
	}

	/**
	 * 分配角色给用户
	 * @param ur UserRole对象
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> setRoleToUser(UserRole ur){
		Map<String,Object> result = new HashMap<String, Object>();
		if (ur.save()) {
			result.put("status", true);
			result.put("msg", "角色分配成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，角色分配失败！");
		}
		return result;
	}

	/**
	 * 分配多个角色给用户
	 * @param urs List<UserRole> 
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> setRoleToUser(final List<UserRole> urs){
		Map<String,Object> result = new HashMap<String, Object>();
		boolean succeed = Db.tx(new IAtom() {//使用事务进行批量操作，当某条记录失败时，回滚

			@Override
			public boolean run() throws SQLException {
				for (int i = 0; i < urs.size(); i++) {
					if (!urs.get(i).save()) {
						return false;
					}
				}
				return true;
			}
		});

		if (succeed) {
			result.put("status", true);
			result.put("msg", "角色分配成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，角色分配失败！");
		}
		
		return result;
	}
	
	/**
	 * 移除角色
	 * @param ur UserRole对象
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> removeRoleFromUser(UserRole ur){
		Map<String,Object> result = new HashMap<String, Object>();
		if (ur.delete()) {
			result.put("status", true);
			result.put("msg", "角色移除成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，角色移除失败！");
		}
		return result;
	}
	
	/**
	 * 移除多个角色
	 * @param urs List<UserRole> 
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> removeRoleFromUser(final List<UserRole> urs){
		Map<String,Object> result = new HashMap<String, Object>();
		boolean succeed = Db.tx(new IAtom() {//使用事务进行批量操作，当某条记录失败时，回滚
			
			@Override
			public boolean run() throws SQLException {
				for (int i = 0; i < urs.size(); i++) {
					if (!urs.get(i).delete()) {
						return false;
					}
				}
				return true;
			}
		});
		
		if (succeed) {
			result.put("status", true);
			result.put("msg", "角色移除成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，角色移除失败！");
		}
		
		return result;
	}
}
