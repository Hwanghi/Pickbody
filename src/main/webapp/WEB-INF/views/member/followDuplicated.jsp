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
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="row">
						<div class="col">
						<p class="fs-3">해당 그룹에 이미 팔로우 되어있는 회원입니다.</p>
						</div>
					</div>					
					<div class="row">
						<div class="col d-grid">
							<a href="../member/myFollowPage.do?member_no=${memberUser.member_no }">
							<button type="button" class="btn btn-info">팔로우 목록 페이지로</button>
							</a>
						</div>
					</div>					
				</div>
				<div class="col-3"></div>			
			</div>
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>