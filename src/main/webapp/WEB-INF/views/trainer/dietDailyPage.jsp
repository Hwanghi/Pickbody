<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일간 식단 작성 페이지</title>
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
			<div class="row">
				<div class="col-3"></div>
				<div class="col background-gray p-3">
					<div class="row">
						<div class="col">
							<h2>
								<fmt:formatDate value="${scheduleDailyVo.schedule_date }"
									pattern="yy/MM/dd" />
								식단
							</h2>
						</div>
					</div>
					<div class="row">
						<form class="col" action="./dietDailyProcess.do">
							<div class="row mb-3">
								<div class="col">
									<label for="selectDietTime" class="form-label">시간</label> 
									<select
										class="form-select" id="selectDietTime"
										aria-label="Default select example" name="diet_time">
										<option selected>시간대를 선택하세요</option>
										<option value="0">아침</option>
										<option value="1">점심</option>
										<option value="2">저녁</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-12">
									<hr>
								</div>
								<div class="col-8">
									<label for="selectFoodCategory" class="form-label">음식 종류</label> 
									<select class="form-select" id="selectFoodCategory"
										aria-label="Default select example" name="food_category_no">
										<option selected>음식 종류를 선택하세요</option>
										<c:forEach items="${foodCategoryList}" var="foodCategory">
											<option value="${foodCategory.food_category_no }">${foodCategory.food_category_name }
												(${foodCategory.food_category_unit })</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-4">
									<label id="foodNumber" for="selectFoodCategory"
										class="form-label">음식량 </label> 
									<input type="number" class="form-control" id="foodNumber" name="diet_food_number">
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