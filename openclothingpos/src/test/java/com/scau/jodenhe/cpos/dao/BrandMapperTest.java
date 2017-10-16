package com.scau.jodenhe.cpos.dao;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scau.jodenhe.cpos.entity.Brand;
import com.scau.jodenhe.cpos.plugins.mybatis.PageModel;

/**
 * 
 * <p>
 * Title: BrandMapper 单元测试
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: scau
 * </p>
 * <p>
 * Copyright: 1.0
 * </p>
 * 
 * @author jodenhe
 * @version 1.0
 * @since 2017年8月28日 下午8:18:00
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring的配置文件
@ContextConfiguration("classpath:spring/spring-dao.xml")
public class BrandMapperTest {

	final Logger logger = Logger.getLogger(getClass());
	@Autowired
	BrandMapper dao;

	@Test
	public void testSelectById() {
		logger.info(dao.selectById(1L));
	}

	@Test
	public void testSelectOne() {
		Brand brand = new Brand();
		// 只能查出一条记录
		brand.setId(2L);
		logger.info(dao.selectOne(brand));
	}

	@Test
	public void testSelectList() {
		Brand brand = new Brand();
		logger.info(dao.selectList(brand));
		logger.info("===========================================");
	}

	@Test
	public void testSelectPage() {
		Brand brand = new Brand();
		PageModel p = new PageModel();
		p.setPageSize(2);
		p.setPageNo(2);
		logger.info(dao.selectPage(brand, p));
		logger.info("===========================================");
	}

	@Test
	public void testSave() {
		fail("Not yet implemented");
	}

	@Test
	public void testBatchSave() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testBatchUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelById() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelList() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelArray() {
		fail("Not yet implemented");
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectListByNameNotId() {
		logger.info(dao.selectListByNameNotId("李宁", 1L));
	}

}
