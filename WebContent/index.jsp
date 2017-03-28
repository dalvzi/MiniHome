<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>恋床网</title>

<link
	href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/res/slides/responsiveslides.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/slides/slides.css"
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
	

	<div class="container">
		<div class="xxx">
			<ul class="rslides" id="dowebok">
				<li><img
					src="${pageContext.request.contextPath }/res/slides/images/1.jpg"
					alt=""></li>
				<li><img
					src="${pageContext.request.contextPath }/res/slides/images/2.jpg"
					alt=""></li>
				<li><img
					src="${pageContext.request.contextPath }/res/slides/images/3.jpg"
					alt=""></li>
			</ul>
		</div>
	</div>
	<a href="testJsons" class="testJsons">测试json集合</a>
	<a href="testJson" class="testJson">测试json String</a>

	<footer>
		<div class="container-fluid">
			<a href="">加入我们</a> <a href="">友情链接</a>
		</div>
	</footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/layer/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/slides/responsiveslides.js"></script>


	<script>

		//轮播
		$(function() {
			$('#dowebok').responsiveSlides();
		});
		//轮播参数
		$(function() {
			$(".rslides").responsiveSlides({
				nav : false,
				pause : true,
				maxwidth : "1200px",
			});
		});
		$(function() {
			$(".xxx").hover(function() {
				/* Stuff to do when the mouse enters the element */
				$(".rslides_nav").fadeIn();

			}, function() {
				/* Stuff to do when the mouse leaves the element */
				$(".rslides_nav").fadeOut();
			});

		})

		$(function(){
			//弹出一个登录层
			$("a#login").on('click', function() {
				layer.open({
					type : 2,
					title : '登录',
					maxmin : true,
					shadeClose : false, //点击遮罩关闭层
					area : [ '300px', '420px' ],
					content : 'login'
				});
				return false;
			});
		});
		
		
	</script>

</body>
</html>