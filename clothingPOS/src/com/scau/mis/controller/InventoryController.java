package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Inventory;
import com.scau.mis.service.InventoryService;

/**
 * inventory Controller
 * @author 建棠
 *
 */
public class InventoryController extends Controller {
	public static Log log = Log.getLog(InventoryController.class);
	private InventoryService iservice =new InventoryService();
	/**
	 * 入库商品
	 */
	public void add(){
		Inventory inventory = getModel(Inventory.class);
		renderJson(iservice.addInventory(inventory));
	}
	/**
	 * 更新库存
	 */
	public void updata(){
		boolean status = getParaToBoolean("status");
		Inventory inventory = getModel(Inventory.class);
		renderJson(iservice.updataInventory(inventory, status));
	}
}
