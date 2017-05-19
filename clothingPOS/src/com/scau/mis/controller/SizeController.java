package com.scau.mis.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Size;
import com.scau.mis.service.SizeService;

/**
 * 尺码信息的controller
 * @author jodenhe
 *
 */
public class SizeController extends Controller {
	public static Log log = Log.getLog(SizeController.class);
	private SizeService service = new SizeService();
	
	/**
	 * 添加一个尺码
	 */
	@RequiresPermissions("goods:manage")
	public void add(){
		Size size = getModel(Size.class);
		size.setCreateTime(new Date());
		renderJson(service.addSize(size));
	}
	
	/**
	 * 添更新尺码信息
	 */
	@RequiresPermissions("goods:manage")
	public void update(){
		Size size = getModel(Size.class);
		renderJson(service.updateSize(size));
	}

	/**
	 * 获取所有尺寸信息
	 */
	public void getAllSize(){
		renderJson(service.getAllSize());
	}
	
	/**
	 * 根据id获取尺寸信息
	 */
	public void getSize(){
		renderJson(service.getSize(getParaToLong("id")));
	}
	
	/**
	 * 获取尺码信息表中的类型
	 */
	public void getSizeType(){
		renderJson(service.getSizeType());
	}

	/**
	 * 获取某个类型的所有尺寸信息
	 */
	public void getSizeByType(){
		renderJson(service.getSizeByType(getPara("type")));
	}
}
