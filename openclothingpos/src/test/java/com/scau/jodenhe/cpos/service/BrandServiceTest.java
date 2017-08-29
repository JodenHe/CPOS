package com.scau.jodenhe.cpos.service;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.scau.jodenhe.cpos.entity.Brand;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-dao.xml", "classpath:spring/spring-service.xml" })
public class BrandServiceTest {

	private final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	private BrandService service;

	@Test
	public void testGetAllBrand() {
		logger.info("查询品牌信息：" + service.getAllBrand());
	}

	@Test
	public void testSave() {
		Brand brand = new Brand();
		brand.setName("李宁2");
		logger.info(service.save(brand));
	}

	@Test
	public void testUpdate() {
		Brand brand = new Brand();
		brand.setName("李宁");
		brand.setState((byte) 1);
		brand.setId(1L);
		logger.info(service.update(brand));
	}

	@Test
	public void testGetBrandByName() {
		logger.info(service.getBrandByName("李宁"));
	}

}
