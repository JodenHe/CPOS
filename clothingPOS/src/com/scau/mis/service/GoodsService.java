package com.scau.mis.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.scau.mis.model.Goods;
import com.scau.mis.util.BarcodeUtil;

/**
 * 商品信息的业务逻辑实现
 * 
 * @author jodenhe
 * 
 */
public class GoodsService {
	public static Log log = Log.getLog(GoodsService.class);

	/**
	 * 新增商品
	 * 
	 * @param goods
	 *            商品对象
	 * @return 成功返回true，失败返回false
	 */
	public Map<String, Object> addGoods(Goods goods) {
		Map<String, Object> result = new HashMap<String, Object>();
		String name = goods.getName();
		String pathUrl = PathKit.getWebRootPath() + "/barcode/"
				+ goods.getBarcode() + ".png";
		BarcodeUtil.generateFile(goods.getBarcode(), pathUrl);

		if (isExist(goods.getName())) {
			result.put("status", false);
			result.put("msg", "商品名称已存在！");
		}
		else{
			if (null != name && !"".equals(name)) {
				if (goods.save()) {
					result.put("status", true);
					result.put("msg", "新增商品成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "新增商品失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "商品名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 修改商品信息
	 * 
	 * @param goods
	 *            要修改的商品对象
	 * @return 成功返回true，失败返回false
	 */
	public Map<String, Object> updateGoods(Goods goods) {
		Map<String, Object> result = new HashMap<String, Object>();
		String name = goods.getName();
		if (isExist(goods.getName(),goods.getId())) {
			result.put("status", false);
			result.put("msg", "商品名称已存在！");
		}
		else{
			if (null!=name && !"".equals(name)) {
				if (goods.update()) {
					result.put("status", true);
					result.put("msg", "更新成功！");
				}
				else{
					result.put("status", false);
					result.put("msg", "更新失败，数据库未知错误！");
				}
			}
			else{
				result.put("status", false);
				result.put("msg", "品牌名称不能为空！");
			}
		}
		return result;
	}

	/**
	 * 获得所有的商品
	 * 
	 * @return 商品List数组
	 */
	public List<Goods> getAllGoods() {
		String sql = "select * from goods";
		List<Goods> goods = Goods.dao.find(sql);
		return goods;
	}

	/**
	 * 根据商品id删除商品
	 * 
	 * @param id
	 *            商品id
	 * @return 成功返回true，失败返回false
	 */
	public boolean deleteGoodsById(long id) {
		if (Goods.dao.deleteById(id))
			return true;
		else
			return false;
	}

	/**
	 * 根据商品的尺码id删除商品
	 * 
	 * @param sizeId
	 *            商品sizeId
	 * @return 成功返回true，失败返回false
	 */
	public static boolean deleteGoodsBySizeId(long sizeId) {
		try {
			List<Goods> goodsList = Goods.dao
					.find("select `g`.`sizeId` from `goods` as `g` where `g`.`sizeId` = "
							+ sizeId);
			for (Goods goods : goodsList) {
				goods.delete();
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 模糊搜索
	 */
	public List<Goods> getGoodsByKeyWord(String keyWord) {
		String sql = "select * from goods where CONCAT('name','script','style','barcode','price') like '%"
				+ keyWord + "%'";
		List<Goods> goods = Goods.dao.find(sql);
		if (goods.size() != 0)
			return goods;
		else
			return null;
	}

	/**
	 * 判断商品是否存在（内部方法）
	 * @param name 商品名称
	 * @return 存在返回true，否则false
	 */
	private boolean isExist(String name){
		String sql = "select `g`.`name` from `goods` as `g`  where `g`.`name` = '"+name+"'";
		return Goods.dao.find(sql).size()>0;
	}
	
	/**
	 * 判断商品是否存在（内部方法）
	 * @param name 商品名称
	 * @param id 商品id
	 * @return 存在返回true，否则false
	 */
	private boolean isExist(String name , long id){
		String sql = "select `g`.`name` from `goods` as `g`  where `g`.`name` = '"+name+"' and `g`.`id` != " + id;
		return Goods.dao.find(sql).size()>0;
	}

}
