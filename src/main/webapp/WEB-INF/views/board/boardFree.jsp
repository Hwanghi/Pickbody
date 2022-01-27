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

</head>
<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 페이지네이션 */
.my.pagination>.active>a, .my.pagination>.active>span, .my.pagination>.active>a:hover,
	.my.pagination>.active>span:hover, .my.pagination>.active>a:focus, .my.pagination>.active>span:focus
	{
	background: #F25C19;
	border-color: #F25C19;
}
</style>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
		
			<div class="row my-2">
				<div class="col-1"></div>
				<div class="col-8">
					<div class="row mt-1 mb-2">
						<!-- 검색 -->
						<div class="col">
							<input class="form-control" type="text" placeholder="검색어를 입력하세요">
						</div>
						<div class="col-2 d-grid">
							<input class="btn" type="submit" value="검색"
								style="background-color: #F25C19; color: #FFFFFF;">
						</div>
					</div>
				<table class="table table-hover" border="1" width="400" height="300">
					<thead>
						<tr>
							<td>글 번호</td>
							<td>제목</td>
							<td><i class="bi bi-person-circle"></i>작성자</td>
							<td><i class="bi bi-eye-fill"></i>조회수</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list2}" var="data">
							<tr>
								<td><img
									src="https://img.icons8.com/external-tal-revivo-shadow-tal-revivo/24/000000/external-hot-sticker-of-the-new-stock-items-for-sale-badges-shadow-tal-revivo.png" />${data.FreeBoardVo.free_no}</td>
								<td> <a
									href="./freeBoardReadContentPage.do?free_no=${data.FreeBoardVo.free_no }">${data.FreeBoardVo.free_title }</a>
								</td>
								<td><i class="bi bi-person-circle"></i>${data.memberVo.member_nick }</td>
								<td>${data.FreeBoardVo.free_view }</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${data.FreeBoardVo.free_date}" /></td>
							</tr>
	
						</c:forEach>
					</tbody>
					<tbody>
	
						<c:forEach items="${list}" var="data">
							<tr>
								<td>${data.FreeBoardVo.free_no }</td>
	
	
								<td><c:if test="${!empty data.newttt}">
										<span class="badge bg-danger">New</span>
									</c:if> <a
									href="./freeBoardReadContentPage.do?free_no=${data.FreeBoardVo.free_no }">${data.FreeBoardVo.free_title }</a>
									[${data.getrippleAmount }] <c:if
										test="${!empty data.FreeImagesByNo}">
										<i class="bi bi-image"></i>
									</c:if> <c:if test="${data.FreeBoardVo.free_view>30}">
										<i class="bi bi-award"></i>
									</c:if></td>
	
	
	
								<td><i class="bi bi-person-circle">${data.memberVo.member_nick }</i></td>
								<td>${data.FreeBoardVo.free_view }</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${data.FreeBoardVo.free_date}" /></td>
							</tr>
	
						</c:forEach>
					</tbody>
				</table>
					<div class="row mt-3">
						<div class="col-4"></div>
						<div class="col">
							<nav>
								<ul class="pagination my mb-0 justify-content-center">
									<li class="page-item"><a class="page-link"
										style="color: #000000;">Previous</a></li>
									<li class="page-item"><a class="page-link"
										style="color: #000000;" href="#">1</a></li>
									<li class="page-item active" aria-current="page"><a
										class="page-link" style="color: #000000;" href="#">2</a></li>
									<li class="page-item"><a class="page-link"
										style="color: #000000;" href="#">3</a></li>
									<li class="page-item"><a class="page-link"
										style="color: #000000;" href="#">4</a></li>
									<li class="page-item"><a class="page-link"
										style="color: #000000;" href="#">5</a></li>
									<li class="page-item"><a class="page-link"
										style="color: #000000;" href="#">Next</a></li>
								</ul>
							</nav>
		
						</div>
						<div class="col"></div>
						<div class="col"></div>
						<div class="col"></div>
						<div class="col d-grid">
							<script type="text/javaScript">
								function doWrite() {
									location.href = "./freeBoardWriteContentPage.do";
								}
								function nullWrite() {
									alert("로그인 한 후 이용해주세요");
								}
							</script>
							<c:choose>
								<c:when test="${!empty memberUser }">
									<input class="btn text-white" type="button" value="글쓰기" style="background-color: #F25C19;"
										onclick="doWrite();">
								</c:when>
								<c:otherwise>
									<input class="btn text-white" type="button" value="글쓰기" style="background-color: #F25C19;"
										onclick="nullWrite();">
								</c:otherwise>
		
							</c:choose>
						</div>
					</div>
				</div>
				<div class="col-3 ps-0">
					<img src="../resources/img/min_yeong.png/" style="width:190px; height: 100%;">
				</div>
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