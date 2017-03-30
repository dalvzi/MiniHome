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
	
	<div class="container">
		<div class="col-lg-5 col-lg-offset-3">
			<form action="saveHouse" method="post" enctype="multipart/form-data">
			
				<div class="form-group">
					<label for="location">位置(小区名)</label> 
					<input class="form-control" name="location" id="location" placeholder="位置">
				</div>
				<div class="form-group">
					<label for="layout">房屋布局</label> 
					<input class="form-control" name="layout" id="layout" placeholder="房屋布局">
				</div>
				<div class="form-group">
					<label for="price">价格: (每月)</label> 
					<input class="form-control" name="price" id="price" placeholder="价格">
				</div>
				<div class="form-group">
					<label for="size">房屋大小: </label> 
					<input class="form-control" name="size" id="size" placeholder="房屋大小">
				</div>
				<div class="form-group">
					<label for="floor">楼层: </label> 
					<input class="form-control" name="floor" id="floor" placeholder="楼层">
				</div>
				<div class="form-group">
					<label for="houseDesc">额外描述：</label> 
					<textarea class="form-control" rows="3" id="houseDesc"
						name="houseDesc" placeholder="描述"></textarea>
				</div>			
				<div class="form-group">
					<label for="imgPath">房屋照片: 尽量上传方形图片</label> 
					<input type="file" name="imgPath" id="imgPath">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			
			</form>
		</div>	
	</div>

</body>
</html>