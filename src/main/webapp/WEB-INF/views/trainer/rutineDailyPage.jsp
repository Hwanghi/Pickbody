<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="container-fluid">
			<div class="row">
				<!-- 네비 바..row -->
				<div class="col">
					<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
				</div>
			</div>

			<div class="row">
				<div class="col-3"></div>
				<div class="col background-gray p-3">
					<div class="row">
						<div class="col">
							<h2>
								<fmt:formatDate value="${scheduleDailyVo.schedule_date }"
									pattern="yy/MM/dd" />
								운동 루틴
							</h2>
						</div>
					</div>
					<div class="row">
						<form class="col" action="./rutineDailyProcess.do" method="post">
							<div class="row mb-3">
								<div class="col">
									<label for="selectExerciseCategory" class="form-label">운동 종류</label> 
									<select class="form-select" id="selectExerciseCategory" name="exercise_category_no">
										<option selected>운동 종류를 선택하세요</option>
										<c:forEach items="${exerciseCategoryList}" var="exerciseCategory">
											<option value="${exerciseCategory.exercise_category_no }">${exerciseCategory.exercise_category_name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="rutine_set" class="form-label">세트 </label> 
									<input type="number" class="form-control" id="rutine_set" name="rutine_set">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="rutine_number" class="form-label">횟수 </label> 
									<input type="number" class="form-control" id="rutine_number" name="rutine_number">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="rutine_weight" class="form-label">중량 </label> 
									<input type="number" class="form-control" id="rutine_weight" name="rutine_weight" value="0">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col">
									<label for="resttime" class="form-label">쉬는시간 </label> 
									<input type="text" class="form-control" id="resttime" name="rutine_resttime">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col text-end">
									<button type="submit" class="btn background-orange text-white">제출</button>
								</div>
							</div>
							<!-- hidden input -->
							<input type="hidden" name="schedule_week_no" value="${scheduleDailyVo.schedule_week_no}">
							<input type="hidden" name="schedule_no" value="${scheduleDailyVo.schedule_no}">
						</form>
					</div>
				</div>
				<div class="col-3"></div>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>