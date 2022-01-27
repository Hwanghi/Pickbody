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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 페이지네이션 */
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: #F25C19;
  border-color: #F25C19;
}
</style>
</head>
<body>

	<div style="width: 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2">
					<!-- 왼쪽 -->
						<!-- 네비바 -->
						<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>

				<div class="col">
					<div class="row my-2 mx-2">
						<!-- 검색 -->
						<div class="col">
							<div class="row">
								<div class="col">
									<input class="form-control" type="text" placeholder="검색어를 입력하세요">
								</div>
								<div class="col-2 d-grid">
									<input class="btn" type="submit" value="검색"
										style="background-color: #F25C19; color: #FFFFFF;">
								</div>
							</div>
						</div>
					</div>
					<div class="row mx-2 my-2">
						<div class="col d-grid"><a class="btn text-white" href="./sellBoardWritePage.do" style="background-color: #F25C19;">상품등록</a></div>
						<div class="col d-grid"><a class="btn" style="background: #F2CB05; color: #000000;" href="./buyListViewPage.do">구매자 리스트</a></div>
					</div>
					<div class="row">
						<c:forEach items="${sellList}" var="selldata">
							<div class="col">
								<!-- 이미지내용들 -->
								<div class="card" style="width:13rem; margin-left: 20px; margin-bottom: 20px; float: left;">
									<a class="card" style="color: #000000; text-decoration: none;" href="./sellBoardReadPage.do?sell_no=${selldata.sellVo.sell_no}">
										<img src="/upload/${selldata.sellImageVo.sellImage_link }" style="height:270px;" class="card-img-top">
										<div class="card-body">
											<h5 class="card-title">${selldata.sellVo.sell_name}</h5>
											<p class="card-text"></p>
										</div>
											<ul class="list-group list-group-flush">
												<li class="list-group-item">${selldata.sellVo.sell_price}원</li>
												<li class="list-group-item">${selldata.sellVo.sell_Quantity}</li>
												<!-- 날짜 포멧 변환 :kst 2021safasf => 2021/00/00로 뜸   -->
												<li class="list-group-item"><fmt:formatDate
														pattern="yyyy/MM/dd" value="${selldata.sellVo.sell_date}" /></li>
											</ul>
										<div class="card-body px-1">
											<div class="row">
												<div class="col">
													<i class="bi bi-hand-thumbs-up">50</i>
												</div>
												<div class="col">
													<i class="bi bi-chat-dots">120</i>
												</div>
												<div class="col">
													<i class="bi bi-eye-fill">300</i>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
						</c:forEach>
					</div>




					<div class="row mt-2 ">
						<!-- 버튼들 -->
							<div class="col-2"></div>
							<div class="col">
								<nav>
			                        <ul class="pagination my mb-0 justify-content-center">
			                           <li class="page-item"><a class="page-link" style="color: #000000;">Previous</a>
			                           </li>
			                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">1</a></li>
			                           <li class="page-item active" aria-current="page"><a class="page-link text-white" style="color: #000000;" href="#">2</a></li>
			                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">3</a></li>
			                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">4</a></li>
			                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">5</a></li>
			                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">Next</a>
			                           </li>
			                        </ul>
			                     </nav>
							</div>
							<div class="col-2"></div>

					</div>
				</div>


				<div class="col-1"></div>
			</div>
		</div>
		<jsp:include page="../common/global_footer.jsp"></jsp:include>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>