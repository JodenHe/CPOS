package com.scau.jodenhe.cpos.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scau.jodenhe.cpos.dto.ResultForJson;
import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.service.BrandService;

@Controller
@RequestMapping("brand")
public class BrandController {

	private final Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private BrandService service;

	/**
	 * 保存
	 * @param brand
	 * @return
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	public ResultForJson<Brand> save(Brand brand) {
		ResultForJson<Brand> result = null;

		try {
			if (service.save(brand) <= 0) {
				result = new ResultForJson<>(false, "插入失败");
			} else {
				brand = service.getBrandByName(brand.getName());
				result = new ResultForJson<>(true, brand, "插入成功");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result = new ResultForJson<>(false, e.getMessage());
		}
		return result;
	}

	/**
	 * 更新
	 * @param brand
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	public ResultForJson<String> update(@ModelAttribute("brand") Brand brand) {
		ResultForJson<String> result = null;

		try {
			if (service.update(brand) <= 0) {
				result = new ResultForJson<>(false, "更新失败");
			} else {
				result = new ResultForJson<>(true, "更新成功");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result = new ResultForJson<>(false, e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "getAllBrand", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	public ResultForJson<List<Brand>> getAllBrand() {
		ResultForJson<List<Brand>> result = null;
		List<Brand> list = service.getAllBrand();
		result = new ResultForJson<List<Brand>>(true, list);
		return result;
	}
	
	@RequestMapping(value = "checkName", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	public boolean checkName(String name) {
		return service.isExit(name);
	}
	
	@RequestMapping(value = "{id}/checkName", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	public boolean checkName(@PathVariable("id")long id, String name) {
		return service.isExit(name, id);
	}
}
