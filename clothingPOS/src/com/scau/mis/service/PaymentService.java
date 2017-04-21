package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Payment;

/**
 * 支付业务逻辑实现
 * @author 建棠
 *
 */
public class PaymentService {
	public static Log log = Log.getLog(PaymentService.class);
	/**
	 * 
	 * @param payment
	 * @return 添加一条支付记录
	 */
	public Map<String,Object> addPayment(Payment payment){
		Map<String,Object> result = new HashMap<String,Object>();
		if(payment.save()){
			result.put("status", true);
			result.put("data", "支付成功");
		}else{
			result.put("status", false);
			result.put("data", "支付出现了意外");
		}
		return result;
	}
	/**
	 * 
	 * @param payment
	 * @return 更新支付信息
	 */
	public Map<String,Object> updataPayment(Payment payment){
		Map<String,Object> result = new HashMap<String,Object>();
		if(payment.update()){
			result.put("status", true);
			result.put("data", "更新成功");
		}else{
			result.put("status", false);
			result.put("data", "更新失败");
		}
		return result;
	}
	/**
	 * 
	 * @return 获得所有的支付记录
	 */
	public Map<String,Object> getAllPayment(){
		Map<String,Object> result = new HashMap<String,Object>();
		String sql = "select * from payment";
		List<Payment> payments = Payment.dao.find(sql);
		if(payments.size()!=0){
			result.put("status", true);
			result.put("data", payments);
		}else{
			result.put("status", true);
			result.put("data", "暂时没有数据");
		}
		return result;
	}
}
