<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>搜索房源</title>

<link href="${pageContext.request.contextPath }/res/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/res/css/style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	
	<c:import url="commen/header.jsp"></c:import>
	
	<div class="container">
		<div class="col-lg-5 col-lg-offset-3">
			<form action="serachWithParam" method="post" enctype="multipart/form-data">
			
				<div class="form-group">
					<label for="location">位置(小区名)</label> 
					<input class="form-control" name="location" id="location" placeholder="位置">
				</div>
				<div class="form-group">
					<label for="minPrice">最低价格: (每月)</label> 
					<input class="form-control" name="minPrice" id="minPrice" placeholder="最低价格">
					--
					<input class="form-control" name="maxPrice" id="maxPrice" placeholder="最高价格">
				</div>
				<div class="form-group">
					<label for="minSize">房屋大小: </label> 
					<input class="form-control" name="minSize" id="minSize" placeholder="最小面积">
					--
					<input class="form-control" name="maxSize" id="maxSize" placeholder="最大面积">
				</div>

				<button type="submit" class="btn btn-default">Submit</button>
			
			</form>
		</div>	
	</div>

	<c:import url="commen/footer.jsp"></c:import>

</body>
</html>