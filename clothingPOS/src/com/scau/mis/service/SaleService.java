package com.scau.mis.service;

import java.util.List;

import com.jfinal.log.Log;
import com.scau.mis.model.Payment;

/**
 * 销售额相关统计
 * @author jodenhe
 *
 */
public class SaleService {
	
	public final static Log log = Log.getLog(SaleService.class);
	
	/**
	 * 获取某个月的销售额信息
	 * @param month 月份（如，2017-04）
	 * @return List<Payment>
	 */
	//so.saleOrderNo,p.amount AS pAmount,sro.total AS sroTotal,(p.amount-sro.total) AS saleAmount from payment AS p,sale_reject_order AS sro,sale_order AS so WHERE so.saleOrderNo = p.saleOrderNo AND (sro.rejectOrderNo = so.saleOrderNo AND sro.rejectDateTime LIKE '%"+month+"%') AND 
	public List<Payment> monthlySales(String month){
		String sql = "SELECT p.payDateTime AS date, p.amount AS pAmount,(p.amount-IFNULL((SELECT SUM(sro.total) as amount from sale_reject_order AS sro WHERE sro.rejectOrderNo=p.saleOrderNo AND sro.rejectDateTime LIKE '%"+month+"%'),0)) AS saleAmount from payment AS p WHERE p.payDateTime LIKE '%"+month+"%'";
		List<Payment> result = Payment.dao.find(sql);
		return result;
	}
	//select SUM(sro.total) as amount from sale_reject_order AS sro WHERE sro.rejectOrderNo='"+saleOrderNo+"' AND sro.rejectDateTime LIKE '%"+month+"%'

	
	
}
