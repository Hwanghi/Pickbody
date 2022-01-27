<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-color: #FFFFFF;
}

.center {
	text-align: center;
	height: 50vh;
	line-height: 50vh;
}

.center span {
	width: 100px;
	height: 100px;
	background-color: #F25C19;
	border-radius: 50%;
	text-align: center;
	color: white;
	line-height: 100px;
	display: inline-block;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.26);
}
</style>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
			<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
					<a href="./buyBoardPage.do">
					<div class="center">
						<span>주문완료!</span>
					</div>
					</a>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/global_footer.jsp"></jsp:include>
</body>
</html>