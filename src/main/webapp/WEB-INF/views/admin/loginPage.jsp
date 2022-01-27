<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script>
function doSubmit() {
	//js 핵심 : DOM 제어...
	//element 접근...

	//alert("테스트!!");

	var frm1 = document.getElementById("frm1"); //접근 핵심...

	//id가 입력되지 않았을때...
	var id = document.getElementById("id");
	if (id.value == "") {
		alert("아이디를 입력하셔야 됩니다.");
		id.focus();
		return;
	}

	//pw가 입력되지 않았을때...
	var pw = document.getElementById("pw");
	if (pw.value == "") {
		alert("비밀번호를 입력하셔야 됩니다.");
		pw.focus();
		return;
	}


	frm1.submit();
}
</script>

</head>
<body style="background-color:#F2F2F2;">
	<div style="width:1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row mt-2"  style="height:75vh;">
				<div class="col-4"></div>
				<div class="col">
					<div class="row mt-5"><!-- 로고 row -->
						<div class="col text-center">
							<img class="img-fluid" src="../resources/img/pickbody_logo.png">
						</div>
					</div>
					<form id = "frm1" action="./loginProcess.do" method="post">
					<div class="row mt-4"><!-- ID row -->
						<div class="col">
							<input id="id" class="form-control" type="text" name="admin_id" placeholder="아이디를 입력하세요">
						</div>
					</div>
					<div class="row mt-2"><!-- password row -->
						<div class="col">
							<input id="pw" class="form-control" type="password" name="admin_pw" placeholder="비밀번호를 입력하세요">
						</div>
					</div>
					<c:if test="${!empty loginFail }">
						<div class="row mt-1"">
							<div class="col text-center">
								<p class="text-danger">아이디 혹은 비밀번호를 확인 해 주세요.</p>
							</div>
						</div>
					
					</c:if>
					<div class="row mt-3"><!-- 로그인 버튼 row -->
						<div class="col d-grid">
							<button type="button" class="btn btn-dark" onclick="doSubmit()">로그인</button>
						</div>
					</div>
					</form>
					<div class="row mt-1">
						<div class="col d-grid">
							<button type="button" class="btn btn-secondary">아이디/비밀번호 찾기</button>
						</div>
					</div>
					
					
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row">
				<div class="col">
					<jsp:include page="../common/global_footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>