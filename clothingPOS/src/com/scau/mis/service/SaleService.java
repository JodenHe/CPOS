package com.scau.mis.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.scau.mis.model.Category;
import com.scau.mis.model.Payment;
import com.scau.mis.model.SaleOrder;

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
	 * @return List<BigDecimal>
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
	
	/**
	 * 产品分类销售汇总报表。（选择起止时间，按产品类别进行分类统计销售额）
	 * @param satrt 开始时间
	 * @param end 结束时间
	 * @return Map<String,Object> 
	 */
	public Map<String,Object>  categorySales(String start,String end){
		Map<String,Object> map = new HashMap<String, Object>(); 
		List<BigDecimal> data = new ArrayList<BigDecimal>();//每个种类的销售额
		List<String> cateNames = new ArrayList<String>();//类别名
		
		List<Category> categories= new CategoryService().getThirdCategory();
		for (Category category : categories) {
			cateNames.add(category.getName());
			long cid = category.getId();
			String sql = "SELECT IFNULL(SUM(soi.subTotal-(SELECT IFNULL(SUM(sroi.subTotal),0) FROM sale_reject_order_item sroi,sale_reject_order sro WHERE sro.rejectNo = sroi.rejectNo AND sro.rejectOrderNo = so.saleOrderNo AND sro.rejectDateTime BETWEEN '"+start+"' AND '"+end+"' ) ),0) AS saleAmount FROM sale_order AS so,sale_order_item AS soi,goods AS g WHERE soi.saleOrderNo = so.saleOrderNo AND g.barcode = soi.itemId AND so.saleDateTime BETWEEN '"+start+"' AND '"+end+"' AND g.categoryId = "+cid;
			data.add(new BigDecimal(SaleOrder.dao.find(sql).get(0).get("saleAmount").toString()));
		}
		map.put("categories", cateNames);
		map.put("data", data);
		return map;
	}
	
	
}
