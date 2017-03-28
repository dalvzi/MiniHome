<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<div class="container">

		<div class="col-lg-5 col-lg-offset-3">
			<form action="validate" method="POST">
				<div class="form-group">
					<label for="username">用户名: </label> <input
						class="form-control" id="username"
						name="username" placeholder="用户名">
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

	
	<script type="text/javascript" src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/res/scripts/layer/layer.js"></script>
	
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
						console.log("hahahhh");
						parent.layer.closeAll();
						$(location).attr('href', 'zufang');
					}if(data == "error"){
						$(".error font:eq(0)").remove();
						$("<font color=#FF5722>账号密码不匹配</font>").appendTo(".error");
					}
				});
				return false;
			});
		});
	
	</script>


</body>
</html>