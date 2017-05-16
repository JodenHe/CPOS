package com.scau.mis.service;

import java.math.BigDecimal;
import java.util.ArrayList;
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
	 * 统计某一年的月销售额
	 * @param year 要统计的年份（如，2017）
	 * @return List<Map<String,String>>
	 */
	public List<BigDecimal> monthlySales(String year){
		List<BigDecimal> result = new ArrayList<BigDecimal>();
		for (int i = 1; i <= 12; i++) {
			String month = i<10 ? (year+"-0"+i) : (year+"-"+i);//年份加月份
			String sql = "SELECT IFNULL(SUM(p.amount-IFNULL((SELECT SUM(sro.total) as amount from sale_reject_order AS sro WHERE sro.rejectOrderNo=p.saleOrderNo AND sro.rejectDateTime LIKE '%"+month+"%'),0)),0) AS saleAmount from payment AS p WHERE p.payDateTime LIKE '%"+month+"%'";
			result.add(new BigDecimal(Payment.dao.find(sql).get(0).get("saleAmount").toString()));
		}
		return result;
	}
	
}
