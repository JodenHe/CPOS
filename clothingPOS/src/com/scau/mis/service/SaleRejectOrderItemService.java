package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.SaleOrderItem;
import com.scau.mis.model.SaleRejectOrderItem;
/**
 * 退单详情操作业务逻辑实现
 * @author 建棠
 *
 */
public class SaleRejectOrderItemService {
	public static Log log = Log.getLog(SaleRejectOrderItemService.class);
	/**
	 * 
	 * @param rejectItem
	 * @return 添加退单详情
	 */
	public Map<String,Object> addRejectItem(SaleRejectOrderItem rejectItem){
		Map<String,Object> result = new HashMap<String,Object>();
		if(rejectItem.save()){
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
	 * @return 通过退单ID 获得指定订单详情
	 */
	public Map<String,Object> getAimRejectItem(String rejectNo){
		Map<String,Object> result = new HashMap<String, Object>();
		String sql = "select * from sale_reject_order_item as s where s.rejectNo='"+rejectNo+"'";
		List<SaleRejectOrderItem> saleRejectItem = SaleRejectOrderItem.dao.find(sql);
		if(saleRejectItem.size()==0){
			result.put("status", false);
			result.put("data", "获取失败");
		}else{
			result.put("status", true);
			result.put("data", saleRejectItem);
		}
		return result;
	}
	/**
	 * 
	 * @param saleRejectItem
	 * @return 更新退单详情
	 */
	public Map<String,Object> updataSaleRejectItem(SaleRejectOrderItem saleRejectItem){
		Map<String,Object> result = new HashMap<String, Object>();
		if(saleRejectItem.update()){
			result.put("status", true);
			result.put("data", "更新成功");
		}else{
			result.put("status", false);
			result.put("data", "更新失败");
		}
		return result;
	}
}
