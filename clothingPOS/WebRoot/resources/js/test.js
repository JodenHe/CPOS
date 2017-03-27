//获得所有颜色
  	function getAllColor(){
  	alert("test1");
  	$.ajax({
  	type:"post",
  	url:contextPath+"/color/getAllColor",
  	dataType:"json",
  	data:{},
  	success:function(result){
  	alert(result.data.length);
/*   	var str = "<select id='selectBox'> ";
  	for(var i=0;i<result.data.length;i++){
  		str = str+"<option>"+result.data[i].name+"</option>";
  	}
  	str = str+"</select>";
  	$("#showAllColor").html(str);
  		 */
  	var str = "";
  	for(var i=0;i<result.data.length;i++){
  		str = str +result.data[i].name+"<button id='colorId' onclick='deleteColor("+result.data[i].id+")'>删除</button><br/>"
  	}
  	  	$("#showAllColor").html(str);
  	},
  	
  	error:function(result){
  		alert("sb");
  	},
  	});
  	}
//增加颜色
  	function addColor(){

	  	var name = $("#name").val();
	  	var script = $("#script").val();
	  		$.ajax({
	  			type:"post",
	  			url:contextPath+"/color/add",
	  			dataType:"json",
	  			data:{"name":name,"script":script},
	  			success:function(result){
	  				alert(result.status);
	  			},
	  			error:function(result){
	  				alert("sb");
	  			}
	  		});
	  	}
//删除一个颜色  	
  	function deleteColor(id){
  	alert(id);
  	$.ajax({
  	type:"post",
  	url:contextPath+"/color/delete",
  	dataType:"json",
  	data:{"id":id},
  	success:function(result){
  	if(result.status)
  	alert("已成功删除");
  	else
  	alert("删除失败");
  	},
  	error:function(result){
  		alert("sb");
  	}
  	});
  	}
//增加一个尺码
  	function addSize(){

  		$.ajax({
  			type:"post",
  			url:contextPath+"/style/add",
  			dataType:"json",
  			data:{"name":$("#sizeName").val(),"script":$("#sizeScript").val(),"sizeId":1,"brandId":2,"categoryId":1},
  		success:function(result){
  			alert(result.status);
  		},
  		error:function(result){
  			alert("sb");
  		}
  		});
  	}
  	//新增店铺
  	function addShop(){
  		$.ajax({
  			type:"post",
  			url:contextPath+"/shop/add",
  			dataType:"json",
  			data:{
  				"shop.name":$("#shopName").val(),"shop.address":$("#shopAddress").val(),
  				"shop.telephone":$("#shopPhone").val(),"shop.manager":$("#shopManager").val(),
  				"shop.script":$("#shopScript").val()
  			},
  		success:function(result){
  			if(result.status)
  				alert(result.msg);
  			else
  				alert(result.msg);
  		},
  		error:function(result){
  			alert("sb");
  		}
  		});
  	}
  	function getAllShop(){

  		$.ajax({
  			type:"post",
  			url:contextPath+"/shop/allShop",
  			dataType:"json",
  			data:{},
  			success:function(result){
  				var str= "";
  				alert(result[0].name);
  				for(var i=0;i<result.length;i++)
  					str = str +result[i].name+"<button id='shopId' onclick='deleteShop("+result[i].id+")'>删除</button><br/>"
  				$("#showAllShop").html(str);
  			},
  			error:function(result){
  				alert("sb");
  			}
  		});
  	}
  	function updataShop(){
  		$.ajax({
  			type:"post",
  			url:contextPath+"/shop/updata",
  			dataType:"json",
  			data:{
  				"id":1,
  				"name":$("#shopName").val(),"address":$("#shopAddress").val(),
  				"telephone":$("#shopPhone").val(),"manager":$("#shopManager").val(),
  				"script":$("#shopScript").val()
  			},
  		success:function(result){
  			if(result.status)
  				alert(result.msg);
  			else
  				alert(result.msg);
  		},
  		error:function(result){
  			alert("sb");
  		}
  		});
  	}
  	function getShopBykeyWord(){
  		$.ajax({
  			type:"post",
  			url:contextPath+"/shop/getShopBykeyWord",
  			dataType:"json",
  			data:{
  				"keyWord":$("#keyWord").val()
  			},
  			success:function(result){
  				var str= "";
  				for(var i=0;i<result.data.length;i++)
  					str = str +result.data[i].name+"<button id='shopId' onclick='deleteShop("+result.data[i].id+")'>删除</button><br/>"
  				$("#showAllShop").html(str);
  			},
  			error:function(result){
  				alert("sb");
  			}
  		});
  	}