<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차 할 일</title>
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
<script src="../resources/js/sidebar_member.js?version=2.0.9"></script>
</head>
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
							<h1>${memberUser.member_name }님 ${thisweek }주차 스케줄</h1>					
						</div>
					</div>
					<div class="row">
						<div class="col">
							<c:choose>
							<c:when test="${!empty scheduleWeek }">
								<div class="row">
									<div class="col-2"></div>
									<div class="col">
										<div class="row">
											<div class="col-4">
												<img src="/upload/trainer/profile/${trainerProfileImageVo.image_link }" class="img-thumbnail" alt="...">
											</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<h3>강사 ${thisweek }주차 조언</h3>
													</div>
												</div>
												<div class="row">
													<div class="col">
														${scheduleWeek.schedule_advice }
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-2"></div>
								</div>
								<div class="row">
								<div class="col">
									<table class="table">
									<thead>
										<tr>
											<c:forEach items="${scheduleDailyList }" var="scheduleDaily">
												<th scope="col">
													<fmt:formatDate value="${scheduleDaily.schedule_date }" pattern="MM/dd" />
												</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${scheduleDailyList }" var="scheduleDaily">
											<td>
											<c:choose>
												<c:when test="${scheduleDaily.schedule_date < today}">
													<a href="./toDoTodayPage.do?schedule_no=${scheduleDaily.schedule_no }">다시 보기</a>
												</c:when>
												<c:when test="${scheduleDaily.schedule_date == today}">
													<a href="./toDoTodayPage.do?schedule_no=${scheduleDaily.schedule_no }">오늘 할일</a>
												</c:when>
												<c:otherwise>			
												</c:otherwise>
											</c:choose>
											</td>
										</c:forEach>
									</tbody>
									</table>
								</div>
								</div>
								
							</c:when>
							<c:otherwise>
								<h3>이번주 스케줄이 없습니다.</h3>
							</c:otherwise>
							</c:choose>
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