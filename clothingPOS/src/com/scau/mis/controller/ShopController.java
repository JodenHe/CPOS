package com.scau.mis.controller;



import java.util.Date;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Shop;
import com.scau.mis.service.ShopService;
/**
 * 店铺Controller
 * @author 建棠
 *
 */
public class ShopController extends Controller{
	public static Log log = Log.getLog(GoodsController.class);
	private ShopService shopService = new ShopService();
	/**
	 * 新增店铺
	 */
	public void add(){
		Shop shop = getModel(Shop.class);
		shop.setCreateTime(new Date());
		renderJson(shopService.addShop(shop));
	}
	/**
	 * 更新店铺信息
	 */
	public void updata(){
		long id = getParaToLong("id");
		String name = getPara("name");
		String manager = getPara("manager");
		String address = getPara("address");
		String telephone = getPara("telephone");
		String script  =getPara("script");
		renderJson(shopService.updataShop(id, address, name, manager, telephone, script));
	}
	/**
	 * 获得所有店铺信息
	 */
	public void allShop(){
		renderJson(shopService.getAllShop());
	}
	/**
	 * 模糊搜索
	 */
	public void getShopBykeyWord(){
		String keyWord = getPara("keyWord");
		renderJson(shopService.getShopByKeyWord(keyWord));
	}
	/**
	 * 删除店铺信息
	 */
	public void delete(){
		long id = getParaToLong("id");
		renderJson(shopService.deleteShopById(id));
	}
}
