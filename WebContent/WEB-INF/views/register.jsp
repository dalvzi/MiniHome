<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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

	<c:import url="commen/header.jsp"></c:import>

	<c:set value="${pageContext.request.contextPath }/saveUser" var="url"></c:set>
	<c:if test="${employee.id != null }">
		<c:set value="${pageContext.request.contextPath }/updateUserWithParam/${user.id}" var="url"></c:set>
	</c:if>

	<div class="container register_body">
		<div class="row">
			<div class="col-lg-7 register_logo">
				<img alt=""
					src="${pageContext.request.contextPath }/res/images/register_logo.png">
			</div>

			<div class="col-lg-5">
				<div class="col-lg-7">
					<form:form action="${url }" method="post" modelAttribute="user">

						<c:if test="${user.id != null }">
							<form:hidden path="id" />
							<input type="hidden" name="_method" value="PUT" />
						</c:if>

						<div class="form-group">
							<form:input path="nikename" class="form-control" id="nikename"
								placeholder="昵称" />
						</div>
						<div class="form-group usernameGroup">
							<form:input path="username" class="form-control" id="username"
								placeholder="用户名" />
						</div>
						<div class="form-group">
							<form:input path="password" type="password"
								class="form-control password" id="password" placeholder="密码" />
						</div>
						<div class="form-group passwordGroup">
							<input type="password" class="form-control password"
								id="password2" placeholder="再输入一次密码">
						</div>
						<div class="form-group">
							<form:input path="email" type="email" class="form-control"
								id="email" placeholder="email" />
						</div>
						<div class="form-group">
							<form:input path="telephone" class="form-control" id="telephone"
								placeholder="手机" />
						</div>
						<c:if test="${user == null }">
							<button type="submit" class="btn btn-default">注册</button>
						</c:if>
						<c:if test="${user != null }">
							<button type="submit" class="btn btn-default">提交</button>
						</c:if>
							
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<footer>
	
	</footer>	
	
	<c:import url="commen/footer.jsp"></c:import>
			
	<script type="text/javascript">
	
		$(function(){
			
			var user = "${user}";
			if(user != ""){
				$("title").html("用户修改");
			}
			
			//ajax检查用户名是否可用
			$("#username").blur(function(){
				var username = $(this).val();
				username = $.trim(username);
				var url = "${pageContext.request.contextPath}/validateRegisterUsername";
				var args = {"account":account, date:new Date()};
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