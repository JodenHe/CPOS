package com.scau.mis.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.service.GoodsService;
import com.scau.mis.util.TimeUtils;

public class GoodsController extends Controller {
	public static Log log = Log.getLog(CategoryController.class);
	private GoodsService goodsService = new GoodsService();
	/**
	 * 增加一个商品
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
		Goods goods = new Goods();
		long styleId = getParaToLong("styleId");
		long colorId = getParaToLong("colorId");
//		String barcode = getPara("barcode");
		String name = getPara("name");
		String originalPrice  =getPara("originalPrice");
		String price = getPara("price");
		String script = getPara("script");
		BigDecimal bigDecimal = new BigDecimal(originalPrice);
		BigDecimal bigPrice = new BigDecimal(price);
		
		if(goodsService.getGoodsByName(name)!=null){
			result.put("status", false);
		}
		else if(!name.equals("")&&name!=null){
			goods.setName(name);
			goods.setBarcode(TimeUtils.getCurrentTime());
			goods.setColorId(colorId);
			goods.setStyleId(styleId);
			goods.setScript(script);
			goods.setCreateTime(new Date());
			goods.setOriginalPrice(bigDecimal);
			goods.setPrice(bigPrice);
			if(goodsService.addGoods(goods))
				result.put("status", true);
			else
				result.put("status", false);
		}
		renderJson(result);
	}
	/**
	 * 删除一个商品
	 */
	public void delete(){
		Map<String,Object> result = new HashMap<String,Object>();
		long id = getParaToLong("id");
		if(goodsService.deleteGoodsById(id))
			result.put("status", true);
		else
			result.put("status", false);
		renderJson(result);
	}
	/**
	 * 获得所有商品
	 */
	public void getAllGoods(){
		Map<String,Object> result = new HashMap<String,Object>();
		List<Goods> goods = goodsService.getAllGoods();
		if(goods!=null)
			result.put("data", goods);
		else
			result.put("data", "暂时没有商品");
		renderJson(result);
		
	}
	/**
	 * 获得关键词模糊搜索
	 */
	public void getGoodsBykeyWord(){
		Map<String,Object> result = new HashMap<String,Object>();
		String keyWord = getPara("keyWord");
		List<Goods> goods =goodsService.getGoodsByKeyWord(keyWord);
		if(goods!=null){
			result.put("data", goods);
			result.put("status", true);
		}
		else{
			result.put("data", "暂时没有符合条件的商品");
			result.put("status", false);
		}
			
		renderJson(result);
	}
}
