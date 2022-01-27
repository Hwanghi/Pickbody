<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}

/* .aaa { */ 
/* 	font-family: 'Nanum Pen Script', cursive; */
/* } 부분적용 폰트	*/

/* 별점 */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}
</style>


</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<!-- 네비바 -->
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col mx-2">
					<div class="row mt-2">
						<div class="col mb-3 border-bottom border-dark"></div>
					</div>

					<div class="row">
						<!-- 이미지 -->
						<!-- 왼쪽 사진만 -->
						<div class="col">
							<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
								<div class="carousel-inner text-center">
									<c:forEach items="${selldata.sellImageVo }" var="sellImageVo"
										varStatus="i">
										<c:choose>
											<c:when test="${i.count == 1}">
												<div class="carousel-item active">
													<img src="/upload/${sellImageVo.sellImage_link }"
														style="width: 400px; height: 400px;">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img src="/upload/${sellImageVo.sellImage_link }"
														style="width: 400px; height: 400px;">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleFade" data-bs-slide="prev">
									<span class="carousel-control-prev-icon btn-dark"
										aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleFade" data-bs-slide="next">
									<span class="carousel-control-next-icon btn-dark"
										aria-hidden="true"></span> <span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
						<!-- 왼쪽 사진만 끝 -->
						<div class="col">
							<!-- 상품 정보들 -->
							<div class="row mb-2">
								<!-- 등록날짜 -->
								<div class="col-5">등록일</div>
								<div class="col-1"></div>
								<div class="col">
									<fmt:formatDate value="${selldata.sellVo.sell_date }" pattern="yyyy년 MM년dd일" />
								</div>
							</div>
							<div class="row mb-2">
								<!-- 상품이름 -->
								<div class="col-5">상품이름</div>
								<div class="col-1"></div>
								<div class="col">${selldata.sellVo.sell_name }</div>
		
							</div>
							<div class="row mb-2">
								<div class="col-5">
									<!-- 조회수 -->
									조회수
								</div>
								<div class="col-1">
									<i class="text-danger ptn bi bi-eye-fill"></i>
								</div>
								<div class="col">${selldata.sellVo.sell_view }</div>
							</div>
		
							<div class="row mb-2">
								<div class="col-5">
									<!-- 좋아요 -->
									좋아요
								</div>
								<div class="col-1">
									<i class="bi bi-suit-heart-fill"></i>
								</div>
								<div class="col">좋아요횟수</div>
							</div>
		
							<div class="row mb-2">
								<div class="col-5">
									<!-- 수량 -->
									수량
								</div>
								<div class="col-1"></div>
								<div class="col">${selldata.sellVo.sell_Quantity }</div>
							</div>
		
							<div class="row mb-2">
								<div class="col-5">가격</div>
								<div class="col-1"></div>
								<div class="col">${selldata.sellVo.sell_price }</div>
							</div>
		
							<div class="row">
								<div class="col mb-3 border-bottom border-dark"></div>
							</div>

							<div class="row my-3">
								<div class="col d-grid" style="padding-right: 0px;">
									<button type="button" class="me-3 btn btn-outline-danger">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="30" fill="currentColor" class="bi bi-suit-heart"	viewBox="0 0 16 16">
													 <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
										</svg>
										좋아요
									</button>
								</div>
		
								<div class="col d-grid" style="padding-left: 0px;">
									<button type="button" class="ms-3 btn btn-outline-warning">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="30"	fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
											<path	d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"></path>
											<path	d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"></path>
										</svg>
										장바구니
									</button>
								</div>
							</div>
		
							<div class="row">
								<div class="col d-grid">
									<button type="button" class="btn btn-outline-dark">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="30" fill="currentColor" class="bi bi-hand-index-thumb" viewBox="0 0 16 16">
											<path d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z" />
										</svg>
										구매
									</button>
								</div>
							</div>
						</div>
					</div>
		
					<!-- 내용 -->
					<div class="row my-2 py-2 border-top  border-bottom border-dark">
						<div class="col">
							${selldata.sellVo.sell_content }
						</div>
					</div>
					
					<!-- 구매후기, 상품문의, 상품정보 제공고시, 판매자 정보 -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="pills-home-tab"
								data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
								role="tab" aria-controls="pills-home" aria-selected="true">구매후기</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-profile-tab"
								data-bs-toggle="pill" data-bs-target="#pills-profile"
								type="button" role="tab" aria-controls="pills-profile"
								aria-selected="false">상품문의</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-contact-tab"
								data-bs-toggle="pill" data-bs-target="#pills-contact"
								type="button" role="tab" aria-controls="pills-contact"
								aria-selected="false">상품정보 제공고시</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="pills-contact2-tab"
								data-bs-toggle="pill" data-bs-target="#pills-contact2"
								type="button" role="tab" aria-controls="pills-contact2"
								aria-selected="false">판매자 정보</button>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<div class="row mt-3">
								<div class="col fs-3">
									<!-- 구매후기  출력 부분 -->
									구매후기
								</div>
							</div>
		
							<c:forEach items="" var="commentdata">
								<div class="row">
									<!-- 구매자 닉네임 -->
									<div class="col fw-bold">
										<i class="bi bi-person-circle">${commentdata.memberVo.member_nick }</i>
									</div>
									<div class="col text-end">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${commentdata.bodygoodCommentVo.comment_date }" />
									</div>
								</div>
		
								<div class="row">
									<div class="col"></div>
								</div>
		
								<div class="row mb-3">
									<div class="col">
										${commentdata.bodygoodCommentVo.comment_content }</div>
								</div>
							</c:forEach>
		
							<!-- 구매후기  입력  부분 -->
							<div class="row mt-3">
								<div class="col fs-5">후기를 입력해보세요.</div>
							</div>
							<form action="" method="post">
								<!-- 별점 -->
								<div class="row">
									<div class="col mb-2">
										<div class="star-rating">
											<input type="radio" text="5점" id="5-stars" name="rating"
												value="5" /> <label for="5-stars" class="star">&#9733;</label>
											<input type="radio" text="4점" id="4-stars" name="rating"
												value="4" /> <label for="4-stars" class="star">&#9733;</label>
											<input type="radio" text="3점" id="3-stars" name="rating"
												value="3" /> <label for="3-stars" class="star">&#9733;</label>
											<input type="radio" text="2점" id="2-stars" name="rating"
												value="2" /> <label for="2-stars" class="star">&#9733;</label>
											<input type="radio" text="1점" id="1-star" name="rating"
												value="1" /> <label for="1-star" class="star">&#9733;</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col d-grid">
										<input type="hidden" name="bodygood_no"
											value="${data.bodygoodVo.bodygood_no }">${session.member_nick }
										<textarea rows="2" cols="140" name="comment_content"></textarea>
									</div>
									<div class="col-1 text-end d-grid">
										<input class="btn btn-primary" type="submit" value="후기등록">
									</div>
								</div>
		
								<!-- 페이지버튼들 -->
								<div class="row mt-2">
									<div class="col-2"></div>
									<div class="col">
										<!-- 페이지넘기는거 -->
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
												<li class="page-item"><a class="page-link" href="#">1</a></li>
												<li class="page-item"><a class="page-link" href="#">2</a></li>
												<li class="page-item"><a class="page-link" href="#">3</a></li>
												<li class="page-item"><a class="page-link" href="#"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
									</div>
									<div class="col-2"></div>
								</div>
							</form>
						</div>
		
		
						<!-- 상품문의 -->
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<div class="row mt-3">
								<div class="col fs-3">
									<!-- 상품문의  출력 부분 -->
									상품문의
								</div>
							</div>
		
							<c:forEach items="" var="commentdata">
								<div class="row">
									<!-- 상품문의를 쓴 구매자 댓글출력 -->
									<div class="col fw-bold">
										<i class="bi bi-person-circle">${commentdata.memberVo.member_nick }</i>
									</div>
									<div class="col text-end">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${commentdata.bodygoodCommentVo.comment_date }" />
									</div>
								</div>
		
								<div class="row">
									<div class="col"></div>
								</div>
		
								<div class="row mb-3">
									<div class="col">
										${commentdata.bodygoodCommentVo.comment_content }</div>
								</div>
							</c:forEach>
		
							<!-- 구매자 댓글  입력  부분 -->
							<div class="row mt-3">
								<div class="col fs-5">문의할 상품에 대해 적어주세요.</div>
							</div>
							<form action="" method="post">
								<div class="row">
									<div class="col d-grid">
										<input type="hidden" name="bodygood_no"
											value="${data.bodygoodVo.bodygood_no }">${session.member_nick }
										<textarea rows="2" cols="140" name="comment_content"></textarea>
									</div>
									<div class="col-1 text-end d-grid">
										<input class="btn btn-primary" type="submit" value="댓글등록">
									</div>
		
								</div>
							</form>
							<!-- 관리자가 쓸 상품문의 덧글추가해야함 출력과 입력둘다 -->
						</div>
		
						<div class="tab-pane fade" id="pills-contact" role="tabpanel"
							aria-labelledby="pills-contact-tab">
							<div class="row mt-3">
								<div class="col" >
									<!-- 상품문의  출력 부분 -->
									상품정보 제공고시
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">품명</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">크기</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">중량</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">색상</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">제조사</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">제조국</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">품질보증기준</div>
										<div class="col">상품상세참조</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">AS책임자 전화번호</div>
										<div class="col">02-345-6789</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-contact2" role="tabpanel"
							aria-labelledby="pills-contact2-tab">
							<div class="row mt-3">
								<div class="col">
									<!-- 판매자 정보  출력 부분 -->
									판매자 정보
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">상호 / 대표자</div>
										<div class="col">PICKBODY / 정연호</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">브랜드</div>
										<div class="col">헬쑤</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">사업자번호</div>
										<div class="col">123-45-67890</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">연락처</div>
										<div class="col">1577-1004</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">E-Mail</div>
										<div class="col">PICKBODY@google.com</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">영업소재지</div>
										<div class="col">중앙정보기술개발원 6층 제 1실습실</div>
									</div>
									<div class="row my-5" style="font-size: 15px;">
										<div class="col-3">교환 / 반품</div>
										<div class="col">중앙정보기술개발원 6층 제 1실습실</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		
					<!-- 목록 삭제 수정 -->
					<div class="row text-end mt-3" style="padding-right: 0px;">
						<div class="col" style="padding-right: 0px">
							<a class="btn btn-warning" href="./sellPage.do" role="button">목록</a>
							<c:if test="${!empty sessionAdmin }">
								<a class="btn btn-success"
									href="./sellUpdateContentPage.do?sell_no=${selldata.sellVo.sell_no }"
									role="button">수정</a>
								<a class="btn btn-danger"
									href="./deleteSellboardProcess.do?sell_no=${selldata.sellVo.sell_no }"
									role="button">삭제</a>
							</c:if>
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