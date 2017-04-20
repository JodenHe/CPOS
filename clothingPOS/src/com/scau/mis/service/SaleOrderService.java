package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.SaleOrder;
/**
 * 
 * @author 建棠
 * 销售记录的业务逻辑实现
 */
public class SaleOrderService {
	public static Log log = Log.getLog(GoodsService.class);
	/**
	 * 
	 * @param saleOrder
	 * @return 添加销售记录
	 */
	public Map<String,Object> addSaleOrder(SaleOrder saleOrder){
		Map<String,Object> result = new HashMap<String,Object>();
		if(!isExist(saleOrder.getSaleOrderNo())){
			result.put("status", false);
			result.put("data", "订单号已存在");
		}else{
			if(saleOrder.save()){
				result.put("status", true);
				result.put("data", "订单已提交");
			}else{
				result.put("status", false);
				result.put("data", "提交失败");
			}
		}
		return result;
	}
	/**
	 * 
	 * @return 获得所有的销售记录
	 */
	public Map<String,Object> getAllSaleOrder(){
		Map<String,Object> result = new HashMap<String,Object>();
		String sql = "select * from sale_order";
		List<SaleOrder> saleOrder = SaleOrder.dao.find(sql);
		if(saleOrder.size()==0){
			result.put("status", true);
			result.put("data", "暂时没有数据");
		}else{
			result.put("status", true);
			result.put("data", saleOrder);
		}
		return result;
	}
	/**
	 * 
	 * @param saleOrder
	 * @return 修改销售记录，主要修改商品数量
	 */
	public Map<String,Object> updataSaleOrder(SaleOrder saleOrder){
		Map<String,Object> result = new HashMap<String,Object>();
		if(saleOrder.update()){
			result.put("status", true);
			result.put("data", "修改成功");
		}else{
			result.put("status", false);
			result.put("data", "修改失败");
		}
		return result;
	}
	public boolean isExist(String saleOrderNo){
		String sql = "select * from sale_order as s where s.saleOrderNo ='"+saleOrderNo+"'";
		if(SaleOrder.dao.find(sql).size()==0){
			return true;
		}else{
			return false;
		}
		
	}
}
