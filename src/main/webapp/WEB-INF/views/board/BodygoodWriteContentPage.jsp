<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>
</head>
<body>

	<!-- <img src="/upload/aaa.gif"> 글쓰기할때바로보임-->
	<!-- 네비바 -->
	<div style="width: 1200px; margin: 0 auto;">
		<!-- 네비바 -->
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
							<form action="./BodygoodWriteContentProcess.do" method="post"
							enctype="multipart/form-data">
							<!-- 글쓰기 제목 -->
							<div class="row mt-5">
								<div class="col d-grid">
									<input type="text" name="bodygood_title"
										placeholder="제목을 먼저 작성해주세요.">
								</div>
							</div>

							<!-- 작성자닉네임 -->
							<div class="row">
								<div class="col fs-3">
									<i class="bi bi-person-circle">${memberUser.member_nick }</i>
								</div>
							</div>

							
							<!-- 내용입력칸 -->
							<div class="form-floating">								
								<textarea class="form-control" name="bodygood_content" 
									style="height: 300px"></textarea>
								<label for="floatingTextarea2">내용을 입력하세요.</label>
							</div>
							
							
							<!-- 파일 업로드 선택칸 -->
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label for="formFile" class="form-label">몸자랑 게시판에는 꼭
											사진 1장을 업로드 하셔야 등록 가능합니다.</label> <input class="form-control"
											type="file" multiple accept="image/*" name="files">
										<!-- 멀티플다중선택 어셉트하면 
										  디폴트설정 그것만보이게  서버에 서버xml에서 컨택스트설정 호스트조심 서블릿컨택스트에서도 파일 업로드 빈추가확인-->
									</div>
								</div>
								
								<!-- 등록하기 -->
								<div class="row padding-0">
									<div class></div>
									<div class="col text-end ">
										<input class="btn btn-primary" type="submit" value="등록하기">
									</div>
								</div>

							</div>
							</form>
					</div>
					<div class="col-1"></div>
				</div>
				
</div>
</div>





<jsp:include page="../common/global_footer.jsp"></jsp:include>
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
</body>
</html>