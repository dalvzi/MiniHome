<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>登录</title>

<link href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">


</head>
<body>

	<c:import url="commen/header.jsp"></c:import>

	<div class="container">

		<div class="col-lg-5 col-lg-offset-3">
			<form action="validate" method="POST">
				<div class="form-group">
					<label for="username">账　号: </label> <input
						class="form-control" id="username"
						name="username" placeholder="账号">
				</div>
				<div class="form-group">
					<label for="password">密　码: </label> <input
						type="password" class="form-control" id="password"
						name="password" placeholder="密码">
				</div>
				<div class="error"></div>
				<a class="btn btn-default submit" href="#" role="button">登录</a>
			</form>
		</div>
	</div>

	<c:import url="commen/footer.jsp"></c:import>	
	
	<script type="text/javascript">
	
		$(function(){
			$(".submit").click(function(){
				var username = $.trim($("#username").val());
				var password = $.trim($("#password").val());
				var url = $("form").attr("action");

				var args = {"username":username, "password":password, "date":new Date()};
				$.post(url, args,function(data){
					if(data == "success"){
						//关闭弹窗
						parent.layer.closeAll();
						$(location).attr('href', 'zufang');
					}if(data == "error"){
						$(".error font:eq(0)").remove();
						$("<font color=#FF5722>用户名密码不匹配</font>").appendTo(".error");
					}
				});
				return false;
			});
		});
	
	</script>


</body>
</html>