<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>	

	<div style="width:1200px; margin:0 auto">
		<div class="container-fluid">
			<div class="row"><!-- 네비 바..row -->
				<div class="col">
					<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
				</div>			
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<p class="fs-2">팔로우 목록페이지</p>
				</div>
			<div class="row mt-3"> 
					<div class="col-4 d-grid gap-2"><%--팔로우추가페이지 이동버튼영역 --%>				
						<button type="button" class="btn btn-info" onClick="location.href='../member/followPage.do'">팔로우추가</button>
					</div>
					<div class="col-4 d-grid gap-2"><%--팔로우추가페이지 이동버튼영역 --%>				
						<button type="button" class="btn btn-success" onClick="location.href='../member/creatFollowGroup.do'">그룹생성하기</button>
					</div>
					<div class="col-4 btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					    쪽지
					  	</button>
					  <ul class="dropdown-menu">			
					    <li><a class="dropdown-item" href="../member/writeMessagePage.do">친구에게 쪽지보내기</a></li>
					    <li><a class="dropdown-item" href="../member/sendMessagePage.do">보낸쪽지함</a></li>
					    <li><a class="dropdown-item" href="../member/receiveMessagePage.do">받은쪽지함</a></li>
					  </ul>
					</div>
			</div>
	
			<div class="row mt-5"> <%--그룹+멤버이름영역 --%>
				<div class="col-3"></div>
				<div class="col-6">
					<c:forEach var="groupMap" items="${list }">
						<div class="row border border-primary ">
							<div class="col bg-primary text-white">
								${groupMap.fgVo.group_name }
							</div>
							<div class="col-1 bg-primary"><%--x버튼 --%>
								<a href="../member/deleteFollowGroupProcess.do?group_no=${groupMap.fgVo.group_no }">
								<button type="button" class="btn-close" aria-label="Close"></button></a>
							</div>
						</div>
						<c:forEach var="memberMap" items="${groupMap.voList }">
							<div class="row border border-primary">
								<div class="col">
									${memberMap.mVo.member_nick}							
								</div>
								<div class="col-1"><%--x버튼 --%>
									<a href="../member/deleteFollowProcess.do?follow_member_no=${memberMap.mVo.member_no }">
							     	<button type="button" class="btn-close" aria-label="Close"></button></a>
								</div>	
							</div>
						</c:forEach>
					</c:forEach>
				</div>
				<div class="col-3"></div>			
			</div>
		</div>
	</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>