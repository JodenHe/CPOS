package com.scau.mis.service;

import java.util.List;

import com.scau.mis.model.Member;

/**
 * 会员操作业务逻辑
 * @author jodenhe
 *
 */
public class MemberSeivice {

	/**
	 * 获取所有会员
	 * @return
	 */
	public List<Member> getAllMember(){
		String sql = "select * from member";
		return Member.dao.find(sql);
	}
	
	/**
	 * 根据会员手机号查询会员信息
	 * @param phone
	 * @return
	 */
	public Member getMemberByPhone(String phone){
		String sql = "select * from member where telephone = '"+phone+"'";
		List<Member> list = Member.dao.find(sql);
		if (list.size()>0) {
			return list.get(0);
		}
		return null;
	}
}
