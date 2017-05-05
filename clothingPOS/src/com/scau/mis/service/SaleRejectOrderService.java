package com.scau.mis.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.jfinal.log.Log;
import com.scau.mis.model.SaleRejectOrder;
import com.scau.mis.util.TimeUtils;
/**
 * 退单业务逻辑实现
 * @author 建棠
 *
 */
public class SaleRejectOrderService {
	public static Log log = Log.getLog(SaleRejectOrderService.class);
	/**
	 * 
	 * @param saleReject
	 * @return 增加一条新的退单记录
	 */
	public Map<String,Object> addSaleReject(SaleRejectOrder saleReject){
		Map<String,Object> result = new HashMap<String,Object>();
		String rejecNo = "R-"+TimeUtils.getCurrentDate()+"-"+UUID.randomUUID().toString().hashCode();
		saleReject.setRejectDateTime(new Date());
		saleReject.setOperatorId(2l);
		saleReject.setShopId(1l);
		saleReject.setRejectNo(rejecNo);
		if(saleReject.save()){
			List<SaleRejectOrder> saleRejects = SaleRejectOrder.dao.find("select * from sale_reject_order as s where s.rejectNo='"+rejecNo+"'");
			result.put("status", true);
			result.put("data", saleRejects);
		}else{
			result.put("status", false);
			result.put("data", "退单失败");
		}
		return result;
	}
	/**
	 * 
	 * @param saleReject
	 * @return 更新一条已有的退单记录
	 */
	public Map<String,Object> updataSaleReject(SaleRejectOrder saleReject){
		Map<String,Object> result = new HashMap<String,Object>();
		if(saleReject.update()){
			result.put("status", true);
			result.put("data", "退单成功");
		}else{
			result.put("status", false);
			result.put("data", "退单失败");
		}
		return result;
	}
	/**
	 * 
	 * @return 获得所有的退单记录
	 */
	public Map<String,Object> getALLSaleReject(){
		Map<String,Object> result = new HashMap<String,Object>();
		String sql = "select * from sale_reject_order";
		List<SaleRejectOrder> saleRejectOrder = SaleRejectOrder.dao.find(sql);
		if(saleRejectOrder.size()==0){
			result.put("status", true);
			result.put("data", "暂时没有退单记录");
		}else{
			result.put("status", true);
			result.put("data", saleRejectOrder);
		}
		return result;
	}
}
