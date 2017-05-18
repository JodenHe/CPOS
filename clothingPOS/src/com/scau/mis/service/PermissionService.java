package com.scau.mis.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.scau.mis.model.Permission;
import com.scau.mis.model.RolePermission;

/**
 * 权限管理业务逻辑
 * @author jodenhe
 *
 */
public class PermissionService {
	public static Log log = Log.getLog(PermissionService.class);

	/**
	 * 获取所有权限
	 * @return
	 */
	public List<Permission> getAllPers() {
		String sql = "select * from permission p";
		List<Permission> permission = Permission.dao.find(sql);
		return permission;
	}
	
	/**
	 * 获取某个角色的所有权限
	 * @param roleId 角色id
	 * @return
	 */
	public List<Permission> getAllPersByRoleId(long roleId) {
		String sql = "select p.* from permission p,role_permission rp  where p.id = rp.permissionId and rp.roleId="+roleId;
		List<Permission> permission = Permission.dao.find(sql);
		return permission;
	}
	
	/**
	 * 进行权限分配
	 * @param rp RolePermission对象
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> setPerToRole(RolePermission rp){
		Map<String,Object> result = new HashMap<String, Object>();
		if (rp.save()) {
			result.put("status", true);
			result.put("msg", "权限分配成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，权限分配失败！");
		}
		return result;
	}

	/**
	 * 分配多个权限给角色
	 * @param rps List<RolePermission>
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> setPerToRole(final List<RolePermission> rps,final long roleId){
		Map<String,Object> result = new HashMap<String, Object>();
		boolean succeed = Db.tx(new IAtom() {//使用事务进行批量操作，当某条记录失败时，回滚

			@Override
			public boolean run() throws SQLException {
				//进行插入前先清空现有的权限
				List<RolePermission> listRPS =  RolePermission.dao.find("select * from role_permission where roleId = "+roleId);
				for (RolePermission rolePermission : listRPS) {
					if(!rolePermission.delete()){
						return false;
					}
				}
				for (int i = 0; i < rps.size(); i++) {
					if (!rps.get(i).save()) {
						return false;
					}
				}
				return true;
			}
		});

		if (succeed) {
			result.put("status", true);
			result.put("msg", "权限分配成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，权限分配失败！");
		}
		return result;
	}
	
	/**
	 * 移除权限
	 * @param rp RolePermission对象
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> removePerFromRole(RolePermission rp){
		Map<String,Object> result = new HashMap<String, Object>();
		if (rp.delete()) {
			result.put("status", true);
			result.put("msg", "权限移除成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，权限移除失败！");
		}
		return result;
	}
	
	/**
	 * 移除多个权限
	 * @param rps List<RolePermission>
	 * @return Map{"status" ： true/false,"msg" : xxx}
	 */
	public Map<String,Object> removePerFromRole(final List<RolePermission> rps){
		Map<String,Object> result = new HashMap<String, Object>();
		boolean succeed = Db.tx(new IAtom() {//使用事务进行批量操作，当某条记录失败时，回滚
			
			@Override
			public boolean run() throws SQLException {
				for (int i = 0; i < rps.size(); i++) {
					if (!rps.get(i).delete()) {
						return false;
					}
				}
				return true;
			}
		});
		
		if (succeed) {
			result.put("status", true);
			result.put("msg", "权限移除成功！");
		}else{
			result.put("status", false);
			result.put("msg", "数据不一致或者网络问题，权限移除失败！");
		}
		return result;
	}

}
