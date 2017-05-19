$(function() {
	init();//初始化

	//十年视图的datetimepicker
	$('.form_year').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 4,//十年视图
		minView: 4,//十年视图
		forceParse: 0
    });
	$('.form_date').datetimepicker({
		language:  'zh-CN',
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
	});
});


/*页面初始化*/
function init(){
	/* 类别管理 */
	categoryManage();
	/* 商品管理 */
	goodsManage();
	/*品牌管理*/
	brandManage();
	/*颜色管理*/
	colorManage();
	/*角色列表*/
	getAllRole();
	/*用户列表*/
	getAllUser();

	/*初始化下拉框*/
	$('.selectCombo').comboSelect();
	/*dataTable所有列的详情的展开或者收起*/
	$('th.details-control').click(function () {
		var th = $(this).parents().eq(0);
		var tr = $(this).parents().eq(0).parents().eq(0).siblings().children("tr");

		if(th.hasClass("shown")){
			th.removeClass("shown");
			for (var i = 0; i <tr.length; i++) {
				if (tr.eq(i).hasClass("shown")) {
					tr.eq(i).children("td.details-control").trigger("click");
				}
			}
		}
		else{
			th.addClass("shown");
			for (var i = 0; i <tr.length; i++) {
				if (!tr.eq(i).hasClass("shown")) {
					tr.eq(i).children("td.details-control").trigger("click")
				}
			}
		}
	});
} 

/*页面重置*/
function initForm(b){
	//重置form表单
	$(b).parents("form").eq(0).trigger('reset');
	/*初始化下拉框*/
	$('.selectCombo').comboSelect();
} 

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
			$('.category-firstCategory').html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				$('.category-firstCategory').append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
			}
			$('.category-firstCategory').comboSelect();
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
// 更据id获取类别的第一级目录,id——类别id，id2——用于select的id查找
function getFirstCategoryById(id,id2) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getFirstCategory',// 路径
		data : {},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('#update-category-firstCategory'+id2).html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				if (id == data[i].id) {
					$('#update-category-firstCategory'+id2).append(
						'<option value="' + data[i].id + '"selected >' + data[i].name
								+ '</option>');
				} else {
					$('#update-category-firstCategory'+id2).append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
				}
			}
			$('#update-category-firstCategory'+id2).comboSelect();
		}
	});
}
// 更据id获取类别的第二级目录，pId——第一级目录的id值，id——类别id，id2——用于select的id查找
function getSecondCategoryById(pId,id,id2) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getSecondCategory',// 路径
		data : {
			"pId" : pId
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('#update-category-secondCategory'+id2).html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				if (id == data[i].id) {
					$('#update-category-secondCategory'+id2).append(
						'<option value="' + data[i].id + '" selected>' + data[i].name
								+ '</option>');
				} else {
					$('#update-category-secondCategory'+id2).append(
						'<option value="' + data[i].id + '" >' + data[i].name
								+ '</option>');
				}
			}
			$('#update-category-secondCategory'+id2).comboSelect();
		}
	});
}
// 更据id获取类别的第一级目录，id——类别id，dId——不能选的选项，id2——用于select的id查找
function getFirstCategoryById2(id,dId,id2) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getFirstCategory',// 路径
		data : {},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('#update-category-firstCategory'+id2).html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				if (dId == data[i].id) {
					$('#update-category-firstCategory'+id2).append(
							'<option value="' + data[i].id + '" disabled>' + data[i].name
									+ '</option>');
				} else {
					if (id == data[i].id) {
						$('#update-category-firstCategory'+id2).append(
							'<option value="' + data[i].id + '"selected >' + data[i].name
									+ '</option>');
					} else {
						$('#update-category-firstCategory'+id2).append(
							'<option value="' + data[i].id + '" >' + data[i].name
									+ '</option>');
					}
				}
			}
			$('#update-category-firstCategory'+id2).comboSelect();
		}
	});
}
// 更据id获取类别的第二级目录，pId——第一级目录的id值，id——类别id，dId——不能选的选项，id2——用于select的id查找
function getSecondCategoryById2(pId,id,dId,id2) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/getSecondCategory',// 路径
		data : {
			"pId" : pId
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			$('#update-category-secondCategory'+id2).html('<option value="0">不选，默认无</option>');
			for (var i = 0; i < data.length; i++) {
				if (dId == data[i].id) {
					$('#update-category-secondCategory'+id2).append(
							'<option value="' + data[i].id + '" disabled>' + data[i].name
									+ '</option>');
				} else {
					if (id == data[i].id) {
						$('#update-category-secondCategory'+id2).append(
							'<option value="' + data[i].id + '" selected>' + data[i].name
									+ '</option>');
					} else {
						$('#update-category-secondCategory'+id2).append(
							'<option value="' + data[i].id + '" >' + data[i].name
									+ '</option>');
					}
				}
			}
			$('#update-category-secondCategory'+id2).comboSelect();
		}
	});
}
//详情页面的父类别下拉框初始化
function getCategoryParents(id) {
	$.ajax({
		type : "POST", // 提交方式
		url : contextPath + '/category/selectParents',// 路径
		data : {
			"id" : id
		},// 数据，这里使用的是Json格式进行传输
		success : function(data) {// 返回数据根据结果进行相应的处理
			if (data.length == 3) {
				getFirstCategoryById(data[0].id,id);
				getSecondCategoryById(data[0].id,data[1].id,id);
			} else if(data.length == 2){
				getFirstCategoryById(data[0].id,id);
				getSecondCategoryById2(data[0].id,null,data[1].id,id);
			} else if(data.length == 1){
				getFirstCategoryById2(null,data[0].id,id);
				getSecondCategoryById(0,null,id);
			}
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
			if (data.status) {
				alert(data.msg);
				selectAllCategory();
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
	//判断详情页有无展开
	var f = $(btnObject).parent().siblings().eq(0).parent().hasClass("shown");
	if(!f){
		$(btnObject).parent().siblings().eq(0).trigger("click");
	}else{
		var table = $(btnObject).parents().eq(0).parents().eq(0).next().find("table");
		var name = table.find("td #update-category-name").val();
		var pId = table.find("td #update-category-secondCategory"+id).val()!= 0 ? table.find("td #update-category-secondCategory"+id).val() :table.find("td #update-category-firstCategory"+id).val();
		var script = table.find("td #update-category-script").val();
		
		$.ajax({
			type : "post",
			url : contextPath + "/category/update",
			dataType : "json",
			data : {
				"category.id" : id,
				"category.pId" : pId,
				"category.name" : name,
				"category.script" : script
			},
			success : function(data) {
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
}
// 类别的dataTable
function categorysDataTable(data) {
	var categorysTable = $('#categorys-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"aoColumnDefs" : [ 
											{
											"bSearchable" : false,
											"aTargets" : [0,5]
											}, 
											 {
												"bSortable" : false,
												"aTargets" : [5 ]
											},
										 ],
						"order": [[ 4, "desc" ]],//默认第5列降序排列
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
			                "className": 'details-control',
			                "orderable":  false,
			                "data":       null,
			                "defaultContent": ''
			            }/*,{
							data : 'id'
						}*/, {
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
						dom: 'lBfrtip',
					    buttons: [
									{
									 'extend': 'copy',
									 'text': '复制',//定义导出excel按钮的文字
									
									},
									{
									 'extend': 'excel',
									 'text': '导出excel',//定义导出excel按钮的文字
									
									},
									{
										'extend' : 'print',
										'text' : '打印',
										/*'exportOptions' : {
															modifier: {
																selected: true
															}
														},
										'autoPrint' : true*/
									}
									],
						"language": {
	                		"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
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
							
							/*$('td:eq(1)', nRow).html(
									"<input name='categoryName' type='text' value="
											+ aData.name + ">")
							$('td:eq(3)', nRow).html(
									"<input name='categoryScript' type='text' value="
											+ aData.script + ">")*/
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
						},
					});
	// Add event listener for opening and closing details
    $('#categorys-table tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = categorysTable.row( tr );
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( categorysTableDetail(row.data()) ).show();
            tr.addClass('shown');
            getCategoryParents(row.data().id);
        }
    } );
}
/* Formatting function for row details - modify as you need */
function categorysTableDetail ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>类别名称：</td>'+
            '<td><input class="form-control" id="update-category-name" type="text" placeholder="类别名称，不能为空" autofocus="autofocus" value="'+d.name+'" /></td>'+
        '</tr>'+
        '<tr>'+
            '<td>父类别：</td>'+
            '<td>'+
            	'<div class="row">'+
					'<div class="col-lg-6">'+
						'<select name="update-category-firstCategory" id="update-category-firstCategory'+d.id+'" class="selectCombo form-control  showparents update-category-firstCategory" onchange="getSecondCategoryById(this.value,'+d.pId+','+d.id+');">'+
							'<option value="0">不选，默认无</option>'+
						'</select>'+
					'</div>'+
					'<div class="col-lg-6">'+
						'<select name="update-category-secondCategory" id="update-category-secondCategory'+d.id+'" class="selectCombo form-control  showparents update-category-secondCategory">'+
							'<option value="0">不选，默认无</option>'+
						'</select>'+
					'</div>'+
				'</div>'+
            '</td>'+
        '</tr>'+
        '<tr>'+
            '<td>类别描述：</td>'+
            '<td><textarea class="form-control" rows="3" id="update-category-script" name="update-category-script" placeholder="请输入描述信息，可以为空">'+(d.script==null?'':d.script)+'</textarea></td>'+
        '</tr>'+
    '</table>';
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
function getAllGoodsColor() {
	$.ajax({
		type : "post",
		url : contextPath + "/color/getAllColor",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			$('.goods-color').html('');
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
			$('.goods-brand').html('');
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
			$('.goods-category').html('');
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
			$('.goods-size-type').html('');
			for (var i = 0; i < result.length; i++) {
				$('.goods-size-type').append(
						'<option value="' + result[i] + '" >'
								+ result[i] + '</option>');
			}
			$('.selectCombo').comboSelect();
			getSizeByType($("#goods-size-type").val());
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
//根据颜色id获取颜色
function getAllGoodsColorById(colorId,id) {
	$.ajax({
		type : "post",
		url : contextPath + "/color/getAllColor",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			$('#update-goods-color'+id).html('');
			for (var i = 0; i < result.length; i++) {
				if (result[i].id == colorId) {
					$('#update-goods-color'+id).append(
						'<option value="' + result[i].id + '" selected>'
								+ result[i].name + '</option>');
				}else{
					$('#update-goods-color'+id).append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
				}
				
			}
			$('#update-goods-color'+id).comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//根据品牌id获取品牌
function getAllGoodsBrandById(brandId,id) {
	$.ajax({
		type : "post",
		url : contextPath + "/brand/getAllBrand",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			$('#update-goods-brand'+id).html('');
			for (var i = 0; i < result.length; i++) {
				if (result[i].id == brandId) {
					$('#update-goods-brand'+id).append(
						'<option value="' + result[i].id + '" selected>'
								+ result[i].name + '</option>');
				} else {
					$('#update-goods-brand'+id).append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
				}
			}
			$('#update-goods-brand'+id).comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//根据类别id获取第三级类别
function getGoodsThirdCategoryById(categoryId,id) {
	$.ajax({
		type : "post",
		url : contextPath + "/category/getThirdCategory",
		dataType : "json",
		data : {},
		success : function(data) {
			var result = data;
			$('#update-goods-category'+id).html('');
			for (var i = 0; i < result.length; i++) {
				if (result[i].id == categoryId) {
					$('#update-goods-category'+id).append(
						'<option value="' + result[i].id + '" selected>'
								+ result[i].name + '</option>');
				} else {
					$('#update-goods-category'+id).append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
				}
			}
			$('#update-goods-category'+id).comboSelect();
		},
		error : function() {
			console.log("false")
		}
	});
}
//根据尺寸id获取尺寸类型
function getGoodsSizeTypeById(sizeId,id) {
	$.ajax({
		type : "post",
		url : contextPath + "/size/getSizeType",
		dataType : "json",
		data : {},
		success : function(result) {
			var sizeType;
			$.ajax({
				type : "post",
				url : contextPath + "/size/getSize",
				dataType : "json",
				data : {
					"id" : sizeId
				},
				success : function(data) {
					var sizeType = data[0].type;
					$('#update-goods-size-type'+id).html('');
					for (var i = 0; i < result.length; i++) {
						if (sizeType == result[i]) {							
							$('#update-goods-size-type'+id).append('<option value="' + result[i] + '" selected>'
										+ result[i] + '</option>');
						} else {
							$('#update-goods-size-type'+id).append('<option value="' + result[i] + '" >'
										+ result[i] + '</option>');
					}
						}
					$('#update-goods-size-type'+id).comboSelect();
					getSizeByTypeAndId($("#update-goods-size-type"+id).val(),sizeId,id);
				},
				error : function(){
					console.log("false");
				}
			});

			
		},
		error : function() {
			console.log("false")
		}
	});
}
//获取指定类型的尺寸
function getSizeByTypeAndId(type,sizeId,id) {
	$.ajax({
		type : "post",
		url : contextPath + "/size/getSizeByType",
		dataType : "json",
		data : {
			"type" : type
		},
		success : function(data) {
			var result = data;
			$('#update-goods-size'+id).html("");
			for (var i = 0; i < result.length; i++) {
				if (sizeId == result[i].id) {
					$('#update-goods-size'+id).append(
						'<option value="' + result[i].id + '" selected>'
								+ result[i].name + '</option>');
				} else {
					$('#update-goods-size'+id).append(
						'<option value="' + result[i].id + '" >'
								+ result[i].name + '</option>');
				}
			}
			$('#update-goods-size'+id).comboSelect();
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
	//判断详情页有无展开
	var f = $(btnObject).parent().siblings().eq(0).parent().hasClass("shown");
	if(!f){
		$(btnObject).parent().siblings().eq(0).trigger("click");
	}else{
		var table = $(btnObject).parents().eq(0).parents().eq(0).next().find("table");
		var name = table.find("td #update-goods-name").val();
		var style = table.find("td #update-goods-style").val();
		var price = table.find("td #update-goods-price").val();
		var script = table.find("td #update-goods-script").val();
		var colorId = table.find("td #update-goods-color"+id).val();
		var sizeId = table.find("td #update-goods-size"+id).val();
		var brandId = table.find("td #update-goods-brand"+id).val();
		var categoryId = table.find("td #update-goods-category"+id).val();
		$.ajax({
			type : "post",
			url : contextPath + "/goods/update",
			dataType : "json",
			data : {
				"goods.id" : id,
				"goods.name" : name,
				"goods.style" : style,
				"goods.categoryId" : categoryId,
				"goods.brandId" : brandId,
				"goods.sizeId" : sizeId,
				"goods.colorId" : colorId,
				"goods.price" : price == "" ? 0 : price,
				"goods.script" : script
			},
			success : function(data) {
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
	var goodsTable = $('#goods-table')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"aoColumnDefs" : [ {
												"bSearchable" : false,
												"aTargets" : [ 0]
											},
											{
												"bSortable" : false,
												"aTargets" : [ 0,6 ]
											},
										 ],
						"order": [[ 5, "desc" ]],//默认第6列降序排列
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
							"className": 'details-control',
			                "orderable":  false,
			                "data":       null,
			                "defaultContent": ''
						}, {
							data : 'barcode'
						}, {
							data : 'name'
						}, {
							data : 'price'
						}, {
							data : 'script'
						}, {
							data : 'createTime'
						}, {
							data : 'id'
						}, ],
						dom: 'lBfrtip',
					    buttons: [
									{
									 'extend': 'copy',
									 'text': '复制',//定义导出excel按钮的文字
									
									},
									{
									 'extend': 'excel',
									 'text': '导出excel',//定义导出excel按钮的文字
									
									},
									{
										'extend' : 'print',
										'text' : '打印',
										'exportOptions' : {
															modifier: {
																selected: true
															}
														},
										'autoPrint' : false
									}
									],
						"language": {
                			"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
            			},
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							/*$('td:eq(1)', nRow).html(
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
											+ (aData.script==null?'': aData.script) + ">")*/
							$('td:eq(6)', nRow)
									.html(
											'<button class="btn btn-default" onclick="updateGoods('
													+ aData.id
													+ ',this)">更新</button><button class="btn btn-primary" onclick="deleteGoods('
													+ aData.id
													+ ')">删除</button>')
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
						},
					});
// Add event listener for opening and closing details
    $('#goods-table tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = goodsTable.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( goodsTableDetail(row.data()) ).show();
            tr.addClass('shown');
            getAllGoodsColorById(row.data().colorId,row.data().id);
            getAllGoodsBrandById(row.data().brandId,row.data().id);
            getGoodsThirdCategoryById(row.data().categoryId,row.data().id);
            getGoodsSizeTypeById(row.data().sizeId,row.data().id);
        }
    } );
}
/* Formatting function for row details - modify as you need */
function goodsTableDetail ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>商品代码：</td>'+
            '<td><input class="form-control" type="text" disabled value="'+d.barcode+'"></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品名称：</td>'+
            '<td><input class="form-control" id="update-goods-name" type="text" placeholder="商品名称，不能为空" autofocus="autofocus" value="'+d.name+'" /></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品条形码：</td>'+
            '<td><img style="width:120px;" src="'+ contextPath +'/barcode/'+ d.barcode + '.png" /></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品款式：</td>'+
            '<td><input class="form-control" id="update-goods-style" type="text" placeholder="商品款式" value="'+d.style+'"></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品类别：</td>'+
            '<td><select id="update-goods-category'+d.id+'" class="selectCombo form-control  update-goods-category"></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品品牌：</td>'+
            '<td><select id="update-goods-brand'+d.id+'" class="selectCombo form-control  update-goods-brand"></select>'+
            '</td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品尺寸：</td>'+
            '<td>'+
	            '<div class="row">'+
					'<div class="col-lg-6">'+
						'<select id="update-goods-size-type'+d.id+'" class="selectCombo form-control update-goods-size-type" onchange ="getSizeByTypeAndId(this.value,'+d.sizeId+','+d.id+');">'+
						'</select>'+
					'</div>'+
					'<div class="col-lg-6">'+
						'<select id="update-goods-size'+d.id+'" class="selectCombo form-control update-goods-size">'+
						'</select>'+
					'</div>'+
				'</div>'+
            '</td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品颜色：</td>'+
            '<td><select id="update-goods-color'+d.id+'" class="selectCombo form-control  update-goods-color"></select></td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品售价:</td>'+
            '<td>'+
            	'<div class="input-group">'+
                   /* '<span class="input-group-addon">￥</span>'+*/
                    '<input class="form-control " type="number" min="0" id="goods-price" name="goods-price" placeholder="商品售价价，默认为零" value="'+ d.price +'" />'+
                    /*'<span class="input-group-addon">.00</span>'+*/
               ' </div>'+
           '</td>'+
        '</tr>'+
        '<tr>'+
            '<td>商品描述：</td>'+
            '<td><textarea class="form-control" rows="3" id="update-goods-script" name="update-goods-script" placeholder="请输入描述信息，可以为空">'+(d.script==null?'':d.script)+'</textarea></td>'+
        '</tr>'+
    '</table>';
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
						"order": [[ 3, "desc" ]],//默认第4列降序排列
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
	                		"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
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
					"order": [[ 3, "desc" ]],//默认第4列降序排列
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
                		"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
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
					"order": [[ 4, "desc" ]],//默认第5列降序排列
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
                		"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
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


//列出所有的角色，dataTable展示
function getAllRole(){
	$.ajax({
		type : "POST",
		url : contextPath + "/role/getAllRoles",
		datatype : "json",
		success : function(result) {
			roleDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//列出所有的权限，checkbox_zTree展示
function getAllPers(roleId){
	$.ajax({
		type : "POST",
		url : contextPath + "/per/getAllPers",
		datatype : "json",
		success : function(result) {
			getAllPersByRoleId(result,roleId);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}
var CHECKED_PERS_ID = [];//用于记录分配的权限id
//列出所有的权限，checkbox_zTree展示
function getAllPersByRoleId(data,roleId){
	$.ajax({
		type : "POST",
		url : contextPath + "/per/getAllPersByRoleId",
		data :{
			"roleId" : roleId
		},
		datatype : "json",
		success : function(result) {
			CHECKED_PERS_ID = [];//初始化用于记录权限的节点
			for(var i = 0;i<data.length;i++){//选中角色拥有的权限
				for (var j = 0;j<result.length;j++) {
					if(result[j].id==data[i].id){
						data[i].checked=true;
						CHECKED_PERS_ID.push(data[i].id);
					}
				}
				if(data[i].pId==null){//设置菜单展开
					data[i].open=true;
				}
			}
			make_checkbox_zTree(data,roleId);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//删除角色
function deleteRole(id){
	$.ajax({
		type : "POST",
		url : contextPath + "/role/delete",
		data : {
			"id" : id
		},
		datatype : "json",
		success : function(result) {
			alert(result.msg);
			if(result.status){
				getAllRole();
			}
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//获取所有账户信息
function getAllUser(){
	$.ajax({
		type : "POST",
		url : contextPath + "/user/getAllUser",
		datatype : "json",
		success : function(result) {
			userDataTable(result);
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//添加用户
function addUser(){
	var userName = $("#user-manager #user-name").val();
	var password = $("#user-manager #user-password").val();
	var repassword = $("#user-manager #user-repassword").val();
	
	if(userName==""){
		alert("用户名不能为空！");
	}
	else if(password==""){
		alert("密码不能为空！");
	}
	else if (password!=repassword) {
		alert("两次输入密码不相同！")
	}
	else {
			$.ajax({
			type : "POST",
			url : contextPath + "/user/add",
			datatype : "json",
			data  : {
				"user.userName" : userName,
				"user.password" : password
			},
			success : function(result) {
				alert(result.data);
				if (result.status) {
					getAllUser();
					$("#user-accountTable-tab").trigger("click");
				} 
				
			},
			error : function(result) {
				console.log("未知错误！");
			}
		});
	}
}

//添加角色
function addRole (){
	var roleName = $("#pers-manager #role-name").val();
	var roleSign = $("#pers-manager #role-sign").val();
	var description = $("#pers-manager #role-description").val();
	
	if(roleName==""){
		alert("角色名称不能为空！");
	}
	else if(roleSign==""){
		alert("英文名称不能为空！");
	}
	else {
			$.ajax({
			type : "POST",
			url : contextPath + "/role/add",
			datatype : "json",
			data  : {
				"role.roleName" : roleName,
				"role.roleSign" : roleSign,
				"role.description" : description,
			},
			success : function(result) {
				alert(result.msg);
				if (result.status) {
					getAllRole();
					$("#pers-roleTable-tab").trigger("click");
				} 
				
			},
			error : function(result) {
				console.log("未知错误！");
			}
		});
	}
}

//删除用户
function deleteUser(id){
	$.ajax({
		type : "POST",
		url : contextPath + "/user/delete",
		datatype : "json",
		data  : {
			"id" : id
		},
		success : function(result) {
			alert(result.msg);
			if (result.status) {
				getAllUser();
			} 
			
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//根据id获取用户信息
function getUserById(id){
	$.ajax({
		type : "POST",
		url : contextPath + "/user/getUserById",
		datatype : "json",
		data  : {
			"id" : id
		},
		success : function(result) {
			if(result.length>0){
				$("#userModel-user-name").val(result[0].userName);
				$("#userModel-user-password").val(result[0].password);
				$("#userModel-user-id").val(id);
				allRoles(result[0].roleName);
				function allRoles(role){
					$.ajax({
						type : "POST",
						url : contextPath + "/role/getAllRoles",
						datatype : "json",
						success : function(result) {
							console.log(result)
							$("#userModel-user-role").html("");
							$("#userModel-user-role").append('<option selected value>无</option>');
							for (var i =0;i< result.length;i++) {
								if (role == result[i].roleName) {
									$("#userModel-user-role").append('<option selected value="'+result[i].id+'">'+result[i].roleName)+'</option>';
								} else {
									$("#userModel-user-role").append('<option value="'+result[i].id+'">'+result[i].roleName)+'</option>';
								}
							}
							$(".role-select").comboSelect();
						},
						error : function(result) {
							console.log("未知错误！");
						}
					});
				}
				
			}
			
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}

//更新用户信息
function updateUser(){
	var id =$("#userModel-user-id").val();
	var userName = $("#userModel-user-name").val();
	var password = $("#userModel-user-password").val();
	var roleId = $("#userModel-user-role").val();

	if(password==""){
		alert("密码不能为空!");
	}else{
		$.ajax({
			type : "POST",
			url : contextPath + "/user/update",
			datatype : "json",
			data  : {
				"user.id" : id,
				"user.userName":userName,
				"user.password":password,
				"roleId":roleId
			},
			success : function(result) {
				alert(result.msg);
				if (result.status) {
					getAllUser();
					$("#userModel button.close").trigger("click");
				} 
				
			},
			error : function(result) {
				console.log("未知错误！");
			}
		});
	}
}