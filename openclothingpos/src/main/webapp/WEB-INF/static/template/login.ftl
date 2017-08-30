<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title>服装POS系统/登录</title>
		<#include "common/header.ftl">
		<style type="text/css">
	        .panel-body .checkbox{
	            display: inline-block;
	        }
	        .panel-body .filed{
	            display: inline-block;
	            margin: 10px 0;
	            float: right;
	        }
	        .panel-body .filed a{
	            text-decoration: none;
	            cursor: pointer !important;
	        }
	        .panel-body .filed a:hover{
	            color: #00b2f3;
	        }
	    </style>
	</head>
	<body>
		<div id="wrapper">
			<!-- 导航栏 -->
			<!-- Navigation -->
			<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
				<#include "common/navbar/navbar-header.ftl">
			</nav>
			
			<div class="container">
				<div class="row">
		            <div class="col-md-4 col-md-offset-4">
		                <div class="login-panel panel panel-default">
		                    <div class="panel-heading">
		                        <h3 class="panel-title"><i class="fa fa-user">&nbsp;&nbsp;</i>用户登录</h3>
		                    </div>
		                    <div class="panel-body">
		                        <form role="form" action="${request.contextPath}/login" method="post">
		                            <fieldset>
		                                <div class="form-group">
		                                    <input class="form-control" placeholder="请输入用户名" name="user.userName" type="" autofocus>
		                                </div>
		                                <div class="form-group">
		                                    <input class="form-control" placeholder="密码不少于6位" name="user.password" type="password" value="">
		                                </div>
		                                <div class="form-group errorInfo" style="color:red;">
		                                	${errorInfo!} 
		                                </div>
		                                <div class="checkbox">
		                                    <label>
		                                        <input name="remember" type="checkbox" value="Remember Me">记住我
		                                    </label>
		                                </div>
		                                <div class="filed">
		                                    <a href="#">忘记密码?</a>
		                                </div>
		                                <!-- Change this to a button or input when using this as a form -->
		                                <button type="submit" class="btn btn-lg btn-success btn-block">登录</button>
		                            </fieldset>
		                        </form>
		                    </div>
		                </div>
		            </div>
		        </div>
			</div>
		</div>
		<#include "common/script.ftl">
	</body>
</html>