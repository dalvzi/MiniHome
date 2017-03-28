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

	<div class="container">
	
		兄弟，成功了
		${house.id }
		${house.price }
		<img alt="" src="${house.imgPath }" width="300px">
		${house.user }
		<a href="${pageContext.request.contextPath }/addQuestion">添加问题</a>
		
		<c:forEach items="${questions }" var="question">
			<h4>${question.title }</h4>
			<h6>${question.content }</h6>
		</c:forEach>
		
	</div>

</body>
</html>