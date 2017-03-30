<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css" rel="stylesheet" type="text/css">
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
								<li><a href="${pageContext.request.contextPath }/zufang">我要看房</a></li>
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
		<div class="col-lg-10 col-lg-offset-1">
			<div class="house_info">
				<h2>
					${house.location }
					${house.layout }
					${house.price }
				</h2>
			</div>
			<div class="house_show">
				<div class="row">
					<div class="col-lg-6">
						<img alt="" src="${house.imgPath }" width="400px"> 
					</div>
					<div class="col-lg-5 col-lg-offset-1">
						<h1 style="color:#FF0000">${house.price}元/月</h1>
						<div class="desc">面积 : ${house.size}</div>
						<div class="desc">户型 : ${house.layout}</div>
						<div class="desc">楼层 : ${house.floor}</div>
						<div class="desc">小区 : ${house.location}</div>
						<div class="desc">发布时间 : ${house.createTime}</div>
						<hr>
						<div class="desc">联系人 : ${house.user.username}</div>
						<div class="desc">联系方式 : ${house.user.telephone}</div>
					</div>
				</div>
				
			</div>
	
			<a href="${pageContext.request.contextPath }/addQuestion">添加问题</a>	
			<div class="questions">
				<c:forEach items="${questions }" var="question">
					<h4>${question.title }</h4>
					<h6>${question.content }</h6>
				</c:forEach>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/bootstrap/js/bootstrap.min.js"></script>


</body>
</html>