//验证类别名称是否存在
function validateCategoryName(name){
	$.ajax({
		type:"post",
		url:contextPath + "/category/validateName",
		datatype:"json",
		data:{
			"category.name":name
		},
		success:function(result){
			var msg = result.msg;
			if(result.status){
				$("#validate-cate-name").hide().html('<span class="label label-danger">'+msg+'</span>').show(300);
			}else{
				$("#validate-cate-name").hide().html('<span class="label label-success">'+msg+'</span>').show(300);
			}
		},
		error:function(result){
			 console.log("未知错误！");
		}
	});
}