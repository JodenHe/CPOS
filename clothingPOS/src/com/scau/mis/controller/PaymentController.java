package com.scau.mis.controller;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.scau.mis.model.Payment;
import com.scau.mis.service.PaymentService;
/**
 * 支付 Controller
 * @author 建棠
 *
 */
public class PaymentController extends Controller {
	public static Log log = Log.getLog(PaymentController.class);
	private PaymentService  paymentService = new PaymentService();
	/**
	 * 增加一条支付记录
	 */
	public void add(){
		Payment payment = getModel(Payment.class);
		renderJson(paymentService.addPayment(payment));
	}
	/**
	 * 更新一条支付记录
	 */
	public void updata(){
		Payment payment = getModel(Payment.class);
		renderJson(paymentService.updataPayment(payment));
	}
	/**
	 * 获得所有的支付记录
	 */
	public void getAllPayment(){
		renderJson(paymentService.getAllPayment());
	}
}
