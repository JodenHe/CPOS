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