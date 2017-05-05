package com.scau.mis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.model.SaleOrder;
import com.scau.mis.model.SaleOrderItem;
/**
 * 销售记录详情表的业务逻辑实现
 * @author 建棠
 *
 */
public class SaleOrderItemService {
	public static Log log = Log.getLog(SaleOrderItemService.class);
	/**
	 * 
	 * @param item
	 * @return 添加订单详情
	 */
	public Map<String,Object> addItem(SaleOrderItem item){
		Map<String,Object> result = new HashMap<String,Object>();
		if(item.save()){
			result.put("status", true);
			result.put("data", "保存成功");
		}else{
			result.put("status", false);
			result.put("data", "保存失败");
		}
		return result;
	}
	/**
	 * 
	 * @param saleOrderNo
	 * @return 通过订单ID 获得指定订单详情
	 */
	public Map<String,Object> getAimItem(String saleOrderNo){
		Map<String,Object> result = new HashMap<String, Object>();
		String sql = "select * from sale_order_item as s where s.saleOrderNo='"+saleOrderNo+"'";
		String saleOrderSql = "select * from sale_order as s where s.saleOrderNo='"+saleOrderNo+"'";
		List<SaleOrder> saleOrder = SaleOrder.dao.find(saleOrderSql);
		List<SaleOrderItem> saleItems = SaleOrderItem.dao.find(sql);
		List<List<Goods>> goods = new ArrayList<List<Goods>>();
		if(saleItems.size()==0){
			result.put("status", false);
			result.put("data1", "找不到订单");
			result.put("data2", "找不到订单");
		}else{
			
			for(int i=0;i<saleItems.size();i++){
				String itemId = saleItems.get(i).getItemId();
				String sql1 = "select * from goods as g where g.barcode ='"+itemId+"'";
				List<Goods> good = Goods.dao.find(sql1);
				goods.add(good);
			}
			result.put("status", true);
			result.put("data1", saleOrder);
			result.put("data2", goods);
			result.put("data3", saleItems);
		}
		return result;
	}
	/**
	 * 
	 * @param saleItem
	 * @return 更新订单详情
	 */
	public Map<String,Object> updataSaleItem(SaleOrderItem saleItem){
		Map<String,Object> result = new HashMap<String, Object>();
		if(saleItem.update()){
			result.put("status", true);
			result.put("data", "更新成功");
		}else{
			result.put("status", false);
			result.put("data", "更新失败");
		}
		return result;
	}
/*	public boolean isExist(String saleOrderNo){
		String sql = "select * from sale_order as s where s.saleOrderNo ='"+saleOrderNo+"'";
		if(SaleOrder.dao.find(sql).size()==0){
			return true;
		}else{
			return false;
		}
	}*/
}
