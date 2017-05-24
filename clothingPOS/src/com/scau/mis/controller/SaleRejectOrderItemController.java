package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.SaleRejectOrderItem;
import com.scau.mis.service.SaleRejectOrderItemService;
/**
 * 退单 Controller
 * @author 建棠
 *
 */
public class SaleRejectOrderItemController extends Controller {
	public static Log log = Log.getLog(SaleRejectOrderItemController.class);
	private SaleRejectOrderItemService rejectService  =new SaleRejectOrderItemService();
	/**
	 * 增加一条退单详情
	 */
	public void add(){
		SaleRejectOrderItem saleRejectOrderItem = getModel(SaleRejectOrderItem.class);
		if(rejectService.addRejectItem(saleRejectOrderItem)){
			renderJson(" {\"status\":true,\"data\":\"保存成功\"} ");
		}else{
			renderJson(" {\"status\":false,\"data\":\"保存失败\"} ");
		}
	}
	/**
	 * 更新一条退单详情
	 */
	public void updata(){
		SaleRejectOrderItem rejectItem = getModel(SaleRejectOrderItem.class);
		renderJson(rejectService.updataSaleRejectItem(rejectItem));
	}
	/**
	 * 获得指定退单详情
	 */
	public void getAimRejectItem(){
		String rejectNo = getPara("SaleRejectOrderItem.rejectNo");
		renderJson(rejectService.getAimRejectItem(rejectNo));
	}
}
