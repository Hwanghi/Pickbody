<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- include 대상이 되는 jsp는...html,head,body 태그 없어야 된다... -->    
<div class="container-fluid">
	<div class="row my-3">
		<div class="col font-blue d-flex justify-content-end">
			<c:choose>
			<c:when test="${empty memberUser }">
				<div class="pointer-text" onclick="toggleSidebar()">로그인</div>
				<div class="mx-3">
					<a href="../member/joinMemberPage.do">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<a href="../member/logoutProcess.do">로그아웃</a>
				<div class="mx-3">
					<a href="../member/myStoryPage.do">픽바디 스토리</a>
				</div>
			</c:otherwise>
			</c:choose>
			<div>고객센터</div>
		</div>
	</div>
	<div class="row my-3 text-center font-orange bold" style="text-shadow: 4px 0px #000000;">
		<div class="col text-center">
			<a href="../board/mainPage.do">
				<span style="font-size: 4rem;">PICK BODY</span>
			</a>
		</div>
	</div>
	<div class="row fs-3 text-center mb-5" style="border-bottom: 2px solid #BEBEBE; border-top: 2px solid #BEBEBE;">
		<div class="col-1 pointer-text">
			<img src="../resources/img/logo.png"
				style="width: 60px; height: auto;" onclick="toggleSidebar()">
		</div>
		<div class="col menu">
			<a href="../member/applyProgramPage.do">PT 온라인</a>
		</div>
		<div class="dropdown col menu">
			<div class="dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</div>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item" href="../board/boardFree.do">자유게시판</a></li>
				<li><a class="dropdown-item" href="../board/Bodygood.do">몸자랑게시판</a></li>
				<li><a class="dropdown-item" href="#">질문게시판</a></li>
			</ul>
		</div>
		<div class="col menu">
			<a href="../secondhand/secondhandMainPage.do">중고거래</a>
		</div>
		<div class="col menu">
			<a href="../board/buyBoardPage.do">쇼핑몰</a>
		</div>
		<div class="col menu">
			<a href="../board/dropBoardPage.do">이벤트</a>
		</div>
	</div>
</div>






				

    
