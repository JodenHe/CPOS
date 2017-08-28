
var ROLE_ID = 0;

/**
* 生成树形菜单
**/
function make_zTree(data){
	var zNodes=data;
	var curMenu = null, zTree_Menu = null;
	var setting = {
		view: {
			showLine: false,
			showIcon: false,
			selectedMulti: false,
			dblClickExpand: false,
			addDiyDom: addDiyDom
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeClick: beforeClick
		}
	};

	var treeObj = $("#treeDemo");
	$.fn.zTree.init(treeObj, setting, zNodes);
	zTree_Menu = $.fn.zTree.getZTreeObj("treeDemo");
     // curMenu = zTree_Menu.getNodes()[0].children[0].children[0];
     if(zTree_Menu.getNodes()!=null&&zTree_Menu.getNodes()[0].children!=null&&zTree_Menu.getNodes()[0].children[0].children!=null){
     	curMenu = zTree_Menu.getNodes()[0].children[0].children[0];
     }
     zTree_Menu.selectNode(curMenu);

     treeObj.hover(function () {
     	if (!treeObj.hasClass("showIcon")) {
     		treeObj.addClass("showIcon");
     	}
     }, function() {
     	treeObj.removeClass("showIcon");
     });
 }

 function addDiyDom(treeId, treeNode) {
 	var spaceWidth = 5;
 	var switchObj = $("#" + treeNode.tId + "_switch"),
 	icoObj = $("#" + treeNode.tId + "_ico");
 	switchObj.remove();
 	icoObj.before(switchObj);

 	if (treeNode.level > 1) {
 		var spaceStr = "<span style='display: inline-block;width:" + (spaceWidth * treeNode.level)+ "px'></span>";
 		switchObj.before(spaceStr);
 	}
 }

 function beforeClick(treeId, treeNode) {
 	if (treeNode.level == 0 ) {
 		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
 		zTree.expandNode(treeNode);
 		return false;
 	}
 	return true;
 }

/**
* 生成带有checkbox的树形菜单
**/
function make_checkbox_zTree(data,roleId){
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: onCheck
		}
	};
	var zNodes =data;
	$.fn.zTree.init($("#per-checkbox-zTree"), setting, zNodes);

	
	ROLE_ID = roleId;//传递角色id给添加映射函数
	function onCheck(e, treeId, treeNode){//选择复选框时操作
		//选择子节点时，往CHECKED_PERS_ID添加数据
		if(treeNode.checked&&!treeNode.isParent){
			CHECKED_PERS_ID.push(treeNode.id)	
		}
		//去除子节点时，往CHECKED_PERS_ID移除数据
		if(!treeNode.checked&&!treeNode.isParent){
			CHECKED_PERS_ID=del(CHECKED_PERS_ID,treeNode.id)	
		}
		//选择父节点时，默认选中所有子节点
		if(treeNode.checked&&treeNode.isParent){
			for(var i=0;i<treeNode.children.length;i++){
				if( CHECKED_PERS_ID.includes(treeNode.children[i].id) ){
				 CHECKED_PERS_ID=del(CHECKED_PERS_ID,treeNode.children[i].id);	
				}
				CHECKED_PERS_ID.push(treeNode.children[i].id);
			}
		}
		//去除父节点时，默认移除所有子节点
		if(!treeNode.checked&&treeNode.isParent){
			for(var i=0;i<treeNode.children.length;i++){
				CHECKED_PERS_ID=del(CHECKED_PERS_ID,treeNode.children[i].id)	
			}
		}
	}
	//移除数组中的某个元素
	function del(list,v){
		var index = list.indexOf(v);
		if(index>-1){
			list.splice(index,1);
		}
		return list;
	}
}	

//添加角色权限映射
function addRolePermission(){
	var listPerId = "";
	var list = CHECKED_PERS_ID;
	var roleId = ROLE_ID;
	
	for(var i=0;i<list.length;i++){
		listPerId = listPerId + list[i]+","
	}

	$.ajax({
		type : "POST",
		url : contextPath + "/rolePer/add",
		data : {
			"listPerId" : listPerId,
			"roleId" : roleId
		},
		datatype : "json",
		success : function(result) {
			alert(result.msg);
			if (result.status) {
				$("#perModel button.close").trigger("click");//关闭谈床
			}
			
		},
		error : function(result) {
			console.log("未知错误！");
		}
	});
}