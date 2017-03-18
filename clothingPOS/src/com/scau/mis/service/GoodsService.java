package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Goods;

public class GoodsService {
	public static Log log = Log.getLog(CategoryService.class);
	/**
	 * 增加一个商品
	 */
	public boolean addGoods(Goods goods){
		if(goods.save())
			return true;
		else
			return false;
	}
	/**
	 * 通过name查找指定商品
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
	 */
	public List<Goods> getAllGoods(){
		String sql = "select * from goods";
		List<Goods> goods = Goods.dao.find(sql);
		if(goods.size()!=0)
			return goods;
		else
			return null;
	}
	/**
	 * 通过id删除一个商品
	 */
	public boolean deleteGoodsById(long id){
		if(Goods.dao.deleteById(id))
			return true;
		else
			return false;
	}
	/**
	 * 修改商品信息
	 */
	public boolean updataGoods(Goods goods){
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
