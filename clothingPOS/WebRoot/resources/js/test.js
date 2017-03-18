
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