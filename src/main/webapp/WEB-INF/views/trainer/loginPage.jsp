<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PICK BODY LOGIN</title>
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
<script src="../resources/js/sidebar_member.js?version=2.2.0"></script>
</head>
<body>
	<div style="width:1200px; margin: 0 auto;">
		<div class="container-fluid mb-5">
			<div class="row my-3 text-center font-blue bold"
						style="text-shadow: 4px 0px #000000;">
				<div class="col text-center">
					<a href="../board/mainPage.do">
						<span style="font-size: 4rem;">PICK BODY</span>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col-4">
					<form action="./loginProcess.do" method="post">
					<div class="row"><!-- 로고 row -->
						<div class="col">
							<img class="img-fluid" src="../resources/img/pt.jpg">
						</div>
					</div>
					<div class="row mt-5"><!-- ID row -->
						<div class="col">
							<input class="form-control" type="text" name="trainer_id" placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="row mt-2"><!-- password row -->
						<div class="col">
							<input class="form-control" type="password" name="trainer_pw" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					<div class="row mt-3"><!-- 로그인 버튼 row -->
						<div class="col d-grid">
							<input class="btn btn-primary" type="submit" value="로그인">
						</div>
					</div>
					<div class="row mt-2"><!-- 회원가입...row -->
						<div class="col d-grid">
							<a class="btn btn-outline-secondary" href="./joinTrainerPage.do">Pick Body 파트너 맺기</a>
						</div>
					</div>
					</form>
				</div>
				<div class="col"></div>
			</div>
		</div>
		<jsp:include page="../common/global_footer.jsp"></jsp:include>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>