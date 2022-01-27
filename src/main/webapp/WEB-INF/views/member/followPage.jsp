<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

	<div style="width:1200px; margin:0 auto">
		<div class="container-fluid">
			<div class="row"><!-- 네비 바..row -->
				<div class="col">
					<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
				</div>			
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<p class="fs-2">팔로우 페이지</p>
				</div>
			<div class="row mt-3">
				<div class="col-4"></div>	
				<div class="col-4">
					<div class="row">
						<form action="../member/followProcess.do" method="get">
							<div class="col list-group px-2 py-2 d-grid">
								<c:forEach var="list" items="${groupList }">
									<li class="list-group-item">
										<input type="radio" class="form-check-input me-1" value="${list.group_no }" name="group_no"> ${list.group_name } <br>
									</li>
								</c:forEach>
							</div>
							<div class="col mt-2 d-grid gap-2">
								<input type="text" name="member_nick" placeholder="팔로우할 회원 닉네임">
								<input type="submit" class="btn btn-primary" value="확인">	
							</div>
						</form>
					</div>
				</div>		
				<div class="col-4"></div>		
			</div>
			
			
		</div>
	</div>
	
		
		
			
			
			
		
		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>		
</body>
</html>