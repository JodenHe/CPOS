package com.scau.jodenhe.cpos.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scau.jodenhe.cpos.dao.BrandMapper;
import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.exception.CposException;
import com.scau.jodenhe.cpos.exception.NameAlreadyExitException;
import com.scau.jodenhe.cpos.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	private final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private BrandMapper dao;

	@Override
	public List<Brand> listData() {
		logger.info("查询所有品牌信息");
		Brand brand = new Brand();
		List<Brand> result = dao.selectList(brand);
		return result;
	}

	@Override
	public int save(Brand brand) throws CposException, NameAlreadyExitException {
		int saveCount = 0;
		try {
			if (isExit(brand.getName())) {
				throw new NameAlreadyExitException("名字已存在");
			}
			brand.setCreateTime(new Date());
			saveCount = dao.save(brand);
		} catch (NameAlreadyExitException e1) {
			throw e1;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new CposException("inner error:" + e.getMessage());
		}

		return saveCount;
	}

	@Override
	public int update(Brand brand) throws CposException, NameAlreadyExitException {
		int updateCount = 0;
		try {
			if (isExit(brand.getName(), brand.getId())) {
				throw new NameAlreadyExitException("名字已存在");
			}
			updateCount = dao.update(brand);
		} catch (NameAlreadyExitException e1) {
			throw e1;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new CposException("inner error:" + e.getMessage());
		}

		return updateCount;
	}

	@Override
	public Brand getDataByName(String name) {
		Brand brand = new Brand();
		brand.setName(name);
		return dao.selectOne(brand);
	}

	@Override
	public boolean isExit(String name) {
		return null != getDataByName(name);
	}

	@Override
	public boolean isExit(String name, Long id) {
		return dao.selectListByNameNotId(name, id).size() > 0;
	}

	/*@Override
	public List<Brand> getAllBrand() {
		logger.info("查询所有品牌信息");
		Brand brand = new Brand();
		List<Brand> result = dao.selectList(brand);
		return result;
	}

	@Override
	public int save(Brand brand) throws CposException, NameAlreadyExitException {
		int saveCount = 0;
		try {
			if (isExit(brand.getName())) {
				throw new NameAlreadyExitException("名字已存在");
			}
			brand.setCreateTime(new Date());
			saveCount = dao.save(brand);
		} catch (NameAlreadyExitException e1) {
			throw e1;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new CposException("inner error:" + e.getMessage());
		}

		return saveCount;
	}

	@Override
	public int update(Brand brand) throws CposException, NameAlreadyExitException {
		int updateCount = 0;
		try {
			if (isExit(brand.getName(), brand.getId())) {
				throw new NameAlreadyExitException("名字已存在");
			}
			updateCount = dao.update(brand);
		} catch (NameAlreadyExitException e1) {
			throw e1;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new CposException("inner error:" + e.getMessage());
		}

		return updateCount;
	}

	@Override
	public Brand getBrandByName(String name) {
		Brand brand = new Brand();
		brand.setName(name);
		return dao.selectOne(brand);
	}

	@Override
	public boolean isExit(String name) {
		return null != getBrandByName(name);
	}

	@Override
	public boolean isExit(String name, Long id) {
		return dao.selectListByNameNotId(name, id).size() > 0;
	}*/

}
