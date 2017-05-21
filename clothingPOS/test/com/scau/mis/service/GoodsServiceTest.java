package com.scau.mis.service;

import java.math.BigDecimal;
import java.util.Date;

import org.junit.BeforeClass;
import org.junit.Test;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.scau.mis.config.Config;
import com.scau.mis.model.Goods;
import com.scau.mis.model._MappingKit;
import com.scau.mis.util.TimeUtils;

public class GoodsServiceTest {
	private Log log = Log.getLog(GoodsServiceTest.class);
	private GoodsService service = new GoodsService();
	
	@BeforeClass
	public static void init() throws Exception{
		PropKit.use("jdbc.properties");
		C3p0Plugin c3p0Plugin = Config.createC3p0Plugin();
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		_MappingKit.mapping(arp);
		arp.setShowSql(true);
		c3p0Plugin.start();
		arp.start();
	}
	
	@Test
	public void getAllGoodsTest(){
		log.info("进入商品的查询单元测试！");
		log.info(service.getAllGoods().toString());
	}
	
	@Test
	public void addGoodsTest(){
		log.info("进入商品的添加单元测试！");
		Goods goods = new Goods();
		goods.setId(15L);
		goods.setCategoryId(28L);
		goods.setBrandId(1L);
		goods.setName("测试商品1");
		goods.setCreateTime(new Date());
		goods.setBarcode(TimeUtils.getCurrentTime());
		goods.setColorId(1L);
		goods.setSizeId(1L);
		goods.setPrice(new BigDecimal("100"));
		log.info(service.addGoods(goods).toString());
	}
	
	@Test
	public void updateTest(){
		log.info("进入商品的更新单元测试！");
		Goods goods = service.getGoodsByBarcode("20170521165247").get(0);
		goods.setName("更新测试");
		log.info(service.updateGoods(goods).toString());
	}
	
	@Test
	public void deleteTest(){
		log.info("进入商品的删除单元测试！");
		log.info(service.deleteGoodsById(15L)+"");
	}
}
