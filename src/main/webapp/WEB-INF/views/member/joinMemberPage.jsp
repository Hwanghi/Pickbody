<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.0.9"></script>
<script>
	function doSubmit() {

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

		//pw와...pwConfirm이 같지 않을때.... (사용자 비번 입력 실수 방지...)
		var pwConfirm = document.getElementById("pwConfirm");
		if (pw.value != pwConfirm.value) {
			alert("비밀번호가 일치하지 않습니다.");
			pw.value = "";
			pwConfirm.value = "";

			pw.focus();
			return;
		}

		//생일이 지정되지 않았을때...
		var birth = document.getElementById("birth");
		if (birth.value == "") {
			alert("생일을 지정하셔야 됩니다.~!");
			birth.focus();
			return;
		}

		frm1.submit();
	}
</script>

</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="mt-3 container-fluid">
			<div class="row">
				<div class="col"></div>
				<div class="col background-gray p-4">
					<form action="./joinMemberProcess.do" method="post" enctype="multipart/form-data">
					 	<legend>회원가입</legend>
						<div class="mb-2">
							<label for="id" class="form-label">아이디</label> 
							<input type="text" class="form-control"id="id" name="member_id">
						</div>
						<div class="mb-2">
							<label for="pw" class="form-label" >비밀번호</label>
							<input type="password" class="form-control" id="pw" name="member_pw">
						</div>
						<div class="mb-2">
							<label for="pwConfirm" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwConfirm">
						</div>
						<div class="mb-2">
							<label for="memberName" class="form-label">이름</label> 
							<input type="text" class="form-control"id="memberName" name="member_name">
						</div>
						<div class="mb-2">
							<label for="memberNick" class="form-label" >닉네임</label> 
							<input type="text" class="form-control" id="memberNick" name="member_nick">
						</div>
						<div class="mb-2">
							<label for="memberEmail" class="form-label">이메일</label> 
							<input type="email" class="form-control" id="memberEmail" name="member_email">
						</div>
						<div class="mb-2">
							<label for="memberAddress" class="form-label" >주소</label> 
							<input type="text" class="form-control" id="memberAddress" name="member_address">
						</div>
						<div class="mb-2">
							<label for="memberPhone" class="form-label" >전화번호</label> 
							<input type="text" class="form-control" id="memberPhone" name="member_phone">
						</div>
						<div class="mb-2">
							<label for="birth" class="form-label" >생년월일</label> 
							<input class="form-control" id="birth" type="date" name="member_birth">
						</div>
						<div>성별</div> 
						<div class="d-flex mb-2">
							<div class="form-check mx-3">	
								<input id="memberGender1" class="form-check-input" type="radio" name="member_gender" value="M" checked>
								<label class="form-check-label" for="memberGender1"> 남 </label>
							</div>
							<div class="form-check">
								<input id="memberGender2" class="form-check-input" type="radio" name="member_gender" value="F">
								<label class="form-check-label" for="memberGender2"> 여 </label>
							</div>
						</div>
						<div>회원목표</div> 
						<div class="d-flex flex-wrap mb-2">
							<c:forEach items="${ goalCategoryList }" var="goalCategory">
							<div class="form-check mx-2">
							  <input class="form-check-input" type="checkbox" name="goal_category_no" value="${goalCategory.goal_category_no }" >
							  <label class="form-check-label">
							    ${goalCategory.goal_category_name }
							  </label>
							</div>
							</c:forEach>
						</div>
						<div class="mb-3" id="upload">
						  <label for="profile" class="form-label">프로필 사진</label>
						  <input class="form-control" type="file" id="profile" accept="image/*" name="file">
						</div>
						<div class="mb-2 text-end">
							<button type="submit" class="btn btn-primary" onclick="doSubmit()">회원가입</button>
						</div>
					</form>
				</div>
				<div class="col">
				</div>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>