package com.scau.mis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.model.SaleOrder;
import com.scau.mis.model.SaleOrderItem;
import com.scau.mis.model.SaleRejectOrder;
import com.scau.mis.model.SaleRejectOrderItem;
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
				//通过订单获得所够商品
				String sql1 = "select * from goods as g where g.barcode ='"+itemId+"'";
				//获得退货单
				String SRO ="select * from sale_reject_order as sr where sr.rejectOrderNo='"+saleOrderNo+"'";
				List<SaleRejectOrder> saleRejectOrders = SaleRejectOrder.dao.find(SRO);
				//获得退货详情
				String SROI = "select * from sale_reject_order_item as si where si.itemId='"+itemId+"'";
				List<SaleRejectOrderItem> saleRejectOrderItems = SaleRejectOrderItem.dao.find(SROI);
				//很复杂的逻辑，看不懂的你
				int values = 0;
				if(saleRejectOrderItems.size()!=0){
					for(int j=0;j<saleRejectOrderItems.size();j++){
						for(int k=0;k<saleRejectOrders.size();k++){
							if(saleRejectOrderItems.get(j).getRejectNo().equals(saleRejectOrders.get(k).getRejectNo()))
								if(saleRejectOrders.get(k).getRejectOrderNo().equals(saleOrderNo))
								values++;
						}
					}
				}
				int quantity = saleItems.get(i).getQuantity();
				int resultNo = quantity - values;
				saleItems.get(i).setQuantity(Integer.valueOf(resultNo));
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
