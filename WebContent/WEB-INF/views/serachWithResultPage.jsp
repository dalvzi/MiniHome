<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css"
	rel="stylesheet" type="text/css">
	
<meta name="viewport" content="width=device-width, initial-scale=1">
	
</head>
<body>
	
	<c:import url="commen/header.jsp"></c:import>
	
	<c:if test="${criteriaHouses == null}">没有任何记录</c:if>

	<div class="container">
		<c:if test="${criteriaHouses != null}">
			<c:forEach items="${criteriaHouses}" var="house">
				<div class="row item">
					<div class="col-xs-10 col-xs-offset-1">
						<div class="col-xs-3">
							<a href="item/${house.id }"> <img alt="网络延迟"
								src="${house.imgPath }" width="170px" class="img-rounded">
							</a>
						</div>
						
						<div class="col-xs-6 collg-offset-1 desc">
							<span>
								<h4>
									<a href="item/${house.id }"> ${house.location }
										${house.layout } ${house.price}元 </a>
								</h4>
							</span>
							
							<span>
								${house.location } 
								${house.layout }
								${house.size } 平
							</span>
						</div>
						<div class="col-xs-3 text-center desc">
							<h2><font color="#E4393C">${house.price }元</font></h2>
						</div>
						
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<c:import url="commen/footer.jsp"></c:import>


</body>
</html>