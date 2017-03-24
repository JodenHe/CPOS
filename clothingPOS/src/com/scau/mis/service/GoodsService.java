package com.scau.mis.service;

import java.util.List;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.util.BarcodeUtil;

public class GoodsService {
	public static Log log = Log.getLog(GoodsService.class);
	
	/**
	 * 新增商品
	 * @param goods 商品对象
	 * @return 成功返回true，失败返回false
	 */
	public boolean addGoods(Goods goods){
		String pathUrl = PathKit.getWebRootPath()+"/barcode/" + goods.getBarcode()+".png";
		BarcodeUtil.generateFile(goods.getBarcode(), pathUrl);
		if(goods.save())
			return true;
		else
			return false;
	}

	/**
	 * 根据name查找商品
	 * @param name 商品名称
	 * @return 商品List数组
	 */
	public List<Goods> getGoodsByName(String name){
		String sql = "select * from goods where name='"+name+"'";
		List<Goods> goods = Goods.dao.find(sql);
		if(goods.size()!=0)
			return goods;
		else
			return null;
	}

	/**
	 * 获得所有的商品
	 * @return 商品List数组
	 */
	public List<Goods> getAllGoods(){
		String sql = "select * from goods";
		List<Goods> goods = Goods.dao.find(sql);
		return goods;
	}

	/**
	 * 删除商品
	 * @param id 商品id
	 * @return 成功返回true，失败返回false
	 */
	public boolean deleteGoodsById(long id){
		if(Goods.dao.deleteById(id))
			return true;
		else
			return false;
	}

	/**
	 * 修改商品信息
	 * @param goods 要修改的商品对象
	 * @return 成功返回true，失败返回false
	 */
	public boolean updateGoods(Goods goods){
		if(goods.update())
			return true;
		else
			return false;
	}
	/**
	 * 模糊搜索
	 */
	public List<Goods> getGoodsByKeyWord(String keyWord){
		String sql = "select * from goods where concat('name','script','styleId','colorId','barcode','originalPrice','price') like %'"+keyWord+"'%";
		List<Goods> goods = Goods.dao.find(sql);
		if(goods.size()!=0)
			return goods;
		else
			return null;
	}
}
