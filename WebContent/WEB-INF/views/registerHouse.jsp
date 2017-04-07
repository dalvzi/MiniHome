<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>注册房源</title>

<link href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

	<c:if test="${sessionScope.user == null }">
		<c:redirect url="login"></c:redirect>
	</c:if>
	
	<c:import url="commen/header.jsp"></c:import>
	
	<c:set value="${pageContext.request.contextPath }/saveHouse" var="url"></c:set>
	<c:set value="multipart/form-data" var="encode"></c:set>
	<c:if test="${house.id != null }">
		<c:set value="${pageContext.request.contextPath }/updateHouseWithParam/${house.id }" var="url"></c:set>
		<c:set value="application/x-www-form-urlencoded" var="encode"></c:set>
	</c:if>
	
	<div class="container">
		<div class="col-lg-5 col-lg-offset-3 col-xs-8 col-xs-offset-2">
				
				<form:form action="${url }" method="POST" modelAttribute="house" enctype="${encode }">
			
				<c:if test="${house.id != null }">
					<form:hidden path="id"/>
					<input type="hidden" name="_method" value="PUT" />
				</c:if>
			
				<div class="form-group">
					<label for="location">位置(小区名)</label> 
					<form:input path="location" class="form-control" id="location" placeholder="位置"/>
				</div>
				<div class="form-group">
					<label for="layout">房屋布局</label> 
					<form:input path="layout" class="form-control" id="layout" placeholder="房屋布局"/>
				</div>
				<div class="form-group">
					<label for="price">价格: (每月)</label> 
					<form:input path="price" class="form-control" id="price" placeholder="价格"/>
				</div>
				<div class="form-group">
					<label for="size">房屋大小: </label> 
					<form:input path="size" class="form-control" id="size" placeholder="房屋大小"/>
				</div>
				<div class="form-group">
					<label for="floor">楼层: </label> 
					<form:input path="floor" class="form-control" id="floor" placeholder="楼层"/>
				</div>
				<div class="form-group">
					<label for="houseDesc">额外描述：</label> 
					<form:textarea path="houseDesc" class="form-control" rows="3" id="houseDesc" placeholder="描述"/>	
				</div>		
				<c:if test="${house.id == null }">
					<div class="form-group">
						<label for="imgPath">房屋照片: 尽量上传方形图片</label> 
						<input type="file" name="imgPath" id="imgPath">
					</div>
				</c:if>	
				<button type="submit" class="btn btn-default">Submit</button>
			
			</form:form>
		</div>	
	</div>

	<c:import url="commen/footer.jsp"></c:import>
	
	<script type="text/javascript">
		$(function(){
			var houseId = "${house.id}";
			if(houseId != ""){
				$("title").html("修改房源信息");
			}
		});
	</script>

</body>
</html>