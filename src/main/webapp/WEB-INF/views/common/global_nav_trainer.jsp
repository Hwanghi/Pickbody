<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="container-fluid">
	<div class="row my-3">
		<div class="col font-blue d-flex justify-content-end">
			<c:choose>
			<c:when test="${empty trainerUser }">
				<div class="pointer-text" onclick="../trainer/loginPage.do">로그인</div>
				<div class="mx-3">
					<a href="../trainer/joinTrainerPage.do">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<a href="../trainer/logoutProcess.do">로그아웃</a>
				<div class="mx-3">
					<a href="../trainer/myPage.do">${trainerUser.trainer_name }</a>
				</div>
			</c:otherwise>
			</c:choose>
			<div>고객센터</div>
		</div>
	</div>
	<div class="row my-3 text-center font-blue bold"
		style="text-shadow: 4px 0px #000000;">
		<div class="col text-center">
			<a href="../trainer/loginPage.do">
				<span style="font-size: 4rem;">PICK BODY</span>
			</a>
		</div>
	</div>
	<div class="row fs-3 text-center px-3 mb-5" style="border-bottom: 2px solid #BEBEBE; border-top: 2px solid #BEBEBE;">
		<div class="col-1 pointer-text">
			<img src="../resources/img/logo.png"
				style="width: 60px; height: auto;" onclick="toggleSidebar()">
		</div>
		<div class="col menu">
			<a href="#">회사소개</a>
		</div>
		<div class="col menu">
			<a href="#">회원모집</a>
		</div>
		<div class="col menu">
			<a href="../trainer/manageMemberPage.do">회원관리</a>
		</div>
		<div class="col-1">
		</div>
	</div>
</div>				

    
