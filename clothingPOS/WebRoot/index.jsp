<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/combo.select.css">
	
	<!-- jQuery -->
	<script src="${contextPath}/resources/sbAdmin/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${contextPath}/resources/sbAdmin/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.combo.select.js"></script>
	
	<script type="text/javascript">
	$(function() {
		$('#showparents').comboSelect()
	});
	function t(){
		
	}
	</script>
	<script type="text/javascript">
		var contextPath = '${contextPath}';
	</script>
  </head>
  
  <body>
  <div><a href="${contextPath}/login">登录界面</a></div>
  <div><a href="${contextPath}/admin">系统管理员界面</a></div>
  <div><a href="${contextPath}/cashier">收银员界面</a></div>
  <div><a href="${contextPath}/warehouse">仓库管理员界面</a></div>
  
  <div>
  	<h3>添加类别</h3>
  	<form action="${contextPath}/category/insert" method="post">
  		类别名称：<input type="text" name="name"/><br>
  		 <label>父类别 <select id="showparents" class="form-control" style="width:150px;">
				        	<option value="方法一" >方法一</option>
				        	<option value="方法2" >方法2</option>
				        </select></label>
  		备注：<input type="text" name="script"/>
  		<button type="submit">添加</button>
  	</form>
  	
  </div>
  <div>
  	<h3>列出所有类别</h3>
  	
  </div>
  <div>
  	<h3>删除所有类别</h3>
  	
  </div>
  <div>
  	<h3>更新类别</h3>
  	
  </div>
  </body>
</html>
