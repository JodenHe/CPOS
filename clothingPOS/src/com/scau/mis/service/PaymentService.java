package com.scau.mis.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.jfinal.log.Log;
import com.scau.mis.model.Payment;
import com.scau.mis.util.TimeUtils;

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
		////P-2017-04-22-1974409033,订单编号编码规则，P-2017-04-22加上UUID的hashCOde
		String paymentNo = "P-"+TimeUtils.getCurrentDate()+"-"+UUID.randomUUID().toString().hashCode();
		payment.setOperatorId(2l);//完成登录功能后，此处应改为从session中获取用户编号
		payment.setShopId(1l);//完成登录功能后，此处应改为从session中获取店铺id
		payment.setPayDateTime(new Date());
		payment.setPaymentNo(paymentNo);
		if(payment.save()){
			result.put("status", true);
			result.put("data", "支付成功");
			result.put("paymentNo", paymentNo);
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
	 * @return 获得所有的支付信息
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
