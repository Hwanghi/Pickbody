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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.6">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.2.2"></script>
<script>
	var selectedTrainerNo;
	var memberPoint = ${memberUser.member_point};
	// 프로그램 신청하기
	function applyProgramProcess(e) {
		var formData = e.closest(".modal-body");
		var select = formData.getElementsByClassName('selectGoal')[0];
		var goalCategoryNo = select.options[select.selectedIndex].value;		
		var totalPrice = formData.getElementsByClassName('totalPrice')[0];
		var howWeeks = formData.getElementsByClassName('howWeeks')[0];
		var params = "trainer_no=" + selectedTrainerNo + 
			"&goal_category_no=" + goalCategoryNo + 
			"&how_weeks=" + howWeeks.value + 
			"&totalPrice" + totalPrice.innerText;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				//var data = JSON.parse(xmlhttp.responseText);
				window.location.href = "../member/toDoWeekPage.do";
			}
		};
		
		
		xmlhttp.open("post" , "./applyProgramProcess.do"); 
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send(params);
		
	}

	// 강사 신청 Modal 양식 만들기
	function createApplyForm(e, trainerNo) {
		// 회원이 선택한 강사번호
		selectedTrainerNo = trainerNo;
		var trainerInfo = e.closest(".trainerInfo");
		var trainerName = trainerInfo.getElementsByClassName("trainerName")[0];
		var trainerPrice = trainerInfo.getElementsByClassName("trainerPrice")[0];
		var trainerGoal = trainerInfo.getElementsByClassName("trainerGoal");
		
		var modalTitle = document.getElementsByClassName("modal-title")[0];
		modalTitle.innerHTML = "";
		modalTitle.innerText = trainerName.innerText + " 강사 PT 프로그램 신청 양식";
		
		var modalBody = document.getElementsByClassName("modal-body")[0];
		modalBody.innerHTML = "";
		var rows = [];
		
		for(i=0; i<5; i++) {
			var row = document.createElement("div");
			row.setAttribute("class", "row m-3");
			if(i<4){
				var col1 = document.createElement("div");
				col1.setAttribute("class", "col-5 border border-warning");
				var col2 = document.createElement("div");
				col2.setAttribute("class", "col-7");
				row.appendChild(col1);
				row.appendChild(col2);
			}else {
				// 제출 버튼 만들기
				var col3 = document.createElement("div");
				col3.setAttribute("class", "col text-center");
				var btn = document.createElement("button");
				btn.setAttribute("class", "btn background-orange applyBtn");
				btn.setAttribute("onclick", "applyProgramProcess(this)");
				btn.innerText = "신청하기";
				col3.appendChild(btn);
				row.appendChild(col3);
			}
			rows.push(row);
		}
		
		// 주단위 가격
		var priceByWeek = rows[0];
		var tags1 = priceByWeek.children;
		tags1[0].innerText = "주단위 구독료";
		tags1[1].classList.add("priceByWeek");
		tags1[1].innerText = trainerPrice.innerText;
		
		// 회원 목표 선택 
		var memberGoal = rows[1];
		var tags2 = memberGoal.children;
		tags2[0].innerText = "회원목표 선택";
		var selectBox = document.createElement("select");
		selectBox.classList.add("selectGoal");
		for(goal of trainerGoal) {
			var option = document.createElement("option");
			option.value = goal.value;
			option.innerText = goal.innerText;
			selectBox.appendChild(option);
		}
		tags2[1].appendChild(selectBox);
		
		// 구독기간 
		var howWeeks = rows[2];
		var tags3 = howWeeks.children;
		tags3[0].innerText = "구독기간";
		var inputBox = document.createElement("input");
		inputBox.classList.add("howWeeks");
		inputBox.setAttribute("type", "number");
		inputBox.setAttribute("style", "width:70%");
		inputBox.setAttribute("oninput", "calcPoint(this)");
		tags3[1].appendChild(inputBox);
		
		// 차감 포인트
		var totalPrice = rows[3];
		var tags4 = totalPrice.children;
		tags4[0].innerText = "차감 포인트";
		tags4[1].innerText = "0";
		tags4[1].classList.add("totalPrice");
		
		for(row of rows)
			modalBody.appendChild(row);
	}
	
	// 포인트 자동 계산
	function calcPoint(e) {
		var formData = e.closest(".modal-body");
		var priceByWeek = formData.getElementsByClassName('priceByWeek')[0];
		var howWeeks = formData.getElementsByClassName('howWeeks')[0];
		var totalPrice = formData.getElementsByClassName('totalPrice')[0];
		var applyBtn = formData.getElementsByClassName('applyBtn')[0];
		
		// 구독기간 * 강사료 = 차감 포인트 
		var calcPrice = priceByWeek.innerText * howWeeks.value;
		totalPrice.innerText = calcPrice;
		
		// 포인트 지불 가능 여부 계산해서 지불 못하면 버튼 비활성화
		if(memberPoint < calcPrice) {
			applyBtn.disabled = true;
			totalPrice.innerText = calcPrice + " *경고* 포인트가 부족합니다.";
		} else {
			applyBtn.disabled = false;
		}
	}
</script>
</head>
<body>
	<div style="width:1200px; margin:0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
	<!-- Modal -->
	<div class="modal fade" id="applyForm" tabindex="-1" aria-labelledby="applyFormLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="applyFormLabel"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	     	<!-- <div class="row m-3" >
	        	<div class="col-5 border border-warning">주단위 가격</div>
	        	<div class="col-7">10 point</div>
	        </div>
	        <div class="row m-3">
	        	<div class="col-5 border border-warning">회원목표 선택</div>
	        	<div class="col-7"><select id="selectMemberGoal"></select></div>
	        </div>
	        <div class="row m-3">
	        	<div class="col-5 border border-warning">구독기간</div>
	        	<div class="col-7"><label for="inputPassword2" class="visually-hidden">일주일 단위로 신청하세요.</label>
    			<input type="number" class="form-control" id="inputPassword2" placeholder="일주일 단위로 신청하세요."></div>
	        </div>
	        <div class="row m-3">
	        	<div class="col-5 border border-danger">차감 포인트</div>
	        	<div class="col-7">100 point</div>
	        </div>
	        <div class="row m-3">
	        	<div class="col text-center"><button class="btn btn-primary" onclick="applyProgramProcess()">신청하기</button></div>
	        </div> -->
	    </div>
	  </div>
	</div>
	</div>
	<main class="container-sm py-5 background-gray">
	  <div class="row" data-masonry='{"percentPosition": true }'>
	  	<c:forEach  items="${trainerList }" var="data" varStatus="i">
	  		<div class="col-sm-6 col-lg-4 mb-4">
		    <div class="card-img-top text-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCard${i.count }" aria-expanded="false" aria-controls="collapseCard${i.count }">
		        <img class="img-fluid" src="/upload/trainer/profile/${data.profileImageVo.image_link}">
		    </div>
		    <div class="collapse multi-collapse" id="collapseCard${i.count }">
			    <div class="card card-body">
			    	<div class="container-fluid trainerInfo">
			    		<div class="row">
			    			<h3 class="col-5 text-end px-1">${i.count}.</h3>
			    			<h3 class="col-7 trainerName text-start px-0">
			    			${data.trainerVo.trainer_name }
			    			</h3>
			    		</div>
			    		<div class="row">
			    			<div class="col-2 ps-2 p-0 font-orange">
			    				이력
			    			</div>
			    			<div class="col p-0 d-flex flex-column">
			    				<ul>
			    					<c:if test="${i.count<4}">
			    						<div>전국 보디빌딩 대회 1위</div>
			    						<div>헬스트레이너 자격증</div>
			    					</c:if>
			    					<c:if test="${i.count>3}">
			    						<div>필라테스 경연대회 3위</div>
			    						<div>요가 강사 자격증</div>
			    					</c:if>
			    				</ul>
			    			</div>
			    		</div>
			    		<div class="row">
			    			<div class="col">
			    				<div class="row">
				    				<div class="col fs-6 font-orange">
					    				전문분야
					    			</div>
			    				</div>
			    				<div class="row">
			    				 <div class="col">
			    				  	<ol class="d-flex flex-wrap fs-4">
										<c:forEach items="${data.goalCategoryList }" var="goalCategory" varStatus="i">
											<li class="trainerGoal mx-1" value="${goalCategory.goal_category_no }" style="list-style:none">${goalCategory.goal_category_name }</li>
										</c:forEach>
					    			</ol>
			    				 </div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="row">
			    			<div class="col">
			    				<div class="row">
				    				<div class="col fs-6 font-orange">
					    				주단위 구독료
					    			</div>
			    				</div>
			    				<div class="row font-yellow fs-4">
			    					<div class="col-5 trainerPrice text-end p-0">
				    				${data.trainerVo.trainer_price }
				    				</div>
				    				<div class="col p-0">
				    				포인트
				    				</div>
			    				</div>
			    			</div>
			    		</div>
			    		<div class="row my-3">
			    			<div class="col text-center">
			    			<button type="button" class="btn btn-danger background-orange" data-bs-toggle="modal" data-bs-target="#applyForm" onclick="createApplyForm(this,${data.trainerVo.trainer_no})">
		  								구독 신청하기
							</button>
			    			</div>
			    		</div>
			    	</div>
				</div>
		    </div>
	    	</div>
	  	</c:forEach>
	  </div>
	
	</main>
	</div>

    <script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script async src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>