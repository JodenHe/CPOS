$(function() {

	/* 类别管理 */
	categoryManage();
	/* 商品管理 */
	goodsManage();
	/*品牌管理*/
	brandManage();
	/*颜色管理*/
	colorManage();

	$('.selectCombo').comboSelect();
});

/* 类别管理 */
function categoryManage() {
	selectAllCategory();
	getFirstCategory();
	category_zTree();
}

// 生成树形菜单
function category_zTree() {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/selectAllCategory',// 路径
		data : {},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			make_zTree(data);
		}
	});
}
// 获取类别的第一级目录
function getFirstCategory() {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getFirstCategory',// 路径
		data : {},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			for (var i = 0; i < data.length; i++) {
				$('.category-firstCategory').append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
			}
			$('.firstCategory').comboSelect();
		}
	});
}
// 获取类别的第二级目录
function getSecondCategory(pId) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getSecondCategory',// 路径
		data : {
			"pId" : pId
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('.category-secondCategory').html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				$('.category-secondCategory').append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
			}
			$('.category-secondCategory').comboSelect();
		}
	});
}
// 新增类别
function addCategory() {
	$.ajax({
		type : "post",
		url : contextPath + "/category/insert",
		dataType : "json",
		data : {
			"category.name" : $('#category-name').val(),
			"category.pId" : $('#category-secondCategory').val() != 0 ? $(
					'#category-secondCategory').val() : $('#category-firstCategory').val(),
			"category.script" : $('#category-script').val()
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				selectAllCategory();
				/* window.location.href=contextPath+"/admin"; */
			} else {
				alert(data.msg);
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
// 查看所有类别信息
function selectAllCategory() {
	$.ajax({
		type : "post",
		url : contextPath + "/category/selectAllCategory",
		dataType : "json",
		data : {},
		success : function(result) {
			categorysDataTable(result);
		},
		error : function() {
			console.log("false")
		}
	});

}
// 删除类别
function deleteCategory(id) {
	$.ajax({
		type : "post",
		url : contextPath + "/category/getChildren",
		dataType : "json",
		data : {
			id : id
		},
		success : function(data) {
			console.log(data)
			if (!data.status) {
				deleteCategory2(id)
			} else {
				alert("该类别有子类别无法删除！");
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
// 删除类别子方法
function deleteCategory2(id) {
	$.ajax({
		type : "post",
		url : contextPath + "/category/delete",
		dataType : "json",
		data : {
			id : id
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert("成功删除！");
				selectAllCategory();
				/* window.location.href=contextPath+"/test"; */
			} else {
				alert("未知错误!");
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
// 更新类别信息
function updateCategory(id, btnObject) {
	console.log(btnObject);
	var name = $(btnObject).parents().eq(0).siblings().eq(1).children().val();
	var script = $(btnObject).parents().eq(0).siblings().eq(3).children().val();
	$.ajax({
		type : "post",
		url : contextPath + "/category/update",
		dataType : "json",
		data : {
			"category.id" : id,
			"category.name" : name,
			"category.script" : script
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				selectAllCategory();
			} else {
				alert(data.msg);
				selectAllCategory();
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
// 类别的dataTable
function categorysDataTable(data) {
	console.log(data)
	var categorysTable = $('#categorys-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
				        "sDom": "<>lfrtip<>",
						/*"bSort" : true,*/
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [ 0, 2, 3, 4, 5 ]
						}, 
						 {
							"bSortable" : false,
							"aTargets" : [0, 5 ]
						},
						],
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
							data : 'id'
						}, {
							data : 'name'
						}, {
							data : 'pId'
						}, {
							data : 'script'
						}, {
							data : 'createTime'
						}, {
							data : 'id'
						}, ],
						"language": {
	                		"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
	            		},
	            		dom: 'Bfrtip',
	            		 buttons: [
					        'print'
					    ],
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							$.ajax({
								type : "post",
								url : contextPath + "/category/selectCategory",
								dataType : "json",
								data : {
									id : aData.pId == null ? 0 : aData.pId
								},
								success : function(data) {
									$('td:eq(2)', nRow)
											.html(
													data.name == null ? "无"
															: data.name);
								},
								error : function() {
									console.log("false")
								}
							});
							
							$('td:eq(1)', nRow).html(
									"<input name='categoryName' type='text' value="
											+ aData.name + ">")
							$('td:eq(3)', nRow).html(
									"<input name='categoryScript' type='text' value="
											+ aData.script + ">")
							$('td:eq(5)', nRow)
									.html(
											'<button class="btn btn-default" onclick="updateCategory('
													+ aData.id
													+ ',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteCategory('
													+ aData.id
													+ ')">删除</button>');
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
							$('td:eq(0)', nRow).html(iDisplayIndex + 1);
						},
					});
	//categorysTable.buttons().enable();
	console.log(categorysTable)
}

/*商品管理*/
function goodsManage() {
	getAllGoods();
	getAllGoodsColor();
	getAllGoodsBrand();
	getGoodsThirdCategory();
	getGoodsSizeType();
}
//获取颜色
function getAllColor() {
	$.ajax({
		type : "post",
		url : contextPath + "/color/getAllColor",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			for (var i = 0; i < result.length; i++) {
				$('.goods-color').append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取颜色
function getAllGoodsColor() {
	$.ajax({
		type : "post",
		url : contextPath + "/color/getAllColor",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			for (var i = 0; i < result.length; i++) {
				$('.goods-color').append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取品牌
function getAllGoodsBrand() {
	$.ajax({
		type : "post",
		url : contextPath + "/brand/getAllBrand",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			for (var i = 0; i < result.length; i++) {
				$('.goods-brand').append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取第三级类别
function getGoodsThirdCategory() {
	$.ajax({
		type : "post",
		url : contextPath + "/category/getThirdCategory",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			for (var i = 0; i < result.length; i++) {
				$('.goods-category').append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取尺寸类型
function getGoodsSizeType() {
	$.ajax({
		type : "post",
		url : contextPath + "/size/getSizeType",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			for (var i = 0; i < result.length; i++) {
				$('.goods-size-type').append(
						'<option value="' + result[i] + '" >'
								+ result[i] + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取指定类型的尺寸
function getSizeByType(type) {
	$.ajax({
		type : "post",
		url : contextPath + "/size/getSizeByType",
		dataType : "json",
		data : {
			"type" : type
		},
		success : function(data) {
			var result = data;
			$('.goods-size').html("");
			for (var i = 0; i < result.length; i++) {
				$('.goods-size').append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
			}
			$('.selectCombo').comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//添加商品
function addGoods() {
	$.ajax({
			type : "post",
			url : contextPath + "/goods/add",
			dataType : "json",
			data : {
				"goods.name" : $('#goods-name').val(),
				"goods.style" : $('#goods-style').val(),
				"goods.categoryId" : $('#goods-category').val(),
				"goods.brandId" : $('#goods-brand').val(),
				"goods.sizeId" : $('#goods-size').val(),
				"goods.colorId" : $('#goods-color').val(),
				"goods.price" : $('#goods-price').val() == "" ? 0 : $(
						'#goods-price').val(),
				"goods.script" : $('#goods-script').val()
			},
			success : function(data) {
				console.log(data)
				if (data.status) {
					alert(data.msg);
					getAllGoods();
				} else {
					alert(data.msg);
				}
			},
			error : function() {
				console.log("false")
			}
		});
}
//删除商品
function deleteGoods(id) {
	$.ajax({
		type : "post",
		url : contextPath + "/goods/delete",
		dataType : "json",
		data : {
			id : id
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert("商品删除成功！");
				getAllGoods();
			} else {
				alert("删除失败，未知错误！");
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
//更新商品信息
function updateGoods(id, btnObject) {
	console.log(btnObject);
	var name = $(btnObject).parents().eq(0).siblings().eq(1).children().val();
	var style = $(btnObject).parents().eq(0).siblings().eq(4)
			.children().val();
	var price = $(btnObject).parents().eq(0).siblings().eq(7).children().val();
	var script = $(btnObject).parents().eq(0).siblings().eq(8).children().val();
	$.ajax({
		type : "post",
		url : contextPath + "/goods/update",
		dataType : "json",
		data : {
			"goods.id" : id,
			"goods.name" : name,
			"goods.style" : style,
			"goods.price" : price == "" ? 0 : price,
			"goods.script" : script
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				getAllGoods();
			} else {
				alert(data.msg);
				getAllGoods();
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
//列出所有的商品，dataTable展示
function getAllGoods() {
	$.ajax({
		type : "POST",
		url : contextPath + "/goods/getAllGoods",
		datatype : "json",
		success : function(result) {
			goodsDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}
//辅助getAllGoods()方法，dataTable
function goodsDataTable(data) {
	console.log(data)
	$('#goods-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [ 0, 1, 2, 5, 6, 7, 10 ]
						},
						{
							"bSortable" : false,
							"aTargets" : [ 6,0 ]
						},
						 ],
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
							data : 'id'
						}, {
							data : 'name'
						}, {
							data : 'categoryId'
						}, {
							data : 'brandId'
						}, {
							data : 'style'
						}, {
							data : 'colorId'
						}, {
							data : 'price'
						}, {
							data : 'barcode'
						}, {
							data : 'script'
						}, {
							data : 'createTime'
						}, {
							data : 'id'
						}, ],
						"language": {
                			"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
            			},
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							$('td:eq(1)', nRow).html(
									"<input name='goodsName' type='text' value="
											+ aData.name + ">")
							$('td:eq(4)', nRow).html(
									"<input name='goodsStyle' type='text' value="
											+ aData.style + ">")
							$('td:eq(6)', nRow).html(
									"<img style='width:120px;' src='"
											+ contextPath + "/barcode/"
											+ aData.barcode + ".png'>")
							$('td:eq(7)', nRow).html(
									"<input name='goodsPrice' type='number' min='0' value="
											+ aData.price + ">")
							$('td:eq(8)', nRow).html(
									"<input name='goodsScript' type='text' value="
											+ (aData.script==null?'': aData.script) + ">")
							$('td:eq(10)', nRow)
									.html(
											'<button class="btn btn-default" onclick="updateGoods('
													+ aData.id
													+ ',this)">更新</button><button class="btn btn-primary" onclick="deleteGoods('
													+ aData.id
													+ ')">删除</button>')
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
							$('td:eq(0)', nRow).html(iDisplayIndex+1);
						},
					})
}

/*品牌管理*/
function brandManage() {
	getAllBrand();
}
//添加品牌信息
function addBrand(){
	$.ajax({
			type : "post",
			url : contextPath + "/brand/add",
			dataType : "json",
			data : {
				"brand.name" : $('#brand-name').val(),
				"brand.script" : $('#brand-script').val()
			},
			success : function(data) {
				console.log(data)
				if (data.status) {
					alert(data.msg);
					getAllBrand();
				} else {
					alert(data.msg);
				}
			},
			error : function() {
				console.log("false")
			}
		});
}
//更新品牌信息
function updateBrand(id, btnObject) {
	console.log(btnObject);
	var name = $(btnObject).parents().eq(0).siblings().eq(1).children().val();
	var script = $(btnObject).parents().eq(0).siblings().eq(2).children().val();
	$.ajax({
		type : "post",
		url : contextPath + "/brand/update",
		dataType : "json",
		data : {
			"brand.id" : id,
			"brand.name" : name,
			"brand.script" : script
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				getAllBrand();
			} else {
				alert(data.msg);
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
//列出所有的品牌，dataTable展示
function getAllBrand() {
	$.ajax({
		type : "POST",
		url : contextPath + "/brand/getAllBrand",
		datatype : "json",
		success : function(result) {
			brandDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}
//辅助getAllBrand()方法，dataTable
function brandDataTable(data) {
	console.log(data)
	$('#brand-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [ 0, 4]
						},  
						 {
							"bSortable" : false,
							"aTargets" : [0, 4 ]
						},
						],
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
							data : 'id'
						}, {
							data : 'name'
						}, {
							data : 'script'
						}, {
							data : 'createTime'
						}, {
							data : 'id'
						}, ],
						"language": {
	                		"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
	            		},
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							$('td:eq(1)', nRow).html(
									"<input name='brandName' type='text' value="
											+ aData.name + ">")
							$('td:eq(2)', nRow).html(
									"<input name='brandScript' type='text' value="
											+ (aData.script==null?'': aData.script) + ">")
							$('td:eq(4)', nRow)
									.html(
											'<button class="btn btn-default" onclick="updateBrand('
													+ aData.id
													+ ',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteBrand('
													+ aData.id
													+ ')">删除</button>')
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
							$('td:eq(0)', nRow).html(iDisplayIndex+1);
						},
					})
}

/*颜色管理*/
function colorManage() {
	getAllColor();
}
//添加颜色信息
function addColor(){
	$.ajax({
			type : "post",
			url : contextPath + "/color/add",
			dataType : "json",
			data : {
				"color.name" : $('#color-name').val(),
				"color.script" : $('#color-script').val()
			},
			success : function(data) {
				console.log(data)
				if (data.status) {
					alert(data.msg);
					getAllColor();
				} else {
					alert(data.msg);
				}
			},
			error : function() {
				console.log("false")
			}
		});
}
//更新颜色信息
function updateColor(id, btnObject) {
	console.log(btnObject);
	var name = $(btnObject).parents().eq(0).siblings().eq(1).children().val();
	var script = $(btnObject).parents().eq(0).siblings().eq(2).children().val();
	$.ajax({
		type : "post",
		url : contextPath + "/color/update",
		dataType : "json",
		data : {
			"color.id" : id,
			"color.name" : name,
			"color.script" : script
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				getAllColor();
			} else {
				alert(data.msg);
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
//列出所有的颜色，dataTable展示
function getAllColor() {
	$.ajax({
		type : "POST",
		url : contextPath + "/color/getAllColor",
		datatype : "json",
		success : function(result) {
			colorDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}
//辅助getAllBrand()方法，dataTable
function colorDataTable(data) {
	console.log(data)
	$('#color-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
						"bSearchable" : false,
						"aTargets" : [ 0, 4]
					}, 
					{
						"bSortable" : false,
						"aTargets" : [0, 4 ]
					},
					],
					data : data,
					// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
					columns : [ {
						data : 'id'
					}, {
						data : 'name'
					}, {
						data : 'script'
					}, {
						data : 'createTime'
					}, {
						data : 'id'
					}, ],
					"language": {
                		"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
            		},
					"fnCreatedRow" : function(nRow, aData, iDataIndex) {
						$('td:eq(1)', nRow).html(
								"<input name='brandName' type='text' value="
										+ aData.name + ">")
						$('td:eq(2)', nRow).html(
								"<input name='brandScript' type='text' value="
										+ (aData.script==null?'': aData.script) + ">")
						$('td:eq(4)', nRow)
								.html(
										'<button class="btn btn-default" onclick="updateColor('
												+ aData.id
												+ ',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteColor('
												+ aData.id
												+ ')">删除</button>')
					},
					"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
							iDisplayIndexFull) {
						$('td:eq(0)', nRow).html(iDisplayIndex+1);
					},
				})
}

/*自定义尺寸模态库*/

//初始化模态框内容
function initSizeModel(){
	getAllSize();
	$("#custom-size-type").hide();
	$("#size-type").parent().show();
	$("#showCustomSizeTypeA").hide();
	$("#initSizeModelA").show();
}
//显示尺寸类型输入框
function showCustomSizeType(){
	$("#size-type").parent().hide();
	$("#custom-size-type").show();
	$("#initSizeModelA").hide();
	$("#showCustomSizeTypeA").show();
}
//添加尺寸信息
function addSize(){
	$.ajax({
			type : "post",
			url : contextPath + "/size/add",
			dataType : "json",
			data : {
				"size.name" : $('#size-name').val(),
				"size.type" : $('#custom-size-type').val()==""?$('#size-type').val():$('#custom-size-type').val(),
				"size.script" : $('#size-script').val()
			},
			success : function(data) {
				console.log(data)
				if (data.status) {
					alert(data.msg);
					getAllSize();
					getGoodsSizeType();
				} else {
					alert(data.msg);
				}
			},
			error : function() {
				console.log("false")
			}
		});
}
//更新尺寸信息
function updateSize(id, btnObject) {
	console.log(btnObject);
	var name = $(btnObject).parents().eq(0).siblings().eq(1).children().val();
	var script = $(btnObject).parents().eq(0).siblings().eq(3).children().val();
	$.ajax({
		type : "post",
		url : contextPath + "/size/update",
		dataType : "json",
		data : {
			"size.id" : id,
			"size.name" : name,
			"size.script" : script
		},
		success : function(data) {
			console.log(data)
			if (data.status) {
				alert(data.msg);
				getAllSize();
			} else {
				alert(data.msg);
				getAllSize();
			}
		},
		error : function() {
			console.log("false")
		}
	});
}
//列出所有的尺寸，dataTable展示
function getAllSize() {
	$.ajax({
		type : "POST",
		url : contextPath + "/size/getAllSize",
		datatype : "json",
		success : function(result) {
			sizeDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}
//辅助getAllSize()方法，dataTable
function sizeDataTable(data) {
	console.log(data)
	$('#size-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
						"bSearchable" : false,
						"aTargets" : [ 0, 5]
					}, 
					{
						"bSortable" : false,
						"aTargets" : [ 0,5 ]
					},
					],
					data : data,
					// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
					columns : [ {
						data : 'id'
					}, {
						data : 'name'
					}, {
						data : 'type'
					}, {
						data : 'script'
					}, {
						data : 'createTime'
					}, {
						data : 'id'
					}, ],
					"language": {
                		"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
            		},
					"fnCreatedRow" : function(nRow, aData, iDataIndex) {
						$('td:eq(1)', nRow).html(
								"<input name='brandName' type='text' value="
										+ aData.name + ">")
						$('td:eq(3)', nRow).html(
								"<input name='brandScript' type='text' value="
										+ (aData.script==null?'': aData.script) + ">")
						$('td:eq(5)', nRow)
								.html(
										'<button class="btn btn-default" onclick="updateSize('
												+ aData.id
												+ ',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteSize('
												+ aData.id
												+ ')">删除</button>')
					},
					"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
							iDisplayIndexFull) {
						$('td:eq(0)', nRow).html(iDisplayIndex+1);
					},
				})
}