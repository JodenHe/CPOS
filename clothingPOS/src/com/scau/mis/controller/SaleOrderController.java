package com.scau.mis.controller;

import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.SaleOrder;
import com.scau.mis.service.SaleOrderService;

/**
 * 销售记录Controller
 * @author 建棠
 *
 */
public class SaleOrderController extends Controller {
	public static Log log = Log.getLog(SaleOrderController.class);
	private SaleOrderService service = new SaleOrderService();
	/**
	 * 添加一条销售记录
	 */
	public void add(){
		SaleOrder saleOrder = getModel(SaleOrder.class);
		saleOrder.setSaleDateTime(new Date());
		renderJson(service.addSaleOrder(saleOrder));
	}
	/**
	 * 更新销售记录
	 */
	public void updata(){
		SaleOrder saleOrder = getModel(SaleOrder.class);
		renderJson(service.updataSaleOrder(saleOrder));
	}
	/**
	 * 获得所有销售记录
	 */
	public void getAllSaleOrder(){
		renderJson(service.getAllSaleOrder());
	}
}
