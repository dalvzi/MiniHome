<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css"
	rel="stylesheet" type="text/css">
	
<meta name="viewport" content="width=device-width, initial-scale=1">
	
</head>
<body>
	
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
	
	<c:if test="${page == null || page.numberOfElements == 0 }">没有任何记录</c:if>
	
	<div class="container">
		<c:if test="${page != null || page.numberOfElements != 0 }">
			<c:forEach items="${page.content }" var="house">
				<div class="row item">
					<div class="col-lg-10 col-lg-offset-1">
						<div class="col-lg-4">
							<a href="item/${house.id }">
								<img alt="网络延迟" src="${house.imgPath }" width="170px" height="130px">
							</a>
						</div>
						<div class="col-lg-3 collg-offset-1 text-center">
							
							<a href="item/${house.id }">
								${house.price }
								${house.size }
								${house.floor }
							</a>
						</div>
					</div>
				</div>
			</c:forEach>	
		</c:if>	
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>