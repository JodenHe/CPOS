<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<!-- 搜索框 -->
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="搜索...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!-- /input-group -->
			</li>
				<li><a onclick="dashboardFun();"><i class="fa fa-dashboard fa-fw"></i>报表分析</a></li>
					<li><a><i class="fa fa-users fa-fw"></i>
						用户管理<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a onclick="perFun();">权限管理</a></li>
							<!-- <li><a href="#">用户信息</a></li> -->
							<li><a onclick="accountFun();" ">账号管理</a></li>
						</ul> <!-- /.nav-second-level --></li>
				
					<!-- <li>
						<a href="#"><i class="fa fa-group fa-fw"></i> 会员管理</a>
					</li> -->
					<li><a href="#"><i class="fa fa-shopping-cart fa-fw"></i>
								销售管理<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
									<li><a href="${request.contextPath}/cashier">销售</a></li>
									<li><a href="${request.contextPath}/cashier">退货</a></li>
							</ul> <!-- /.nav-second-level --></li>
					<li onclick="goodsFun();">
						<a><i class="glyphicon glyphicon-barcode"></i> 商品管理</a>
					</li>
					<!-- <li><a href="#"><i class="fa fa-truck fa-fw"></i> 库存管理<span
							class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
									<li><a href="#">查库存</a></li>
									<li><a href="#">入库</a></li>
									<li><a href="#">出库</a></li>
							</ul> /.nav-second-level</li> -->
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->