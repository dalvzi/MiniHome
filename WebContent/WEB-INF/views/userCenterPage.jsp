<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${sessionScope.user == null }">
		<c:redirect url="login"></c:redirect>
	</c:if>

	${user.username }
	${user.username }
	${user.username }
	
	<c:if test="${houses != null }">
		<c:forEach items="${houses }" var="house">
			<div>${house.price } ${house.size } ${house.imgPath }</div>
		</c:forEach>
	</c:if>
	
	
</body>
</html>