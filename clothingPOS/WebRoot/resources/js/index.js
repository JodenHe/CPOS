$(function() {

	/* 类别管理 */
	selectAllCategory();
	getFirstCategory();
	category_zTree();
	/* 商品管理 */
	getAllGoods();
	getAllGoodsColor();
	getAllGoodsBrand();
	getGoodsThirdCategory();
	getGoodsSizeType();
	$('.selectCombo').comboSelect();
});

/* 类别管理 */
function categoryManage() {
	$("#goods-manager-category").show(200);
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
			$('.secondCategory').html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				$('.secondCategory').append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
			}
			$('.secondCategory').comboSelect();
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
	$('#categorys-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [ 0, 2, 3, 4, 5 ]
						}, 
						 {
							"bSortable" : false,
							"aTargets" : [ 5 ]
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
						"oLanguage" : {
							"sProcessing" : "正在加载中......",
							"sLengthMenu" : "每页显示 _MENU_ 条记录",
							"sZeroRecords" : "对不起，查询不到相关数据！",
							'sSearch' : '检索:',
							"sEmptyTable" : "表中无数据存在！",
							"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
							"sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
							"oPaginate" : {
								"sFirst" : "首页",
								"sPrevious" : "上一页",
								"sNext" : "下一页",
								"sLast" : "末页"
							}
						},
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
					})
}

/*商品管理*/

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
					alert(data.data);
					goods();
				} else {
					alert(data.data);
					getAllGoods();
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
//辅助goods()方法，dataTable
function goodsDataTable(data) {
	console.log(data)
	$('#goods-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : false,
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [ 0, 1, 2, 5, 6, 7, 8 ]
						}, ],
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
						"oLanguage" : {
							"sProcessing" : "正在加载中......",
							"sLengthMenu" : "每页显示 _MENU_ 条记录",
							"sZeroRecords" : "对不起，查询不到相关数据！",
							'sSearch' : '检索:',
							"sEmptyTable" : "表中无数据存在！",
							"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
							"sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
							"oPaginate" : {
								"sFirst" : "首页",
								"sPrevious" : "上一页",
								"sNext" : "下一页",
								"sLast" : "末页"
							}
						},
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							$('td:eq(1)', nRow).html(
									"<input name='goodsStyle' type='text' value="
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
													+ ',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteGoods('
													+ aData.id
													+ ')">删除</button>')
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
							$('td:eq(0)', nRow).html(iDisplayIndex+1);
						},
					})
}