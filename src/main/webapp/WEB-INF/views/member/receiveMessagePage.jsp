<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.7"></script>
</head>
<body>

<script>

</script>

	<div style="width:1200px; margin:0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			
			<div class="row mt-3">
				<div class="col-4">
					<div class="row text-start">
						<div class="col ms-3 fs-4">
							<a href="../member/receiveMessagePage.do">
								<i class="bi bi-envelope-fill pe-3"></i>받은쪽지함
							</a>
						</div>
					</div>
					<div class="row text-start mt-1">
						<div class="col ms-3 fs-4">
							<a href="../member/sendMessagePage.do">
								<i class="bi bi-envelope pe-3"></i>보낸쪽지함
							</a>
						</div>
					</div>
				</div>
				<div class="col-8">
					<div class="row">
						<div class="col">
							<table class="table text-center">
							  <thead>
							    <tr>
							      <th scope="col-1">NO</th>
							      <th scope="col-2">보낸사람</th>
							      <th scope="col-4">제목</th>
							      <th scope="col-4">받은날짜</th>
							      <th scope="col-1"></th>
							    </tr>
							  </thead>
							  <tbody>
							  	<c:forEach var="list" items="${list }">
								    <tr>
								      <td>${list.vo.message_no }</td>
								      <td>${list.mVo.member_nick }</td>
								      <td><a href="../member/recieveMessageDetailPage.do?message_no=${list.vo.message_no}">
											${list.vo.message_title }</a></td>
								      <td><fmt:formatDate value="${list.vo.message_sendDate }" pattern="yy년 MM월 dd일 hh:mm" /></td>
								      <td>
								      	<a href="../member/updateReceiveMessageIsDeleted.do?message_no=${list.vo.message_no}">
									 	<button type="button" class="btn-close" aria-label="Close"></button></a>
									 </td>
								    </tr>
								</c:forEach>
							  </tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4"></div>
						<div class="col-4 d-grid text-end">
							<a href="../member/writeMessagePage.do">
							<button type="button" class="btn" style="background-color:#F2B705">쪽지쓰기</button></a>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>
	<jsp:include page="../common/global_footer.jsp"></jsp:include>		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>