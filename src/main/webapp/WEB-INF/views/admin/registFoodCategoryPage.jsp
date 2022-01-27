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
function doRegistFood(){
	var foodForm1 = document.getElementById("foodForm1"); //접근 핵심...


	var foodName1 = document.getElementById("foodName1");
	if (foodName1.value == "") {
		alert("음식 이름을 입력하셔야 됩니다.");
		foodName.focus();
		return;
	}


	var foodUnit1 = document.getElementById("foodUnit1");
	if (foodUnit1.value == "") {
		alert("음식 단위를 입력하셔야 됩니다.");
		foodUnit1.focus();
		return;
	}


	foodForm1.submit();
}

function doUpdateFood(){
	var foodForm2 = document.getElementById("foodForm2");
	
	var foodNo2 = document.getElementById("foodNo2");
	if (foodNo2.value == "") {
		alert("음식 번호를 입력하셔야 됩니다.");
		foodNo2.focus();
		return;
	}

	var foodName2 = document.getElementById("foodName2");
	if (foodName2.value == "") {
		alert("음식 이름을 입력하셔야 됩니다.");
		foodName2.focus();
		return;
	}


	var foodUnit2 = document.getElementById("foodUnit2");
	if (foodUnit2.value == "") {
		alert("음식 단위를 입력하셔야 됩니다.");
		foodUnit2.focus();
		return;
	}


	foodForm2.submit();
}
function doDeleteFood(){
	var foodForm3 = document.getElementById("foodForm3");
	
	var foodNo3 = document.getElementById("foodNo3");
	if (foodNo3.value == "") {
		alert("음식 번호를 입력하셔야 됩니다.");
		foodNo3.focus();
		return;
	}
	foodForm3.submit();
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
								<div class="col-1"><i class="bi bi-inboxes-fill"></i></div>
								<div class="col-3 ps-0">단위</div>
							</div>
							<c:forEach items="${foodCategoryVoList }" var="data">
							<div class="row">
								<div class="col-1"></div>
								<div class="col-2 ps-0">${data.foodCategoryVo.food_category_no }</div>
								<div class="col-1"></div>
								<div class="col ps-0">${data.foodCategoryVo.food_category_name }</div>
								<div class="col-1"></div>
								<div class="col-3 ps-0">${data.foodCategoryVo.food_category_unit }</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<div class="col text-center ms-3" style="background-color: #F2F2F2;">
					<div class="row mt-5">
						<div class="col">
							<form id="foodForm1" action="./registFoodCategoryProcess.do" method="get">
								<div class="row">
									<div class="col d-grid"><input id="foodName1" type="text" name="food_category_name" placeholder="음식 이름을 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="foodUnit1" type="text" name="food_category_unit" placeholder="음식 단위를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn text-white" onclick="doRegistFood()" style="background-color:#F25C19;">음식 등록</button></div>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col">
							<form id="foodForm2" action="./updateFoodCategoryProcess.do" method="get">
								<div class="row">
									<div class="col d-grid"><input id="foodNo2" type="number" name="food_category_no" placeholder="변경 할 음식의 기존 번호를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="foodName2" type="text" name="food_category_name" placeholder="변경 하실 음식 이름으로 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><input id="foodUnit2" type="text" name="food_category_unit" placeholder="변경 하실 음식 단위로 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn btn-outline-warning" onclick="doUpdateFood()">음식 수정</button></div>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-5">
						<div class="col">
							<form id="foodForm3" action="./deleteFoodCategoryProcess.do" method="post">
								<div class="row">
									<div class="col d-grid"><input id="foodNo3" type="number" name="food_category_no" placeholder="삭제 할 음식 번호를 입력 해 주세요."></div>
								</div>
								<div class="row mt-2">
									<div class="col d-grid"><button type="button" class="btn btn-outline-secondary" onclick="doDeleteFood()">음식 삭제</button></div>
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
	