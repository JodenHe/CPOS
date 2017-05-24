package com.scau.mis.controller;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Member;
import com.scau.mis.service.MemberSeivice;

/**
 * 会员controller
 * @author jodenhe
 *
 */
public class MemberController extends Controller {
	
	private Log log = Log.getLog(MemberController.class);
	private MemberSeivice service = new MemberSeivice();
	
	//获取所有会员信息
	public void getAllMember(){
		log.info("获取所有会员信息");
		renderJson(service.getAllMember());
	}
	
	//根据会员手机号查询会员信息
	public void getMemberByPhone(){
		String phone = getPara("phone");
		Map<String,Object> map = new HashMap<String, Object>();
		Member member = service.getMemberByPhone(phone);
		if(null != member){
			map.put("status", true);
			map.put("data", member);
		}else{
			map.put("status", true);
			map.put("data", "用户不存在");
		}
		
		renderJson(map);
	}

}
