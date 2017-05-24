package com.scau.mis.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Inventory;

/**
 * 库存逻辑的实现
 * @author 建棠
 *
 */
public class InventoryService {
	public static Log log = Log.getLog(InventoryService.class);
	
	/**
	 * 获取所有库存信息
	 * @return
	 */
	public List<Inventory> getAllInv(){
		String sql = "select * from inventory";
		return Inventory.dao.find(sql);
	}
	
	/**
	 * 
	 * @param inventory
	 * @return 入库一件新的商品 如果已经存在则改变amount、quantity的值
	 */
	public Map<String,Object> addInventory(Inventory inventory){
		Map<String,Object> result = new HashMap<String,Object>();
		inventory.setCreateTime(new Date());
		inventory.setWarehouseId(1l);
		if(inventory.save()){
			result.put("status", true);
			result.put("data", "入库成功");
				
		}else{
			result.put("status", false);
			result.put("data", "入库失败");
		}
		return result;
	}
	/**
	 * 
	 * @param inventory
	 * @param status
	 * @return 通过status来判断是退货还是下单，true表示退货
	 */
	public Map<String,Object> updataInventory(Inventory inventory,boolean status){
		Map<String,Object> result = new HashMap<String,Object>();
		
		String sql = "select * from inventory as i where i.goodsId='"+inventory.getId()+"'";
		
		Inventory inventorys = Inventory.dao.find(sql).get(0);
		
		if(status){
			inventorys.setQuantity(inventorys.getQuantity()+1);
		}else{
			if(inventorys.getQuantity()!=0)
				inventorys.setQuantity(inventorys.getQuantity()-1);
			else
				result.put("data", "库存不足");
		}
		result.put("data", "库存已更新");
		
		return result;
	}
	public boolean isExist(long goodsId){
		String sql ="select * from inventory as i where i.goodsId ='"+goodsId+"'";
		return Inventory.dao.find(sql).size()>0;
	}
}
