<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<div style="width:1200px; margin:0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			<div class="row mt-3">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="row mt-2">
						<div class="col">
						<i class="bi bi-envelope-fill pe-2"></i>제목 : ${map.mVo.message_title }
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						<i class="bi bi-person-circle pe-2"></i>받은사람 : <a href="../member/answerMessagePage.do?receive_no=${map.mVo.recieve_no}"> ${map.vo.member_nick } </a>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						<i class="bi bi-calendar-check pe-2"></i>보낸날짜 : <fmt:formatDate value="${map.mVo.message_sendDate }" pattern="yy년 MM월 dd일 hh:mm" />
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
						<i class="bi bi-chat-left-text-fill pe-2"></i>내용
						</div>
					</div>
					<div class="row mt-1">
						<div class="col border border-secondary px-2 py-2">
						${map.mVo.message_content }
						</div>
					</div>
					<div class="row mt-2">
						<div class="col-6 ps-0 d-grid">
							<input type="button" class="btn btn-light" value="삭제" onClick="location.href='../member/updateSendMessageIsDeleted.do?message_no=${map.mVo.message_no}'">
						</div>
						<div class="col-6 pe-0 d-grid">
							<input type="button" class="btn" style="background-color:#F2B705" value="목록" onClick="location.href='../member/sendMessagePage.do'">
						</div>
					</div>
				</div>
				<div class="col-3"></div>			
			</div>
		</div>
	</div>
	<jsp:include page="../common/global_footer.jsp"></jsp:include>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>