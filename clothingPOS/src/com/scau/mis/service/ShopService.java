package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.mchange.v2.resourcepool.ResourcePool.Manager;
import com.scau.mis.model.Member;
import com.scau.mis.model.Sales;
import com.scau.mis.model.Shop;

/**
 * 商店的业务逻辑实现，废弃删除操作，颜色信息表只允许修改不能删除
 * 
 * @author wjt
 * 
 */
public class ShopService {
	public static Log log = Log.getLog(ColorService.class);
	/**
	 * 
	 * @param shop
	 * @return 新增一家店铺
	 */
	public Map<String,Object> addShop(Shop shop){
		Map<String,Object> result = new HashMap<String,Object>();
		String name = shop.getName();
		if(!isExist(name)){
			result.put("msg", "店铺名称已经存在，请及时修改");
			result.put("status", false);
		}
		else if(!name.equals("")&&name!=null){
			if(shop.save()){
				result.put("msg", "新增店铺成功");
				result.put("status", true);
			}else{
				result.put("msg", "新增店铺失败，请重试");
				result.put("status", false);
			}
		}
		return result;
	}
	/**
	 * 
	 * @param id
	 * @param address
	 * @param name
	 * @param manager
	 * @param telephone
	 * @param script
	 * @return 更新店铺信息，必须要店铺id，地址，名字，电话，店主的信息，否则就会更新失败
	 */
	public Map<String,Object> updataShop(long id,String address,String name,String manager,String telephone,String script){
		Map<String,Object> result = new HashMap<String,Object>();
		Shop shop  = Shop.dao.findById(id);
		if(shop!=null){
			if(!name.equals("")&&name!=null)
				if(!isExist(name))
					shop.setName(name);
			if(!address.equals("")&&address!=null)
			shop.setAddress(address);
			if(!manager.equals("")&&manager!=null)
			shop.setManager(manager);
			if(!telephone.equals("")&&telephone!=null)
			shop.setTelephone(telephone);
			shop.setScript(script);
			if(shop.update()){
				result.put("msg", "更新成功");
				result.put("status", true);
			}else{
				result.put("msg", "更新失败");
				result.put("status", false);
			}
		}
		return result;
	}
	/**
	 * 
	 * @param keyWord
	 * @return 通过关键词keyWord查找符合条件的店铺数据
	 */
	public Map<String,Object> getShopByKeyWord(String keyWord){
		Map<String,Object> result = new HashMap<String,Object>();
		String sql = "select * from shop as s where s.name like '%"+keyWord+"%'"
				+"or s.manager like '%"+keyWord+"%'"
				+"or s.telephone like '%"+keyWord+"%'"
				+"or s.address like '%"+keyWord+"%'"
				+"or s.script like '%"+keyWord+"%'";
		List<Shop> shops = Shop.dao.find(sql);
		if(shops.size()==0){
			result.put("msg", "暂时没有符合条件的数据");
			result.put("status", false);
		}
		else{
			result.put("data",shops);
			result.put("status", true);
		}
		return result;
	}
	/**
	 * 
	 * @return 获得所有店铺信息。
	 */
	public List<Shop> getAllShop(){

		String sql = "select * from shop";
		List<Shop> shops = Shop.dao.find(sql);
		return shops;
	}
	/**
	 * 
	 * @param id
	 * @return 通过店铺id删除店铺数据，必须先查看店铺是否存在关联数据，如果存在则提示删除失败
	 */
	public Map<String,Object> deleteShopById(long id){
		Map<String,Object> result = new HashMap<String,Object>();
		
		String findShopIdFromMember = "select * from member as m where m.shopId ='"+id+"'";
		String findShopIdFromSales = "select * from sales as s where s.shopId ='"+id+"'";
		
		if(Member.dao.find(findShopIdFromMember)!=null){
			result.put("msg","Member表中仍然存在数据，删除失败");
			result.put("status", false);
		}else if(Sales.dao.find(findShopIdFromSales)!=null){
			result.put("msg","Sales表中仍然存在数据，删除失败");
			result.put("status", false);
		}
		else{
			if(Shop.dao.deleteById(id)){
				result.put("msg","删除成功");
				result.put("status", true);
			}else{
				result.put("msg","删除失败");
				result.put("status", false);
			}
		}
		return result;
	}
	/**
	 * 
	 * @param name
	 * @return 判断数据库是否已存在
	 */
	public boolean isExist(String name){
		String sql = "select * from shop as s where s.name = '"+name+"'";
		if(Shop.dao.find(sql).size()!=0)
			return true;
		else
			return false;
		
	}
}
