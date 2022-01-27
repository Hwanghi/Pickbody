<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<p class="fs-2">그룹만들기페이지</p>
				</div>
			<div class="row mt-3">
				<div class="col-4"></div>
				<div class="col-4 d-grid">
					<form action="../member/createFollowGroupProcess.do" method="get">
						<input type="text" name="group_name" placeholder="새그룹 이름">
						<input type="hidden" name="member_no" value="${memberUser.member_no }">
						<input type="submit" class="btn btn-success" value="만들기">
					</form>				
				</div>
				<div class="col-4"></div>	
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>