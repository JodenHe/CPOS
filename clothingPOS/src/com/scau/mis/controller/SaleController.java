package com.scau.mis.controller;

import java.math.BigDecimal;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.service.GoodsService;
/**
 * 销售过程 Controller
 * @author 建棠
 *
 */
public class SaleController extends Controller {
	public static Log log = Log.getLog(SaleController.class);
	private GoodsService goodsService = new GoodsService();
	/**
	 * 通过条形码获得符合条件的商品 参数：Goods.barcode;
	 */
	public void getGoodsByBarcode(){
		String barcode = getPara("Goods.barcode");
		renderJson(goodsService.getGoodsByBarcode(barcode));
	}
}
