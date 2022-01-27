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
			<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
			<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
						<div class="row my-2">
							<!-- 검색 -->
							<div class="col">
								<input class="form-control" type="text" placeholder="검색어를 입력하세요">
							</div>
							<div class="col-2 d-grid">
								<input class="btn" type="submit" value="검색" 	style="background-color: #F25C19; color: #FFFFFF;">
							</div>
						</div>


						<div class="row">
							<div class="col">
								<c:forEach items="${sellList}" var="selldata">
									<!-- 이미지내용들 -->
									<div class="card"
										style="width:14rem; margin-left: 15px; margin-bottom: 15px; float: left;">
										<a class="card" style="color: #000000; text-decoration: none;"
											href="./readBuyBoardPage.do?sell_no=${selldata.sellVo.sell_no}">
											<img
											src="/upload/${selldata.sellImageVo.sellImage_link }" style="height:300px;"
											class="card-img-top">
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
														<i class="bi bi-hand-thumbs-up">${selldata.totalbuylikeCount}</i>
													</div>
													<div class="col">
														<i class="bi bi-chat-dots">${ selldata.getAmountRiview}</i>
													</div>
													<div class="col">
														<i class="bi bi-eye-fill">${selldata.sellVo.sell_view}</i>
													</div>
												</div>

											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					



					<div class="row mt-2 ">
						<!-- 버튼들 -->
						<div class="col-3"></div>
						<div class="col">
							<!-- 페이지넘기는거 -->
							<nav>
								<ul class="pagination my mb-0 justify-content-center">
									<li class="page-item"><a class="page-link" style="color: #000000;">Previous</a>
									</li>
									<li class="page-item"><a class="page-link" style="color: #000000;" href="#">1</a></li>
									<li class="page-item active" aria-current="page"><a class="page-link" style="color: #000000;" href="#">2</a></li>
									<li class="page-item"><a class="page-link" style="color: #000000;" href="#">3</a></li>
									<li class="page-item"><a class="page-link" style="color: #000000;" href="#">4</a></li>
									<li class="page-item"><a class="page-link" style="color: #000000;" href="#">5</a></li>
									<li class="page-item"><a class="page-link" style="color: #000000;" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class="col-3 text-end mt-0">
						
							<script type="text/javaScript">
								function doBuyListPage() {
									location.href = "./buyListPage.do";
								}
								function doWillBuyPage() {
									location.href = "./willBuyListPage.do";
								}
							</script>


							<input class="btn-sm btn btn-outline-light " type="button" value="내 주문목록"
								style="background: #BEBEBE; color: #000000;" onclick="doBuyListPage();">
							<input class="btn-sm  btn btn-outline-light" type="button" value="장바구니"
								style="background: #F2CB05; color: #000000;" onclick="doWillBuyPage();">
						</div>

					</div>

				
				
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