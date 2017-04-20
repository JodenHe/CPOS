package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.SaleOrderItem;
import com.scau.mis.service.SaleOrderItemService;
/**
 * 销售订单详情Controller
 * @author 建棠
 *
 */
public class SaleOrderItemController extends Controller {
	public static Log log = Log.getLog(SaleOrderItemController.class);
	private SaleOrderItemService itemService = new SaleOrderItemService();
	/**
	 * 添加订单详情
	 */
	public void add(){
		SaleOrderItem saleItem = getModel(SaleOrderItem.class);
		renderJson(itemService.addItem(saleItem));
	}
	/**
	 * 通过订单号获取订单详情
	 */
	public void getItemByNo(){
		String saleOrderNo = getPara("SaleOrder.saleOrderNo");
		renderJson(itemService.getAimItem(saleOrderNo));
	}
	/**
	 * 更新订单详情
	 */
	public void updata(){
		SaleOrderItem saleItem = getModel(SaleOrderItem.class);
		renderJson(itemService.updataSaleItem(saleItem));
	}
}
