<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="house_info">
				<h2>${house.location } ${house.layout } ${house.price }</h2>
			</div>

			<hr size="10px">

			<div class="house_show">
				<div class="row">
					<div class="col-lg-6">
						<img alt="" src="${house.imgPath }" width="400px">
					</div>
					<div class="col-lg-5 col-lg-offset-1">
						<h1 style="color: #FF0000">${house.price}元/月</h1>
						<div class="desc">面积 : ${house.size}</div>
						<div class="desc">户型 : ${house.layout}</div>
						<div class="desc">楼层 : ${house.floor}</div>
						<div class="desc">小区 : ${house.location}</div>
						<div class="desc">发布时间 : ${house.createTime}</div>
						<hr>
						<div class="row">
							<div class="col-lg-3" style="padding-top: 15px">
								<img alt="" src="${house.user.headImgPath }" width="70px">
							</div>
							<div class="col-lg-6">
								<div class="desc">联系人 : ${house.user.nikename}</div>
								<div class="desc">联系方式 : ${house.user.telephone}</div>
							</div>	
						</div>
					</div>
				</div>

			</div>

			<hr size="10px">

			<div class="box_pa">
				<a href="${pageContext.request.contextPath }/addQuestion">添加问题</a>
				<div class="questions">
					<c:if test="${questionWithReply != null }">
						<c:forEach items="${questionWithReply }" var="questionItem">
							<div class="row">
								<div class="col-lg-2">
									<img alt="" src="${questionItem.key.user.headImgPath }" class="headImg">
								</div>
								<div class="col-lg-2">
									<h4>
										${questionItem.key.user.nikename} 
									</h4>
										${questionItem.key.createTime }
								</div>
								<div class="italk">
									<h4> ${questionItem.key.title }</h4>
									<div>${questionItem.key.content }</div>
								</div>
							</div>
							
							
							<c:if test="${questionItem.value != null }">
								
									<c:forEach items="${questionItem.value }" var="reply">
										<div class="row reply">	
											<div class="col-lg-offset-1">
												<div class="col-lg-1">
													<img alt="" src="${reply.user.headImgPath }" class="headImg">
												</div>
												<div class="col-lg-9 replyContent italk">
													${reply.user.nikename } : ${reply.content }
												</div>
											</div>
										</div>	
									</c:forEach>
									
							</c:if>
							<div class="row">
								<div class="col-lg-10">
									<form action="${pageContext.request.contextPath}/addReply" class="addReply" method="post">
										<div class="form-group">
											<input type="hidden" value="${questionItem.key.id }"
												class="questionId"> 
											<input class="form-control content"
												name="content" type="text" placeholder="说点什么">
										</div>
										<button type="submit" class="btn btn-default submit">提交</button>	
									</form>
								</div>
							</div>
							<hr size="4px" color="#333">
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<c:import url="commen/footer.jsp"></c:import>

	<script type="text/javascript">
	
		$(function(){
			$(".submit").click(function(){
				var user = "${sessionScope.user}";
				if(user == ""){
					window.location.href = "${pageContext.request.contextPath}/login";
				}else if(user != ""){
					//提交数据
					var questionId = $(this).parent().find(".questionId").val();
					var content = $(this).parent().find(".content").val();
					
					var url = $(".addReply").attr("action");
					var args = {"questionId":questionId, "content":content, "date":new Date()};
					$.post(url, args, function(data){
						console.log(data);
					});					
				}
				return false;
			});
		});
	
	</script>

</body>
</html>