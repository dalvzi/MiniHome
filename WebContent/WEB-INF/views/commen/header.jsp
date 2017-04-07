<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<div class="container">
		<div class="row text-right login">
			<c:if test="${sessionScope.user == null }">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<span><a href="${pageContext.request.contextPath }/login" class="login" id="login">登录</a></span>/<span><a
					href="${pageContext.request.contextPath }/register" class="register">注册</a></span>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				<span><font class="login" id="login">欢迎你,${sessionScope.user.nikename }</font></span>/<span><a
					href="${pageContext.request.contextPath }/logout" class="register">登出</a></span>
			</c:if>
		</div>
		<div class="row menu">
			<nav class="navbar col-xs-offset-1">
				<span class="logo"> <a
					href="${pageContext.request.contextPath }"> <img alt=""
						src="${pageContext.request.contextPath }/res/images/logo.jpg" class="img-responsive"></a>
				</span>
				<ul class="nav nav-pills">
					<li role="presentation"><a
						href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
					<li role="presentation" class="dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"> 租房 <span
							class="caret"> </span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath }/registerHouse">我有房源</a></li>
							<li><a href="${pageContext.request.contextPath }/zufang">我要看房</a></li>
						</ul></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/serach">搜索</a></li>
					<li role="presentation"><a href="${pageContext.request.contextPath }/userCenter">个人中心</a></li>
					<li></li>
				</ul>
			</nav>
		</div>
	</div>
</header>