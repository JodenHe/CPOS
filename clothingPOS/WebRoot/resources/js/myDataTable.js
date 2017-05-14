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

//商品的dataTable
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


//品牌的dataTable
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
					});
}


//颜色的dataTable
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
				});
}


//尺码的dataTable
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
				});
}

//角色的dataTable
function getAllRole(data) {
	$('#pers-roleTable-dataTable')
			.DataTable(
					{
						destroy : true,
						"bAutoWidth" : false,
						"bSort" : true,
						"aoColumnDefs" : [ {
							"bSearchable" : false,
							"aTargets" : [4]
						},  
						 {
							"bSortable" : false,
							"aTargets" : [0, 4 ]
						},
						],
						"order": [[ 0, "desc" ]],//默认第1列降序排列
						data : data,
						// 使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
						columns : [ {
							data : 'id'
						}, {
							data : 'roleName'
						}, {
							data : 'roleSign'
						}, {
							data : 'description'
						}, {
							data : 'id'
						}, ],
						"language": {
	                		"url": contextPath +"/resources/DataTables-1.10.13/i18n/Chinese.json"
	            		},
						"fnCreatedRow" : function(nRow, aData, iDataIndex) {
							
						},
						"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
								iDisplayIndexFull) {
							
						},
					});
}