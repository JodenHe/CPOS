package com.scau.jodenhe.cpos.web.common;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scau.jodenhe.cpos.dto.ResultForJson;
import com.scau.jodenhe.cpos.service.common.BaseDataService;

/**
 * 基础数据公有controller
 * @author jodenhe
 * @create 2017年10月16日 上午9:30:29
 */
public class BaseDataController<T> {
	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	protected BaseDataService<T> service;
	
	/**
	 * 对前端数据进行绑定，否则@ModelAttribute无法绑定值
	 * <br>参考：http://blog.csdn.net/subuser/article/details/19919121
	 * @param binder
	 */
	@InitBinder("baseData")    
	protected void initBinder2SensorData(WebDataBinder binder) {    
        binder.setFieldDefaultPrefix("baseData.");    
    } 
	
	/**
	 * 保存
	 * @param t
	 * @return
	 */
	@RequestMapping(value = "save", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	protected ResultForJson<T> save(@ModelAttribute("baseData") T t) {
		ResultForJson<T> result = null;

		try {
			if (service.save(t) <= 0) {
				result = new ResultForJson<>(false, "插入失败");
			} else {
				result = new ResultForJson<>(true, t, "插入成功");
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
	protected ResultForJson<T> update(@ModelAttribute("baseData") T t) {
		ResultForJson<T> result = null;

		try {
			if (service.update(t) <= 0) {
				result = new ResultForJson<>(false, "更新失败");
			} else {
				result = new ResultForJson<>(true, t , "更新成功");
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result = new ResultForJson<>(false, e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "getAllData", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	protected ResultForJson<List<T>> getAllData() {
		ResultForJson<List<T>> result = null;
		List<T> list = service.listData();
		result = new ResultForJson<List<T>>(true, list);
		return result;
	}
	
	@RequestMapping(value = "checkName", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	protected boolean checkName(String name) {
		return service.isExit(name);
	}
	
	@RequestMapping(value = "{id}/checkName", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody // 告诉返回的是json
	protected boolean checkName(@PathVariable("id")long id, String name) {
		return service.isExit(name, id);
	}
}
