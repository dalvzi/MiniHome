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
		<div class="user row box_pa">

			${sessionScope.user.password}
			${sessionScope.user.telephone} ${sessionScope.user.email}

			<div class="img_show img_show1 col-lg-2 col-lg-offset-2">
				<form action="saveHeadImg" method="post"
					enctype="multipart/form-data" class="fileForm">
					<a href="" class="openFileInput"> <img
						src="${sessionScope.user.headImgPath }" width="200px"
						class="headImg" onclick="openInputFile()">
					</a> <input type="hidden" name="id" value="${sessionScope.user.id }">
					<input type="file" name="file" id="inputFile" style="display: none">
					<input type="submit" style="display: none" class="submit" />
				</form>
			</div>
			<div class="col-lg-8 ">
				<div class="row">
					${sessionScope.user.username} 
					${sessionScope.user.nikename }
				</div>
				<div class="row">
					${sessionScope.user.telephone }
					${sessionScope.user.email }
				</div>
				<div class="row">
					<div class="col-lg-offset-8">
						<a href="${pageContext.request.contextPath }/updateUser/${sessionScope.user.id}">更新用户信息</a>
					</div>
				</div>
			</div>

		</div>
		
		<hr>
		
		<div class="col-lg-10 col-lg-offset-1 houses box_pa">
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
							<td><c:if test="${house.onSell == 1 }">
									在租
								</c:if> <c:if test="${house.onSell == 0 }">
									已经出租
								</c:if></td>
							<td><a
								href="${pageContext.request.contextPath }/updateHouse/${house.id}"
								class="btn btn-info" role="button">更新</a> 
								<a href="${pageContext.request.contextPath }/houseUpOrDown/${house.id}"
								class="btn btn-warning" role="button">
									<c:if test="${house.onSell == 1 }">
									下架
									</c:if> 
									<c:if test="${house.onSell == 0 }">
										上架
									</c:if>
								</a> 
							
								<a href="${pageContext.request.contextPath }/deleteHouse/${house.id}"
								class="btn btn-danger delete" role="button" >删除</a>
								<input type="hidden" value="${house.id }"/>
							</td>	
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
	</div>
	

	<form action="123" method="POST" id="_form">
		<input type="hidden" id="_method" name="_method" value="DELETE"/>
	</form>

	<c:import url="commen/footer.jsp"></c:import>

	<script type="text/javascript">
	
		function openInputFile(){
			document.getElementById("inputFile").click(); 
		}
	
		$(function(){
			//点击头像更换
			$(".openFileInput").click(function(){
				
				var imgPath = $("#inputFile").val();
				
				$(".submit").css("display","block");
				
				$(".submit").click(function(){
					console.log(imgPath);
					$(".submit").css("display","none");
				});
				
				return false;
			});
		
			//删除房源，RESTFUL风格
			$(".delete").click(function(){
				var label = $(this).next(":hidden").val();
				var flag = confirm("确定要删除 " + label + " 号房源的信息吗?");
				if(flag){
					var url = $(this).attr("href");
					
					$("#_form").attr("action", url);
					$("#_form").submit();
				}
				
				return false;
			});			
		});
	
	</script>

</body>
</html>