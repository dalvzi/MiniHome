<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>注册</title>

<link href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<header>
		<div class="container">
			<div class="row text-right login">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span> <span><a
					href="login" class="login" id="login">登录</a></span>/<span><a href="register"
					class="register">注册</a></span>
			</div>
			<div class="row menu">
				
				<nav class="navbar">
					<span class="logo">
						<a href="${pageContext.request.contextPath }">
							<img alt="" src="${pageContext.request.contextPath }/res/images/logo.jpg">
						</a>
					</span>
				
					<ul class="nav nav-pills">
						<li role="presentation"><a
							href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
						<li role="presentation"><a href="zufang">租房</a></li>
						<li role="presentation"><a href="serach">搜索</a></li>
						<li role="presentation"><a href="mine ">个人中心</a></li>
						<li></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
		<div class="container register_body">
			<div class="row">
				<div class="col-lg-7 register_logo">
					<img alt="" src="${pageContext.request.contextPath }/res/images/register_logo.png">
				</div>
				
				<div class="col-lg-5">
					<div class="col-lg-7">
						<form:form action="saveUser" method="post" modelAttribute="user">
							<div class="form-group usernameGroup">
								<form:input path="username" class="form-control" id="username"
									placeholder="用户名" />
							</div>
							<div class="form-group">
								<form:input path="password" type="password" class="form-control password"
									id="password" placeholder="密码" />
							</div>
							<div class="form-group passwordGroup">
								<input type="password" class="form-control password" id="password2"
									placeholder="再输入一次密码">
							</div>
							<div class="form-group">
								<form:input path="email" type="email" class="form-control"
									id="email" placeholder="email" />
							</div>
							<div class="form-group">
								<form:input path="telephone" class="form-control" id="telephone"
									placeholder="手机" />
							</div>
	
							<button type="submit" class="btn btn-default">注册</button>
						</form:form>
					</div>	
				</div>
			</div>
		</div>
		
	<footer>
	
	</footer>	
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/layer/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/slides/responsiveslides.js"></script>
		
	<script type="text/javascript">
	
		
	
		$(function(){
			//ajax检查用户名是否可用
			$("#username").blur(function(){
				var username = $(this).val();
				username = $.trim(username);
				var url = "${pageContext.request.contextPath}/validateRegisterUsername";
				var args = {"username":username, date:new Date()};
				$.post(url, args, function(data){
					if(data == "0"){
						$(".usernameGroup font:eq(0)").remove();
						$("<font color=#5FB878>用户名可用</font>").appendTo(".usernameGroup");
					}else if(data == username){
						$(".usernameGroup font:eq(0)").remove();
						$("<font color=#FF5722>"+data+"已被注册</font>").appendTo(".usernameGroup");
					}
				});				
			});
		
			//检查两次输入的密码是否一致
			$(".password").blur(function(){
				var password = $("#password").val();
				var password2 = $("#password2").val();
				password = $.trim(password);
				password2 = $.trim(password2);
				if((password == "" && password2 == "") || password2 == ""){
					$(".passwordGroup font:eq(0)").remove();
					return;
				}
				if(password != password2){
					$(".passwordGroup font:eq(0)").remove();
					$("<font color=#FF5722>密码不匹配</font>").appendTo(".passwordGroup");
				}
				if(password == password2){
					$(".passwordGroup font:eq(0)").remove();
					$("<font color=#5FB878>密码匹配</font>").appendTo(".passwordGroup");
				}
			});
		});
	</script>	
</body>
</html>