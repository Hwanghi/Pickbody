<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
crossorigin="anonymous">
<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}


</style>
<script>
function doRegistExercise(){
	var exerciseForm1 = document.getElementById("exerciseForm1"); //접근 핵심...


	var exerciseName1 = document.getElementById("exerciseName1");
	if (exerciseName1.value == "") {
		alert("운동 이름을 입력하셔야 됩니다.");
		exerciseName.focus();
		return;
	}


	var exerciseLink1 = document.getElementById("exerciseLink1");
	if (exerciseLink1.value == "") {
		alert("운동 링크를 입력하셔야 됩니다.");
		exerciseLink1.focus();
		return;
	}


	exerciseForm1.submit();
}

function doUpdateExercise(){
	var exerciseForm2 = document.getElementById("exerciseForm2");
	
	var exerciseNo2 = document.getElementById("exerciseNo2");
	if (exerciseNo2.value == "") {
		alert("운동 번호를 입력하셔야 됩니다.");
		exerciseNo2.focus();
		return;
	}

	var exerciseName2 = document.getElementById("exerciseName2");
	if (exerciseName2.value == "") {
		alert("운동 이름을 입력하셔야 됩니다.");
		exerciseName2.focus();
		return;
	}


	var exerciseLink2 = document.getElementById("exerciseLink2");
	if (exerciseLink2.value == "") {
		alert("운동 링크를 입력하셔야 됩니다.");
		exerciseLink2.focus();
		return;
	}


	exerciseForm2.submit();
}
function doDeleteExercise(){
	var exerciseForm3 = document.getElementById("exerciseForm3");
	
	var exerciseNo3 = document.getElementById("exerciseNo3");
	if (exerciseNo3.value == "") {
		alert("운동 번호를 입력하셔야 됩니다.");
		exerciseNo3.focus();
		return;
	}
	exerciseForm3.submit();
}
</script>
</head>
<body>
	<div style="width : 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col ms-3">
					<div class="row mt-5">
						<div class="col mx-2" style="background-color:white;">
							<div class="row border-bottom border-dark">
								<div class="col-1"><i class="bi bi-list"></i></div>
								<div class="col-2 ps-0">번호</div>
								<div class="col-1"><i class="bi bi-pen-fill"></i></div>
								<div class="col ps-0">이름</div>
								<div class="col-1"><i class="bi bi-badge-4k-fill"></i></div>
								<div class="col-3 ps-0">링크</div>
							</div>
							<c:forEach items="${exerciseCategoryVoList }" var="data">
							<div class="row">
								<div class="col-1"></div>
								<div class="col-2 ps-0">${data.exerciseCategoryVo.exercise_category_no }</div>
								<div class="col-1"></div>
								<div class="col ps-0">${data.exerciseCategoryVo.exercise_category_name }</div>
								<div class="col-1"></div>
								<div class="col-3 ps-0"><a href="${data.exerciseCategoryVo.exercise_category_link }"><i class="bi bi-youtube"></i></a></div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="col text-center ms-3" style="background-color: #F2F2F2;">
					<div class="row mt-5">
						<div class="col">
							<form id="exerciseForm1" action="./registExerciseCategoryProcess.do" method="post">
								<div class="row">
									<div class="col d-grid"><input id="exerciseName1" type="text" name="exercise_category_name" placeholder="등록 할 운동 이름을 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="exerciseLink1" type="text" name="exercise_category_link" placeholder="등록 할 운동 영상 링크를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn text-white" onclick="doRegistExercise()" style="background-color:#F25C19;">운동 등록</button></div>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col">
							<form id="exerciseForm2" action="./updateExerciseCategoryProcess.do" method="post">
								<div class="row">
									<div class="col d-grid"><input id="exerciseNo2" type="number" name="exercise_category_no" placeholder="변경 할 운동의 기존 번호를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="exerciseName2" type="text" name="exercise_category_name" placeholder="변경 하실 운동 이름으로 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="exerciseLink2" type="text" name="exercise_category_link" placeholder="변경 하실 운동 영상 링크로 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn btn-outline-warning" onclick="doUpdateExercise()">운동 수정</button></div>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col">
							<form id="exerciseForm3" action="./deleteExerciseCategoryProcess.do" method="post">
								<div class="row">
									<div class="col d-grid"><input id="exerciseNo3" type="number" name="exercise_category_no" placeholder="삭제 할 운동 번호를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn btn-outline-secondary" onclick="doDeleteExercise()">운동 삭제</button></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
			<div class="col">
				<jsp:include page="../common/global_footer.jsp"></jsp:include>
			</div>
		</div>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous">
</script>
</body>
</html>
	