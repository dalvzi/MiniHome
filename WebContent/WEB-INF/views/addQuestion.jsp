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

	<c:if test="${sessionScope.user == null}">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<div class="container">

		<div class="col-lg-5 col-lg-offset-3">
			<form action="saveQuestion" method="POST">
				<div class="form-group">
					<label for="title">标题: </label> <input class="form-control"
						id="title" name="title" placeholder="标题">
				</div>
				<div class="form-group">
					<label for="content">内容: </label> 
					<textarea class="form-control" rows="3" id="content"
						name="content" placeholder="内容"></textarea>
				</div>
				<div class="error"></div>
				<a class="btn btn-default submit" href="#" role="button">添加</a>
				<button type="submit" class="btn btn-info">提交</button>
			</form>
		</div>

	</div>

</body>
</html>