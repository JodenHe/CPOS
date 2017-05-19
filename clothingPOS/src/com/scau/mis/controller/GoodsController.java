package com.scau.mis.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.service.GoodsService;
import com.scau.mis.util.TimeUtils;

/**
 * 商品controller
 * 
 * @author jodenhe
 * 
 */
@RequiresPermissions("goods:manage")
public class GoodsController extends Controller {
	public static Log log = Log.getLog(GoodsController.class);
	private GoodsService service = new GoodsService();

	/**
	 * 增加一个商品
	 */
	public void add() {
		Goods goods = getModel(Goods.class);
		goods.setCreateTime(new Date());
		goods.setBarcode(TimeUtils.getCurrentTime());
		renderJson(service.addGoods(goods));
	}

	/**
	 * 修改商品信息
	 */
	public void update() {
		Goods goods = getModel(Goods.class);
		renderJson(service.updateGoods(goods));
	}

	/**
	 * 删除一个商品
	 */
	public void delete() {
		Map<String, Object> result = new HashMap<String, Object>();
		long id = getParaToLong("id");
		if (service.deleteGoodsById(id))
			result.put("status", true);
		else
			result.put("status", false);
		renderJson(result);
	}

	/**
	 * 获得所有商品
	 */
	public void getAllGoods() {
		renderJson(service.getAllGoods());
	}

	/**
	 * 获得关键词模糊搜索
	 */
	public void getGoodsBykeyWord() {
		Map<String, Object> result = new HashMap<String, Object>();
		String keyWord = getPara("keyWord");
		List<Goods> goods = service.getGoodsByKeyWord(keyWord);
		if (goods != null) {
			result.put("data", goods);
			result.put("status", true);
		} else {
			result.put("data", "暂时没有符合条件的商品");
			result.put("status", false);
		}

		renderJson(result);
	}

}
