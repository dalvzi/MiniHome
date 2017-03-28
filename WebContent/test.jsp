<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		File: <input type="file" name="file">
		Desc: <input type="text" name="desc">
		<input type="submit" value="submit">
	</form>
	<a href="file"></a>


	<img alt="" src="E:/upload/14900960673345296c2bb53ec1daa.jpg" width="150px" >

	<h4>这是一个测试页面</h4>
	<a href="test" class="test"></a>


	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/res/scripts/layer/layer.js"></script>

	<script type="text/javascript">
		$(function(){
			$(".test").click(function(){
				alert("hjgfhjgf");
			});
		});
	</script>

</body>
</html>