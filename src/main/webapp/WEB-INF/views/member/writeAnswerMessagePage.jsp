<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="row mt-3 mb-5">
				<div class="col-3"></div>
				<div class="col-6">
					<form action="../member/writeMessageProcess.do" method="post">
						<div class="col-list-group px-2 py-2 px-2 py-2">
							<input type="hidden" name="recieve_no" value="${vo.member_no }">						
							<div class="row mt-2">
								<div class="col">받는사람 : ${vo.member_nick }</div>
							</div>
							<div class="row mt-2"> 
								<div class="col d-grid"><%--쪽지제목 --%>
									<input type="text" class="p-2 flex-fill bd-highlight" name="message_title" placeholder="제목">
								</div>						
							</div>
							<div class="row mt-1" > <%--쪽지내용 --%>
								<div class="col d-grid">
									<textarea name="message_content" style="height: 300px"></textarea>
									<input type="hidden" name="sender_no" value="${memberUser.member_no }">
									<input type="hidden" name="message_isRead" value="N">
									<input type="hidden" name="message_senderDelete" value="N">
									<input type="hidden" name="message_receiveDelete" value="N">
								</div>
							</div>
							<div class="row mt-2">
								<div class="cole d-grid">
									<input type="submit" class="btn" style="background-color:#F2B705" value="전송하기">
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-3"></div>			
			</div>
		</div>
	</div>
	<jsp:include page="../common/global_footer.jsp"></jsp:include>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</body>
</html>