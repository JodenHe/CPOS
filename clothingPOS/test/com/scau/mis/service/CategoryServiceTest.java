package com.scau.mis.service;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;

import com.scau.mis.model.Category;

public class CategoryServiceTest {

	@BeforeClass
	public static void init() throws Exception{
//		start(new Config());
	}
	
	@Test
	public void testAdd() {
		Category category = new Category();
		category.setName("服装");
//		category.setParentId(parentId);
		category.setScript("测试测试！！！");
		assertEquals(true,new CategoryService().addCategory(category));
	}

}
