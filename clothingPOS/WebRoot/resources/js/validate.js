//公有方法
function commonValidate(result){
	var msg = result.msg;
			$(".validate-result").html(
				'<div class="alert alert-warning" id="myAlert">'+
					'<a href="#" class="close" data-dismiss="alert">'+
						'&times;'+
					'</a>'+
					'<strong id="validate-status">警告！</strong>&nbsp;&nbsp;<span id="validate-msg"></span>'+
				'</div>'
			);
			if(result.status){
				$("#myAlert #validate-status").html("警告！");
				$("#myAlert #validate-msg").html(msg);
				
				$("#myAlert").hide().show(300);
			}else{
				$("#myAlert #validate-status").html("成功！");
				$("#myAlert #validate-msg").html(msg);
				
				$("#myAlert").hide().show(300);
			}
			/*setTimeout("$('#myAlert').alert('close');", 5000 );*/
}

//验证类别名称是否存在
function validateCategoryName(name){
	$.ajax({
		type:"post",
		url:contextPath + "/category/validateName",
		datatype:"json",
		data:{
			"name":name
		},
		success:function(result){
			commonValidate(result);
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}

//验证商品名称是否存在
function validateGoodsName(name){
	$.ajax({
		type:"post",
		url:contextPath + "/goods/validateName",
		datatype:"json",
		data:{
			"name":name
		},
		success:function(result){
			commonValidate(result);
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}

//验证品牌名称是否存在
function validateBrandName(name){
	$.ajax({
		type:"post",
		url:contextPath + "/brand/validateName",
		datatype:"json",
		data:{
			"name":name
		},
		success:function(result){
			commonValidate(result);
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}

//验证颜色名称是否存在
function validateColorName(name){
	$.ajax({
		type:"post",
		url:contextPath + "/color/validateName",
		datatype:"json",
		data:{
			"name":name
		},
		success:function(result){
			commonValidate(result);
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}