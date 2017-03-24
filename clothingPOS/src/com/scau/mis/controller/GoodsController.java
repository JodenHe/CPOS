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
	public static Log log = Log.getLog(GoodsController.class);
	private GoodsService goodsService = new GoodsService();
	/**
	 * 增加一个商品
	 */
	public void add(){
		Map<String,Object> result = new HashMap<String,Object>();
		Goods goods = new Goods();
		long colorId = getParaToLong("colorId");
		long categoryId = getParaToLong("categoryId");
		long brandId = getParaToLong("brandId");
		long sizeId = getParaToLong("sizeId");
		String style = getPara("style");
		String name = getPara("name");
		String price = getPara("price");
		String script = getPara("script");
		
		BigDecimal bigPrice = new BigDecimal(price);

		if(goodsService.getGoodsByName(name)!=null){
			result.put("status", false);
			result.put("data", "商品名已存在");
		}
		else if(!name.equals("")&&name!=null){
			goods.setName(name);
			goods.setBarcode(TimeUtils.getCurrentTime());
			goods.setColorId(colorId);
			goods.setScript(script);
			goods.setCreateTime(new Date());
			goods.setPrice(bigPrice);
			if(goodsService.addGoods(goods)){
				result.put("status", true);
				result.put("data", "商品新增成功！");
			}
				
			else{
				result.put("status", false);
				result.put("data", "未知错误商品新增失败！");
			}
		}
		else{
			result.put("status", false);
			result.put("data", "商品名不能为空！");
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
		renderJson(goodsService.getAllGoods());
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
	
	/**
	 * 修改商品信息
	 */
	public void update(){
		Map<String, Object> result = new HashMap<String, Object>();
		Goods goods = new Goods();
		long id = getParaToLong("id");
		String name = getPara("name");
		String price = getPara("price");
		String script = getPara("script");
		
		BigDecimal bPrice = new BigDecimal(price);

		if (name!=null&&!"".equals(name)) {
			goods.setId(id);
			goods.setName(name);
			goods.setScript(script);
			goods.setPrice(bPrice);
			goods.setCreateTime(new Date());
			boolean status = goodsService.updateGoods(goods);
			if (status) {
				result.put("data", "成功修改！");
				result.put("status", true);
			}
			else{
				result.put("data", "未知错误，修改失败！");
				result.put("status", false);
			}
		}
		else {
			result.put("data", "商品名称不能为空！");
			result.put("status", true);
		}
		renderJson(result);
	}

}
