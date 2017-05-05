package com.scau.mis.controller;

import java.math.BigDecimal;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.SaleRejectOrder;
import com.scau.mis.service.SaleRejectOrderService;
/**
 * 退单Controller
 * @author 建棠
 *
 */
public class SaleRejectOrderController extends Controller {
	public static Log log = Log.getLog(SaleRejectOrderController.class);
	private SaleRejectOrderService rejectService = new SaleRejectOrderService();
	/**
	 * 添加一条新的退单记录
	 */
	public void add(){
		SaleRejectOrder saleReject = getModel(SaleRejectOrder.class);
		String total = getPara("SaleRejectOrder.total");
		String saleOrderNo = getPara("saleOrderNo");
		BigDecimal decimal = new BigDecimal(total);
		saleReject.setTotal(decimal);
		saleReject.setRejectOrderNo(saleOrderNo);
		renderJson(rejectService.addSaleReject(saleReject));
	}
	/**
	 * 更新一条已有的退单记录
	 */
	public void updata(){
		SaleRejectOrder saleReject = getModel(SaleRejectOrder.class);
		renderJson(rejectService.updataSaleReject(saleReject));
	}
	/**
	 * 获取所有已退单据
	 */
	public void getALLReject(){
		renderJson(rejectService.getALLSaleReject());
	}
}
