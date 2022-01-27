<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 할일</title>
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
<script src="../resources/js/sidebar_member.js?version=2.1.7"></script>
</head>
<script>
var scheduleNo = ${scheduleNo};
var startTime;
function loadRecord() {
	// 페이지 로드할때 이전에 작성한 레코드들을 불러온다. 
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
		}
	};
	
	// 테이블 밑 input hidden 에 있는 value 가져오기 
	var rutineNo = setBox.parentElement.parentElement.parentElement.nextElementSibling.value;
	xmlhttp.open("post" , "./rutineDailyRecordProcess.do"); 
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("rutine_no="+rutineNo);
}

function startStopWatch(e) {
	var stopWatchBtn = e;
	startTime = Date.now();
	stopWatchBtn.style.color = "red";
	stopWatchBtn.setAttribute("onclick", "endStopWatch(this)");
}

function endStopWatch(e) {
	var setBox = e.closest(".setBox");
	var endTime = Date.now();
	// 테이블 현재 칸에 시간을 추가
	if (startTime) {
		var duration = new Date(endTime - startTime);
		var minutes = duration.getMinutes();
		minutes = minutes < 10 ? "0" + minutes : minutes;
		var seconds = duration.getSeconds();
		seconds = seconds < 10 ? "0" + seconds : seconds;
		setBox.innerHTML = "";
		setBox.innerText = minutes +":"+seconds;
	}
	
	// 테이블 다음 칸에 아이콘을 추가
	var stopWatchBtn = document.createElement("i");
	stopWatchBtn.setAttribute("class", "bi bi-stopwatch fs-2");
	stopWatchBtn.setAttribute("onclick", "startStopWatch(this)");
	if(setBox.nextElementSibling)
		setBox.nextElementSibling.appendChild(stopWatchBtn);
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
		}
	};
	
	// 테이블 밑 input hidden 에 있는 value 가져오기 
	var rutineNo = setBox.parentElement.parentElement.parentElement.nextElementSibling.value;
	xmlhttp.open("post" , "./rutineDailyRecordProcess.do"); 
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send("rutine_no="+rutineNo+"&rutine_record_time="+setBox.innerText);
}

function memberDailyNoteProcess(e) {
	var dailyNoteBox = e.closest(".dailyNoteBox");
	var memberReview = dailyNoteBox.getElementsByClassName('memberReview')[0]
	var trainerScore = dailyNoteBox.getElementsByClassName('trainerScore')[0];
	var params = "schedule_no=" + scheduleNo +"&member_review=" +memberReview.value+"&trainer_score="+trainerScore.value;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			window.location.href = "../member/toDoTodayPage.do?schedule_no=" + scheduleNo;
		}
	};
	
	
	xmlhttp.open("post" , "../member/memberDailyNoteProcess.do"); 
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send(params);
	
}
</script>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">
				<!-- 네비 바..row -->
				<div class="col">
					<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
				</div>
			</div>
			<div class="row">
				<div class="col-2"></div>
				<div class="col">
					<div class="row">
						<div class="col">
							<h1>오늘의 할 일</h1>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row">
								<div class="col text-center">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>아침</th>
												<th>점심</th>
												<th>저녁</th>
											</tr>
										</thead>
										<tbody>
											<tr>
											<c:forEach var="i" begin="0" end="2">
												<c:choose>
													<c:when test="${!empty dailyFoodList[i]}">
														<td style='width: 60px'>
														<c:forEach items="${dailyFoodList[i].foodMapList }" var="foodMap">
															${foodMap.name }
															${foodMap.number}${foodMap.unit }<br> 
														</c:forEach>
														</td>
													</c:when>
													<c:otherwise>
														<td style='width: 60px'></td>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<c:choose>
										<c:when test="${!empty rutineDailyExerciseList }">
											<c:forEach items="${rutineDailyExerciseList }" var="rutineDailyExercise" varStatus="row">
												<table class="table table-bordered" style='width:${200 + rutineDailyExercise.rutineDailyVo.rutine_set*60}px'>
													<thead>
														<tr>
															<th scope="col">${rutineDailyExercise.exerciseCategoryVo.exercise_category_name }</th>
															<th scope="col">목표</th>
															<c:forEach begin="1" end="${rutineDailyExercise.rutineDailyVo.rutine_set }" varStatus="i">
																<th scope="col">${i.count }set</th>
															</c:forEach>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
		  														<div class="row"><div class="col">횟수</div></div>
		  														<div class="row"><div class="col">중량</div></div>
		  														<div class="row"><div class="col">쉬는시간</div></div>
															</td>
															<td>
		  														<div class="row"><div class="col">${rutineDailyExercise.rutineDailyVo.rutine_number }</div></div>
		  														<div class="row"><div class="col">${rutineDailyExercise.rutineDailyVo.rutine_weight }kg</div></div>
		  														<div class="row"><div class="col">${rutineDailyExercise.rutineDailyVo.rutine_resttime }</div></div>
															</td>
															<c:forEach begin="1" end="${rutineDailyExercise.rutineDailyVo.rutine_set }" varStatus="i">
																<td class="text-center align-middle setBox" style="width: 60px" scope="col">
																	<c:choose>
																		<c:when test="${!empty rutineDailyExercise.rutineDailyRecordList && !empty rutineDailyExercise.rutineDailyRecordList[i.count-1]}">
																			${rutineDailyExercise.rutineDailyRecordList[i.count-1].rutine_record_time }
																		</c:when>
																		<c:otherwise>
																			<c:if test="${empty rutineDailyExercise.rutineDailyRecordList && i.count==1}">
																				<i class="bi bi-stopwatch fs-2" onclick="startStopWatch(this)"></i>
																			</c:if>
																			<c:if test="${i.count > 1 && i.count == rutineDailyExercise.rutineDailyRecordList.size()}">
																				<i class="bi bi-stopwatch fs-2" onclick="startStopWatch(this)"></i>
																			</c:if>
																		</c:otherwise>
																	</c:choose>
																</td>
															</c:forEach>
														</tr>
													</tbody>
												</table>
												<input type="hidden" class="rutineNo" value="${rutineDailyExercise.rutineDailyVo.rutine_no}">
											</c:forEach>
										</c:when>
										<c:otherwise>
											<h4>작성된 운동 루틴이 없습니다.</h4>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row g-2 justify-content-between">
								<div class="col dailyNoteBox">
								<div class="row">
									<div class="col-5">
										<div class="form-floating">
											<textarea class="form-control memberReview"
												placeholder="강사에게 소감을 말해주세요" id="floatingTextarea">${memberDailyNoteVo.member_review }</textarea>
											<label for="floatingTextarea">오늘의 소감</label>
										</div>
									</div>
									<div class="col-5">
										<label for="score" class="form-label">오늘 강사 점수를 매겨주세요</label>
										<input type="range" class="form-range trainerScore" min="0" max="5" step="0.5" id="score" value="${memberDailyNoteVo.trainer_score }">		
									</div>
								</div>
								<div class="row">
									<div class="col text-end">
										<button class="btn background-orange text-white" onclick="memberDailyNoteProcess(this)">작성 완료</button>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>