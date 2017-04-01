<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>个人中心</title>

<link
	href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css"
	rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">	

</head>
<body>

	<c:if test="${sessionScope.user == null }">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<c:import url="commen/header.jsp"></c:import>

	<div class="container">
		<div class="user">
		
			${sessionScope.user.username}
			${sessionScope.user.password}
			${sessionScope.user.telephone}
			${sessionScope.user.email}	
			<img alt="" src="${sessionScope.user.headImgPath }">	
			
			<a href="${pageContext.request.contextPath }/updateUser">更新用户信息</a>
		</div>
		<div class="col-lg-10 col-lg-offset-1 houses">
			<c:if test="${houses != null }">
				<table class="table table-hover table-responsive">
					<tr>
						<th>位置</th>
						<th>户型</th>
						<th>价钱</th>
						<th>大小</th>
						<th>楼层</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${houses }" var="house">
						<tr>
							<td>${house.location }</td>
							<td>${house.layout }</td>
							<td>${house.price }</td>
							<td>${house.size }</td>
							<td>${house.floor }</td>
							<td>
								<c:if test="${house.onSell == 1 }">
									在租
								</c:if>
								<c:if test="${house.onSell == 0 }">
									已经出租
								</c:if>
							</td>
							<td>
								<a href="" class="btn btn-info" role="button">更新</a>
								<a href="" class="btn btn-warning" role="button">下架</a>
								<a href="" class="btn btn-danger" role="button">删除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
	
	<c:import url="commen/footer.jsp"></c:import>
	
</body>
</html>