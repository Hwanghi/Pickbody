<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일간 스케줄 작성 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_trainer.css">
<script src="../resources/js/sidebar_trainer.js?version=2.1.7"></script>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row background-gray p-3">
				<div class="col"></div>
				<div class="col-10">
					<c:forEach items="${dataList }" var="data">
						<div class="row">
							<div class="col">
								<h2>
									<fmt:formatDate value="${data.scheduleDaily.schedule_date }"
										pattern="MM월 dd일" />
								</h2>
							</div>
						</div>
						<div class="row justify-content-between">
							<div class="col-6">
								<div class="row">
									<div class="col font-orange">
										<h3>
											<a href="./dietDailyPage.do?schedule_no=${data.scheduleDaily.schedule_no}">식단표</a>
										</h3>
									</div>
								</div>
								<div class="row">
								<c:choose>
									<c:when test="${!empty data.dailyFoodList}">
									<c:forEach items="${data.dailyFoodList}" var="dailyFood">
										<div class="col text-center">
											<c:if test="${dailyFood.time == 0 }">
												<h4>아침</h4>
												<div>
													<c:forEach items="${dailyFood.foodMapList}" var="foodMap">
														${foodMap.name }
														${foodMap.number}${foodMap.unit }<br> 
													</c:forEach>
												</div>
											</c:if>
											<c:if test="${dailyFood.time == 1 }">
												<h4>점심</h4>
												<div>
													<c:forEach items="${dailyFood.foodMapList}" var="foodMap">
														${foodMap.name }
														${foodMap.number}${foodMap.unit }<br> 
													</c:forEach>
												</div>
											</c:if>
											<c:if test="${dailyFood.time == 2 }">
												<h4>저녁</h4>
												<div>
													<c:forEach items="${dailyFood.foodMapList}" var="foodMap">
														${foodMap.name }
														${foodMap.number}${foodMap.unit }<br> 
													</c:forEach>
												</div>
											</c:if>
										</div>
									</c:forEach>
									</c:when>
									<c:otherwise>
										식단을 작성해주세요.
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="col-6">
								<div class="row">
									<div class="col font-orange">
										<h3>
											<a href="./rutineDailyPage.do?schedule_no=${data.scheduleDaily.schedule_no}">운동 루틴</a>
										</h3>
									</div>
								</div>
								<div class="row">
									<div class="col">
									<c:choose>
										<c:when test="${!empty data.dailyExerciseList}">
										<c:forEach items="${data.dailyExerciseList}" var="dailyExercise">
										<table class="table table-striped">
											<thead>
												<tr>
													<th scope="col">이름</th>
													<th scope="col">세트</th>
													<th scope="col">횟수</th>
													<th scope="col">중량</th>
													<th scope="col">쉬는시간</th>
												</tr>
											</thead>
											<tbody>
											<tr>
												<td>${dailyExercise.exerciseCategoryVo.exercise_category_name }</td>
												<td>${dailyExercise.rutineDailyVo.rutine_set }</td>
												<td>${dailyExercise.rutineDailyVo.rutine_number }</td>
												<td>${dailyExercise.rutineDailyVo.rutine_weight }</td>
												<td>${dailyExercise.rutineDailyVo.rutine_resttime }</td>
											</tr>			
													
											</tbody>
										</table>
										</c:forEach>
										</c:when>
										<c:otherwise>
											운동 루틴을 작성해주세요.
										</c:otherwise>
									</c:choose>
									</div>
								</div>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>