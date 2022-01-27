<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidenav">
<div class="container-fluid text-white px-3 pb-3">
	<div class="row">
		<div class="col text-end">
			<i class="bi bi-arrow-left-short fs-1" onclick="toggleSidebar()"></i>
		</div>
	</div>
	<div class="row firstBox mx-2">
		<c:if test="${empty memberUser }">
			<div class="col loginForm">
				<div class="row mt-2">
					<!-- 로고 row -->
					<div class="col fs-4">회원으로 접속하기</div>
				</div>
				<div class="row mt-2">
					<!-- ID row -->
					<div class="col">
						<input class="idBox form-control" type="text"
							placeholder="아이디를 입력하세요">
					</div>
				</div>
				<div class="row mt-2">
					<!-- password row -->
					<div class="col">
						<input class="pwBox form-control" type="password"
							placeholder="비밀번호를 입력하세요">
					</div>
				</div>
				<div class="row mt-3">
					<!-- 로그인 버튼 row -->
					<div class="col d-grid">
						<button class="btn background-orange text-white" onclick="loginProcess(this)">로그인</button>
					</div>
				</div>
				<div class="row mt-3">
					<!-- 비번 찾기 / 회원 가입 -->
					<div class="col d-grid">
						<a>ID/PW 찾기</a>
					</div>
					<div class="col d-grid text-end">
						<a href="../member/joinMemberPage.do" class="text-white">회원가입</a>
					</div>
				</div>
				<div class="row">
					<div id="warningBox" class="col text-center" style="color: red"></div>
				</div>

				<div class="row fixed-bottom">
					<!-- 광고 row -->
					<div class="col">
						<img class="img-fluid" src="../resources/img/add.png">
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<div class="row secendBox">
		<%-- <div class="col-7 fs-4 text-center align-baseline">
				<i class="bi bi-shop"></i>
				<a>보유포인트</a>
			</div>
			<div class="col fs-4">
				${memberUser.member_point}
			</div> --%>
	</div>
	<div class="row thirdBoxInfo">
		
	</div>
	<div class="row thirdBox m-auto">
		<!-- <div class="col">
				<div class="row">
					<div class="col todayDiet">
						<div class="row">
							<div class="col">오늘의 식단</div>
						</div>
						<div class="row">
							<div class="col">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>아침</th>
										<th>점심</th>
										<th>저녁</th>
									</tr>
								</thead>
								<tbody>
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
								</tbody>
							</table>
							
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col todayRutine">
						<div class="row"><div class="col"></div></div>
						<div class="row"><div class="col"></div></div>
					</div>
				</div>
				<div class="row">
					<div class="col trainerAdvice">
						<div class="row"><div class="col"></div></div>
						<div class="row"><div class="col"></div></div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
</div>