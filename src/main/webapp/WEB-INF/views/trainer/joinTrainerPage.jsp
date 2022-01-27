<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_trainer.css">
<script>
	
	function doSubmit(){
		
		var frm1 = document.getElementById("frm1"); 
		
		var id = document.getElementById("id");
		if(id.value == ""){
			alert("ID를 입력해주세요.");
			id.focus();
			return;
		}
		
		var pw = document.getElementById("pw");
		if(pw.value == ""){
			alert("PW를 입력해주세요.");
			pw.focus();
			return;
		}
		
		var pwConfirm = document.getElementById("pwConfirm");
		if(pw.value != pwConfirm.value){
			alert("비밀번호 확인이 일치하지 않습니다.");
			pw.value = "";
			pwConfirm.value = "";
			
			pw.focus();
			return ;
		}
		
		var birth = document.getElementById("birth");
		if(birth.value == ""){
			alert("생일을 선택해주세요.");
			birth.focus();
			return;
		}
		
		
		frm1.submit();
	}
	
</script>

</head>
<body>
		<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<!-- 네비 바..row -->
			<div class="row">
				<div class="col">
					<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
				</div>
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<form action="./joinTrainerProcess.do" method="post" enctype="multipart/form-data">
					 	<legend>회원가입</legend>
						<div class="mb-2">
							<label for="id" class="form-label">아이디</label> 
							<input type="text" class="form-control"id="id" name="trainer_id">
						</div>
						<div class="mb-2">
							<label for="pw" class="form-label" >비밀번호</label>
							<input type="password" class="form-control" id="pw" name="trainer_pw">
						</div>
						<div class="mb-2">
							<label for="pwConfirm" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwConfirm">
						</div>
						<div class="mb-2">
							<label for="trainerName" class="form-label">이름</label> 
							<input type="text" class="form-control"id="trainerName" name="trainer_name">
						</div>
						<div class="mb-2">
							<label for="trainerEmail" class="form-label">이메일</label> 
							<input type="email" class="form-control" id="trainerEmail" name="trainer_email">
						</div>
						<div class="mb-2">
							<label for="trainerAddress" class="form-label" >주소</label> 
							<input type="text" class="form-control" id="trainerAddress" name="trainer_address">
						</div>
						<div class="mb-2">
							<label for="trainerPhone" class="form-label" >전화번호</label> 
							<input type="text" class="form-control" id="trainerPhone" name="trainer_phone">
						</div>
						<div class="mb-2">
							<label for="birth" class="form-label" >생년월일</label> 
							<input class="form-control" id="birth" type="date" name="trainer_birth">
						</div>
						<div>성별</div> 
						<div class="d-flex mb-2">
							<div class="form-check mx-3">	
								<input id="trainerGender1" class="form-check-input" type="radio" name="trainer_gender" value="M" checked>
								<label class="form-check-label" for="trainerGender1"> 남 </label>
							</div>
							<div class="form-check">
								<input id="trainerGender2" class="form-check-input" type="radio" name="trainer_gender" value="F">
								<label class="form-check-label" for="trainerGender2"> 여 </label>
							</div>
						</div>
						<div>전문분야</div> 
						<div class="d-flex mb-2">
							<c:forEach items="${ goalCategoryList }" var="goalCategory">
							<div class="form-check mx-2">
							  <input class="form-check-input" type="checkbox" name="goal_category_no" value="${goalCategory.goal_category_no }" >
							  <label class="form-check-label">
							    ${goalCategory.goal_category_name }
							  </label>
							</div>
							</c:forEach>
						</div>
						<div>수상내역/자격증</div> 
						<div class="d-flex mb-2">
							수상내역 : <input type="text" name="trainer_prize_name" placeholder="대회이름">
							수상일자 : <input type="date" name="trinaer_pirze_date"><br>
							보유자격증 : <input type="text" name="trainer_certification_name" placeholder="자격증이름">
							취득일자: <input type="date" name="trinaer_ertification_date"><br>
						</div>
						<div class="mb-3" id="upload">
						  <label for="profile" class="form-label">프로필 사진</label>
						  <input class="form-control" type="file" id="profile" accept="image/*" name="file">
						</div>
						<%--포인트/인증부분 --%>
						<input type="hidden" value="N" name="trainer_auth">
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