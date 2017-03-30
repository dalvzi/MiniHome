<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>个人中心</title>

<link
	href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css"
	rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">	

</head>
<body>

	<c:if test="${sessionScope.user == null }">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<header>
		<div class="container">
			<div class="row text-right login">
				<c:if test="${sessionScope.user == null }">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span><a
						href="login" class="login" id="login">登录</a></span>/<span><a href="register"
						class="register">注册</a></span>
				</c:if>
				<c:if test="${sessionScope.user != null }">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span><font
						class="login" id="login">欢迎你,${sessionScope.user.username }</font></span>/<span><a href="logout"
						class="register">登出</a></span>
				</c:if>
			</div>
			<div class="row menu">

				
				<nav class="navbar">
					<span class="logo"> <a
						href="${pageContext.request.contextPath }"> <img alt=""
							src="${pageContext.request.contextPath }/res/images/logo.jpg">
					</a>
					</span>
					<ul class="nav nav-pills">
						<li role="presentation"><a
							href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
						<li role="presentation" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">
								租房
								<span class="caret"> </span>		
							</a>
							<ul class="dropdown-menu">
								<li><a href="registerHouse">我有房源</a></li>
								<li><a href="zufang">我要看房</a></li>
							</ul>
						</li>
						<li role="presentation"><a href="serach">搜索</a></li>
						<li role="presentation"><a href="userCenter">个人中心</a></li>
						<li></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>

	<div class="container">
		<div class="user">
			${sessionScope.user.username}
			${sessionScope.user.password}
			${sessionScope.user.telephone}
			${sessionScope.user.email}		
		</div>
		<div class="col-lg-10 col-lg-offset-1 houses">
			<c:if test="${houses != null }">
				<table class="table table-hover table-responsive">
					<tr>
						<th>位置</th>
						<th>户型</th>
						<th>价钱</th>
						<th>大小</th>
						<th>楼层</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${houses }" var="house">
						<tr>
							<td>${house.location }</td>
							<td>${house.layout }</td>
							<td>${house.price }</td>
							<td>${house.size }</td>
							<td>${house.floor }</td>
							<td>
								<c:if test="${house.onSell == 1 }">
									在租
								</c:if>
								<c:if test="${house.omsell == 0 }">
									已经出租
								</c:if>
							</td>
							<td>
								<a href="" class="btn btn-info" role="button">更新</a>
								<a href="" class="btn btn-warning" role="button">下架</a>
								<a href="" class="btn btn-danger" role="button">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/layer/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>