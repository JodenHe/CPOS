package com.scau.mis.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.SaleOrder;
import com.scau.mis.model.User;
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
	@RequiresPermissions("goods:sale")
	public void add(){
		SaleOrder saleOrder = getModel(SaleOrder.class);
		User user = getSessionAttr("user");
		if (null!=user) {
			saleOrder.setOperatorId(user.getId());
		}
		else{
			redirect("/login");
		}
		renderJson(service.addSaleOrder(saleOrder));
	}
	
	/**
	 * 更新销售记录
	 */
	@RequiresPermissions("goods:sale")
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
