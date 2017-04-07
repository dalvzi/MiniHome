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
	
	<c:if test="${page == null || page.numberOfElements == 0 }">没有任何记录</c:if>


	<div class="container">
		<c:if test="${page != null || page.numberOfElements != 0 }">
			<c:forEach items="${page.content }" var="house">
				<c:if test="${house.onSell == 1 }">
					<div class="row item box_pa">
						<div class="col-lg-3 col-lg-offset-1 col-xs-10 col-xs-offset-1">
							<a href="item/${house.id }"> <img alt="网络延迟"
								src="${house.imgPath }" class="img-rounded img-responsive">
							</a>
						</div>
	
						<div class="col-lg-4 col-lg-offset-1 desc hidden-xs">
							<span>
								<h3>
									<a href="item/${house.id }"> ${house.location }
										${house.layout } ${house.price}元 </a>
								</h3>
							</span> <span> ${house.location } ${house.layout } ${house.size }
								平 </span>
						</div>
						<div class="col-lg-3 text-center desc hidden-xs">
							<h2>
								<font color="#E4393C">${house.price }元</font>
							</h2>
						</div>
					</div>
					<div class="hidden-lg row">
						<div class="col-xs-6 col-xs-offset-3">
							<h4>
								<a href="item/${house.id }">${house.location } ${house.price }</a>
							</h4>
						</div>
					</div>
					<hr>
				</c:if>
			</c:forEach>

			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${page.number + 1 != 1 }">
						<li><a href="?pageNo=${page.number + 1 - 1 }" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${page.number + 1 != 1 }">
						<c:if test="${page.number + 1 != 2 }">
							<li><a href="?pageNo=${page.number + 1 - 2 }">${page.number + 1 - 2 }</a></li>
						</c:if>
						<li><a href="?pageNo=${page.number + 1 - 1 }">${page.number + 1 - 1 }</a></li>
					</c:if>
					<li class="active"><a href="#">${page.number + 1 } <span class="sr-only">(current)</span></a></li>
					<c:if test="${page.number + 1 + 1 <= page.totalPages }">
						<li><a href="?pageNo=${page.number + 1 + 1 }">${page.number + 1 + 1 }</a></li>
						<c:if test="${page.number + 1 + 2 <= page.totalPages }">
							<li><a href="?pageNo=${page.number + 1 + 2 }">${page.number + 1 + 2 }</a></li>
						</c:if>
					</c:if>
					<c:if test="${page.number + 1 == 1 && page.number + 1 + 3 <= page.totalPages } ">
						<li><a href="?pageNo=${page.number + 1 + 3 }">${page.number + 1 + 3 }</a></li>
						<c:if test="${page.number + 1 + 4 <= page.totalPages }">
							<li><a href="?pageNo=${page.number + 1 + 4 }">${page.number + 1 + 4 }</a></li>					
						</c:if>
					</c:if>
					<c:if test="${page.number + 1 == 2 && page.number + 1 + 3 <= page.totalPages }">
						<li><a href="?pageNo=${page.number + 1 + 3 }">${page.number + 1 + 3 }</a></li>
					</c:if>
					<c:if test="${page.totalPages != page.number + 1 }">
					<li><a href="?pageNo=${page.number + 1 + 1 }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
				</ul>
				共 ${page.totalElements } 条记录 		
			</nav>

		</c:if>
	</div>
	
	<c:import url="commen/footer.jsp"></c:import>

	

</body>
</html>