$(function() {
		$('.selectCombo').comboSelect();	
		selectAllCategory();
		goods();
		getAllColor();
		getAllStyle();	
		test();

	});

function test(){
				$.ajax({
				type : "POST", // 提交方式
				url : contextPath+'/category/selectAllCategory',// 路径
				data : {},// 数据，这里使用的是Json格式进行传输
				success : function(data) {// 返回数据根据结果进行相应的处理
					make_zTree(data);
				}
			});
			}
	
	function selectAllCategory(){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/category/selectAllCategory",
		  	dataType:"json",
		  	data:{},
		  	success:function(result){
		  		for(var i=0;i<result.length;i++){
		  			$('#categorys-content').append('<tr><td>'+result[i].id+'</td><td>'+(result[i].pId==null?"无":result[i].pId)+'</td><td>'+result[i].name+'</td><td>'+result[i].script+'</td><td>'+result[i].createTime+'</td><td><button class="btn btn-default btn-lg" onclick="deleteCategory('+result[i].id+')">删除</button></td></tr>');
		  			$('#categorys-content-input').append('<tr><td>'+result[i].id+'</td><td>'+(result[i].pId==null?"无":result[i].pId)+'</td><td><input type="text" value="'+result[i].name+'" /></td><td><input type="text" value="'+result[i].script+'" /></td><td>'+result[i].createTime+'</td><td><button class="btn btn-default btn-lg" onclick="updateCategory('+result[i].id+',this)">更新</button></td></tr>');
		  			$('#categorys-content-delete-update').append('<tr><td>'+result[i].id+'</td><td>'+(result[i].pId==null?"无":result[i].pId)+'</td><td><input type="text" value="'+result[i].name+'" /></td><td><input type="text" value="'+result[i].script+'" /></td><td>'+result[i].createTime+'</td><td><button class="btn btn-default" onclick="updateCategory('+result[i].id+',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteCategory('+result[i].id+')">删除</button></td></tr>');
		  			$('.pId').append('<option value="'+result[i].id+'" >'+result[i].name+'</option>');
			  		}
		  		$('.selectCombo').comboSelect();
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
		
	}
	function getAllColor(){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/color/getAllColor",
		  	dataType:"json",
		  	data:{},
		  	success:function(data){
		  		var result = data.data;
		  		for(var i=0;i<result.length;i++){
		  			$('.goods-color').append('<option value="'+result[i].id+'" >'+result[i].name+'</option>');
			  		}
		  		$('.selectCombo').comboSelect();
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	function getAllStyle(){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/style/getAllStyle",
		  	dataType:"json",
		  	data:{},
		  	success:function(data){
		  		var result = data.data;
		  		for(var i=0;i<result.length;i++){
		  			$('.goods-style').append('<option value="'+result[i].id+'" >'+result[i].name+'</option>');
			  		}
		  		$('.selectCombo').comboSelect();
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	
	function addgoods(){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/goods/add",
		  	dataType:"json",
		  	data:{
		  		name:$('#goods-name').val(),
		  		styleId:$('#goods-style').val(),
		  		colorId:$('#goods-color').val(),
		  		originalPrice:$('#goods-originalPrice').val()==""?0:$('#goods-originalPrice').val(),
		  		price:$('#goods-price').val()==""?0:$('#goods-price').val(),
		  		script:$('#goods-script').val()
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
					alert(data.data);
					 window.location.href=contextPath+"/test";
				} else {
					alert(data.data);
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	function addCategory(){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/category/insert",
		  	dataType:"json",
		  	data:{
		  		name:$('#name').val(),
		  		pId:$('#pId').val(),
		  		script:$('#script').val()
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
					alert(data.data);
					 window.location.href=contextPath+"/test";
				} else {
					alert(data.data);
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	
	function deleteGoods(id){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/goods/delete",
		  	dataType:"json",
		  	data:{
		  		id:id
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
		  			alert("商品删除成功！");
		  			window.location.href=contextPath+"/test";
				} else {
					alert("删除失败，未知错误！");
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	function deleteCategory(id){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/category/getChildren",
		  	dataType:"json",
		  	data:{
		  		id:id
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (!data.status) {
		  			deleteCategory2(id)
				} else {
					alert("该类别有子类别无法删除！");
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	
	function deleteCategory2(id){
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/category/delete",
		  	dataType:"json",
		  	data:{
		  		id:id
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
					alert("成功删除！");
					 window.location.href=contextPath+"/test";
				} else {
					alert("未知错误!");
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	function updateGoods(id,btnObject){
		console.log(btnObject);
		var name = $(btnObject).parents().eq(0).siblings().eq(4).children().val();
		var originalPrice = $(btnObject).parents().eq(0).siblings().eq(5).children().val();
		var price = $(btnObject).parents().eq(0).siblings().eq(6).children().val();
		var script = $(btnObject).parents().eq(0).siblings().eq(7).children().val();
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/goods/update",
		  	dataType:"json",
		  	data:{
		  		id : id,
		  		name : name,
		  		originalPrice : originalPrice==""?0:originalPrice,
		  		price : price==""?0:price,
		  		script : script
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
					alert(data.data);
					 window.location.href=contextPath+"/test";
				} else {
					alert(data.data);
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	function updateCategory(id,btnObject){
		console.log(btnObject);
		var name = $(btnObject).parents().eq(0).siblings().eq(2).children().val();
		var script = $(btnObject).parents().eq(0).siblings().eq(3).children().val();
		$.ajax({
		  	type:"post",
		  	url:contextPath+"/category/update",
		  	dataType:"json",
		  	data:{
		  		id : id,
		  		name : name,
		  		script : script
		  	},
		  	success:function(data){
		  		console.log(data)
		  		if (data.status) {
					alert(data.data);
					 window.location.href=contextPath+"/test";
				} else {
					alert(data.data);
				}
		  	},
			error:function(){
		  		console.log("false")
		  	}
		});
	}
	
	function goods(){
		$.ajax({
			type : "POST", 
			url : contextPath+"/goods/getAllGoods",
			datatype : "json",
			success : function(result) {
				goodsDataTable(result);
			},
			error : function(result) {
				console.log("未知错误！");
			}
		});
	}
	
	function goodsDataTable(data){
		console.log(data)
		$('#goods-table').DataTable( {
			destroy: true,
			"bAutoWidth": false,
			"bSort": false,
			"aoColumnDefs": [
				{ "bSearchable": false, "aTargets": [0,1,2,5,6,7,8] },
			],
			data: data,
			//使用对象数组，一定要配置columns，告诉 DataTables 每列对应的属性
			columns: [
			          { data: 'id' },
			          { data: 'styleId' },
			          { data: 'colorId' },
			          { data: 'barcode' },
			          { data: 'name' },
			          { data: 'originalPrice' },
			          { data: 'price' },
			          { data: 'script' },
			          { data: 'createTime' },
			          { data: 'id' },
			          ],
			          "oLanguage" : {
			        	  "sProcessing" : "正在加载中......",
			        	  "sLengthMenu" : "每页显示 _MENU_ 条记录",
			        	  "sZeroRecords" : "对不起，查询不到相关数据！",
			        	  'sSearch': '检索:',
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
			          "fnCreatedRow": function (nRow, aData, iDataIndex) {
			        	 /*  var op = "<button class='btn btn-primary del' onclick='deletePro(this)' >删除</button><button class='btn btn-success' onclick='detailPro(this)' >详情</button><button class='btn btn-danger' onclick='savePro(this) ' >保存</button><button class='btn btn-defalut' onclick='locate_id(this)'  >定位</button>"
			        		  $('td:eq(4)',nRow).html(op);
			        	  var temp = $('td:eq(2)',nRow).html()
			        	  var temp1 = $('td:eq(3)',nRow).html()
			        	  $('td:eq(2)',nRow).html("<input name='projectLocation' type='text' value="+temp+">");
			        	  $('td:eq(3)',nRow).html("<input name='remark' type='text' value="+temp1+">") */
			        	  $('td:eq(3)',nRow).html("<img style='width:120px;' src='"+contextPath+"/barcode/"+aData.barcode+".png'>") 
			        	  $('td:eq(4)',nRow).html("<input name='goodsName' type='text' value="+aData.name+">") 
			        	  $('td:eq(5)',nRow).html("<input name='goodsOriginalPrice' type='number' min='0' value="+aData.originalPrice+">") 
			        	  $('td:eq(6)',nRow).html("<input name='goodsPrice' type='number' min='0' value="+aData.price+">") 
			        	  $('td:eq(7)',nRow).html("<input name='goodsScript' type='text' value="+aData.script+">") 
			        	  $('td:eq(9)',nRow).html('<button class="btn btn-default" onclick="updateGoods('+aData.id+',this)">更新</button>&nbsp;&nbsp;<button class="btn btn-primary" onclick="deleteGoods('+aData.id+')">删除</button>')
			          },
			          "fnRowCallback" : function(nRow, aaData, iDisplayIndex,iDisplayIndexFull) {

			          },
		} )
	}