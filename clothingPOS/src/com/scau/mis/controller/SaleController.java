package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.service.GoodsService;
import com.scau.mis.service.SaleService;
/**
 * 销售过程 Controller
 * @author 建棠
 *
 */
public class SaleController extends Controller {
	public static Log log = Log.getLog(SaleController.class);
	private GoodsService goodsService = new GoodsService();
	private SaleService saleService = new SaleService();
	/**
	 * 通过条形码获得符合条件的商品 参数：Goods.barcode;
	 */
	public void getGoodsByBarcode(){
		String barcode = getPara("Goods.barcode");
		renderJson(goodsService.getGoodsByBarcode(barcode));
	}
	
	/**
	 * 获取某个月的销售额
	 * @author jodenhe
	 */
	public void getMonthlySales(){
		String month = getPara("month");
		renderJson(saleService.monthlySales(month));
	}
}
