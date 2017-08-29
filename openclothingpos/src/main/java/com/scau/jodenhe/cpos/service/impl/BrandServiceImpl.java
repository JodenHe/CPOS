package com.scau.jodenhe.cpos.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scau.jodenhe.cpos.dao.BrandMapper;
import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.exception.NameAlreadyExitException;
import com.scau.jodenhe.cpos.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	private final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private BrandMapper dao;

	@Override
	public List<Brand> getAllBrand() {
		logger.info("查询所有品牌信息");
		Brand brand = new Brand();
		List<Brand> result = dao.selectList(brand);
		return result;
	}

	@Override
	public int save(Brand brand) throws NameAlreadyExitException {
		logger.info("保存品牌信息");
		if (isExit(brand.getName())) {
			throw new NameAlreadyExitException("name already exit");
		}
		brand.setCreateTime(new Date());

		return dao.save(brand);
	}

	@Override
	public int update(Brand brand) throws NameAlreadyExitException {
		logger.info("更新品牌信息");
		if (isExit(brand.getName(), brand.getId())) {
			throw new NameAlreadyExitException("name already exit");
		}
		return dao.update(brand);
	}

	@Override
	public Brand getBrandByName(String name) {
		logger.info("根据名字获取品牌信息");
		Brand brand = new Brand();
		brand.setName(name);
		return dao.selectOne(brand);
	}

	@Override
	public boolean isExit(String name) {
		return null != getBrandByName(name);
	}
	
	private boolean isExit(String name, Long id) {
		return dao.selectListByNameNotId(name, id).size()>0;
	}

}
