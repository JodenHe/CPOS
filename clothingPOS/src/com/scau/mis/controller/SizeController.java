package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Size;
import com.scau.mis.service.SizeService;

public class SizeController extends Controller {
	public static Log log = Log.getLog(SizeController.class);
	private SizeService service = new SizeService();
	/**
	 * 添加一个尺码
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
/*		String name = getPara("name");
		String script = getPara("script");
		if(service.getSizeByName(name)!=null){
			result.put("status", true);
		}
		else if(!name.equals("")&&name!=null){
			new Size().set("name", name).set("script", script).set("createTime", new Date()).save();
			result.put("status", true);
		}else
			result.put("status", false);*/
		renderJson(result);
	}
	/**
	 * 通过id删除一个尺码
	 */
	public void delete(){
		Map<String,Object> result = new HashMap<String,Object>();
		long id = getParaToLong("id");
		if(service.deleteSize(id))
			result.put("status", true);
		else
			result.put("status", false);
		renderJson(result);
	}
	
	/**
	 * 获取所有尺寸信息
	 */
	public void getAllSize(){
		
	}
	
	/**
	 * 获取某个类型的所有尺寸信息
	 */
	public void getSizeByType(){
		
	}
}
