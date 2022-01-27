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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>
</head>


<!-- 수량 -->
<!-- 로그인 안되었을때 로그인하라고 경고 -->

<script>
function doSubmit(){
   //js 핵심 : DOM 제어...
   //element 접근...
   
   alert("로그인을 해주세요");

  

}

function moveBuy(){
	
	var ttt = document.getElementById("amountBox").value;
	
	var yyy = document.getElementById("sellPrice").innerText;
	var xxx= ttt*yyy;
	location.href="./buyOrderPage.do?sell_no=${buydata.sellVo.sell_no}&amount="+ttt+"&currentPrice="+xxx;
	
}

 function moveWillBuy(){
	
	var ttt = document.getElementById("amountBox").value;
	
	var yyy = document.getElementById("sellPrice").innerText;
	
	var xxx=ttt*yyy
	
	
	location.href="./willBuyListProcess.do?sell_no=${buydata.sellVo.sell_no}&amount=" +ttt+"&price="+xxx;
	
	 alert("장바구니에 담겼습니다.");

	
} 


</script>
<style>
/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
a{
	text-decoration:none;
}
/* 페이지네이션 */
.my.pagination>.active>a, .my.pagination>.active>span, .my.pagination>.active>a:hover,
	.my.pagination>.active>span:hover, .my.pagination>.active>a:focus, .my.pagination>.active>span:focus
	{
	background: #F25C19;
	border-color: #F25C19;
}

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
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			

			<div class="row fs-5 border mt-3">
				<div class="col-1"></div>
				<div class="col">
					<div class="row">
						<div class="col mb-3 border-bottom border-dark"></div>
					</div>

					<div class="row">
						<!-- 이미지 -->
						<!-- 왼쪽 사진만 -->
						<div class="col">

							<div id="carouselExampleFade"
								class="carousel slide carousel-fade" data-bs-ride="carousel">

								<div class="carousel-inner text-center">

									<c:forEach items="${buydata.sellImageVo }" var="sellImageVo"
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
									<fmt:formatDate value="${buydata.sellVo.sell_date }"
										pattern="yyyy년 MM년dd일" />
								</div>
							</div>
							<div class="row mb-2">
								<!-- 상품이름 -->
								<div class="col-5">상품이름</div>
								<div class="col-1"></div>
								<div class="col">${buydata.sellVo.sell_name }</div>

							</div>
							<div class="row mb-2">
								<div class="col-5">
									<!-- 조회수 -->
									조회수
								</div>
								<div class="col-1">
									<i class="text-danger ptn bi bi-eye-fill"></i>
								</div>
								<div class="col">${buydata.sellVo.sell_view }</div>


							</div>

							<div class="row mb-2">
								<div class="col-5">
									<!-- 좋아요 -->
									좋아요
								</div>
								<div class="col-1">
									<i class="bi bi-suit-heart-fill"></i>
								</div>
								<div class="col">${totalbuylikeCount}</div>
							</div>

							<div class="row mb-2">
								<div class="col-5">
									<!-- 수량 -->
									재고
								</div>
								<div class="col-1"></div>
								<div class="col">${buydata.sellVo.sell_Quantity }</div>
							</div>

							<div class="row mb-2">
								<div class="col-5">가격</div>
								<div class="col-1"></div>
								<div class="col" id="sellPrice">${buydata.sellVo.sell_price }</div>
							</div>

							<!--사는 수량-->

							<div class="row mb-3 border-bottom border-dark">
								<div class="col-5">수량</div>

								<div class="col">
									<p class="cartStock">
										<button type="button" class="minus">-</button>
										<input id="amountBox" type="number" class="numBox" min="1"
											max="${buydata.sellVo.sell_Quantity }" value="1"
											readonly="readonly" />
										<button type="button" class="plus">+</button>

										<script>
							  $(".plus").click(function(){
							   var num = $(".numBox").val();
							   var plusNum = Number(num) + 1;
							   
							   if(plusNum > ${buydata.sellVo.sell_Quantity}) {
							    $(".numBox").val(num);
							   } else {
							    $(".numBox").val(plusNum);          
							   }
							  });
							  
							  $(".minus").click(function(){
							   var num = $(".numBox").val();
							   var minusNum = Number(num) - 1;
							   
							   if(minusNum <= 0) {
							    $(".numBox").val(num);
							   } else {
							    $(".numBox").val(minusNum);          
							   }
							  });
							 </script>

									</p>
									<input type="hidden" name="sell_no"	value="${buydata.sellVo.sell_no}">
									<input type="hidden" name="member_no"	value="${memberUser.member_no }">

								</div>
							</div>

							<!-- 생각좀해보자 -->








							<div class="row my-3">
								<div class="col d-grid" style="padding-right: 0px;">

									<form id="nullLike">
										<c:if test="${empty memberUser }">
											<button type="button" style="width: 90%"
												class="me-3 btn btn-outline-danger" onclick="doSubmit()">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="30" fill="currentColor" class="bi bi-suit-heart"
													viewBox="0 0 16 16">
                                     <path
														d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
                                 </svg>

												좋아요
											</button>
										</c:if>
									</form>

									<c:if test="${!empty memberUser }">
										<c:choose>

											<c:when test="${mybuylikeCount>0 }">
												<a href="./buylike.do?sell_no=${buydata.sellVo.sell_no }"><button
														type="button" style="width: 90%"
														class="me-3 btn btn-outline-danger">
														<svg xmlns="http://www.w3.org/2000/svg" width="20"
															height="30" fill="currentColor" class="bi bi-suit-heart"
															viewBox="0 0 16 16">
											    <path
																d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
														좋아요 취소
													</button></a>
											</c:when>
											<c:otherwise>
												<a href="./buylike.do?sell_no=${buydata.sellVo.sell_no }">
													<button type="button" style="width: 90%"
														class="me-3 btn btn-outline-danger">
														<svg xmlns="http://www.w3.org/2000/svg" width="20"
															height="30" fill="currentColor" class="bi bi-suit-heart"
															viewBox="0 0 16 16">
											 <path
																d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
											</svg>
														좋아요
													</button>
												</a>
											</c:otherwise>
										</c:choose>
									</c:if>
								</div>


								<div class="col d-grid" style="padding-left: 0px;">

									<button onclick="moveWillBuy()" type="button"
										class="ms-3 btn btn-outline-warning">

										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="30"
											fill="currentColor" class="bi bi-cart-check"
											viewBox="0 0 16 16">
											  <path
												d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"></path>
											  <path
												d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"></path>
											</svg>
										장바구니
									</button>
								</div>

							</div>


							<div class="row">
								<div class="col d-grid">
									<button type="button" class="btn btn-outline-dark d-grid">
										<a onclick="moveBuy()"> <svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="30"
												fill="currentColor" class="bi bi-hand-index-thumb"
												viewBox="0 0 16 16">
													 <path
													d="M6.75 1a.75.75 0 0 1 .75.75V8a.5.5 0 0 0 1 0V5.467l.086-.004c.317-.012.637-.008.816.027.134.027.294.096.448.182.077.042.15.147.15.314V8a.5.5 0 0 0 1 0V6.435l.106-.01c.316-.024.584-.01.708.04.118.046.3.207.486.43.081.096.15.19.2.259V8.5a.5.5 0 1 0 1 0v-1h.342a1 1 0 0 1 .995 1.1l-.271 2.715a2.5 2.5 0 0 1-.317.991l-1.395 2.442a.5.5 0 0 1-.434.252H6.118a.5.5 0 0 1-.447-.276l-1.232-2.465-2.512-4.185a.517.517 0 0 1 .809-.631l2.41 2.41A.5.5 0 0 0 6 9.5V1.75A.75.75 0 0 1 6.75 1zM8.5 4.466V1.75a1.75 1.75 0 1 0-3.5 0v6.543L3.443 6.736A1.517 1.517 0 0 0 1.07 8.588l2.491 4.153 1.215 2.43A1.5 1.5 0 0 0 6.118 16h6.302a1.5 1.5 0 0 0 1.302-.756l1.395-2.441a3.5 3.5 0 0 0 .444-1.389l.271-2.715a2 2 0 0 0-1.99-2.199h-.581a5.114 5.114 0 0 0-.195-.248c-.191-.229-.51-.568-.88-.716-.364-.146-.846-.132-1.158-.108l-.132.012a1.26 1.26 0 0 0-.56-.642 2.632 2.632 0 0 0-.738-.288c-.31-.062-.739-.058-1.05-.046l-.048.002zm2.094 2.025z" />
													</svg> 구매하기
										</a>
									</button>
								</div>
							</div>
						</div>
					</div>


					<!-- 내용 규칙 -->
					<div class="row my-5">
						<div class="col">
						<!-- 내용 -->
						<div class="row my-2 border-top border-dark">
							<div class="col">${buydata.sellVo.sell_content }</div>
						</div>


						<div class="row mt-4 border-top border-dark">
							<div class="col">
							<div class="row mt-5 mb-5">
								<div class="col-3 fs-3 text-end text-info"
									style="padding-right: 0px">PICKBODY</div>
								<div class="col fs-3 text-left">의 모든 제품들은 정품이므로 안심하시고
									구매하셔도 됩니다.</div>
							</div>
							</div>
						</div>
						<div class="row border border-1 mb-4"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="col">
								<div class="row border-bottom">
									<div class="col-3" style="background-color: #C0C0C0;">배송관련</div>
									<div class="col" style="background-color: #C0C0C0;"></div>
								</div>
								<div class="row mt-3" style="font-size: 15px;">
									<div class="col-3">택배배송</div>
									<div class="col">1. PICK BODY는 전 제품 100% 무료배송입니다.</div>
								</div>
								<div class="row" style="font-size: 15px;">
									<div class="col-3"></div>
									<div class="col">2. 브랜드 및 제품에 따라 입점 업체(브랜드) 배송과 PICK BODY
										자체 배송으로 나뉩니다.</div>
								</div>
								<div class="row" style="font-size: 15px;">
									<div class="col-3"></div>
									<div class="col">3. 결제확인 후 1~3일 정도 소요됩니다. (예약상품, 해외배송 상품은
										배송기간이 다를 수 있습니다.)</div>
								</div>
							</div>
						</div>


						<div class="row border border-1 mb-4"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="col">
								<div class="row border-bottom">
									<div class="col-3" style="background-color: #C0C0C0;">결제관련</div>
									<div class="col" style="background-color: #C0C0C0;"></div>
								</div>
								<div class="row border-bottom py-4" style="font-size: 15px;">

									<div class="col-3 align-self-center">카드결제</div>
									<div class="col align-self-center">전체 카드사 사용가능 (일부 카드사
										무이자 할부)</div>
								</div>
								<div class="row border-bottom" style="font-size: 15px;">
									<div class="col-3 align-self-center">가상계좌(무통장입금)</div>
									<div class="col align-self-center">주문 시마다 새로운 계좌번호를 발급하는
										방식으로 해당 계좌에 입금 즉시 입금확인이 되는 방식 입니다. 단, 1원 단위까지 정확히 입금하셔야만 입금이
										정상적으로 처리됩니다.</div>
								</div>
								<div class="row" style="font-size: 15px;">
									<div class="col-3 align-self-center">해외카드결제</div>
									<div class="col align-self-center">대한민국 외에서 발급 된 해외 카드로도
										결제가 가능합니다. (VISA, MasterCard, JCB, 은련)</div>
								</div>
							</div>
						</div>


						<div class="row border border-1 mb-4"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="col">
								<div class="row border-bottom">
									<div class="col-3" style="background-color: #C0C0C0;">교환/환불</div>
									<div class="col" style="background-color: #C0C0C0;"></div>
								</div>
								<div class="row border-bottom py-4" style="font-size: 15px;">

									<div class="col-3 align-self-center">자동회수 택배사</div>
									<div class="col align-self-center">CJ대한통운</div>
								</div>
								<div class="row border-bottom" style="font-size: 15px;">
									<div class="col-3 align-self-center">배송비</div>
									<div class="col align-self-center">왕복 5,000원 (교환/환불 요청
										상품의 수량에 따라서 상이, 구매자 책임 사유일 경우에만 발생)</div>
								</div>
								<div class="row border-bottom" style="font-size: 15px;">
									<div class="col-3 align-self-center">보내실 곳</div>
									<div class="col align-self-center">중앙정보기술개발원 6층 제 1실습실</div>
								</div>


								<div class="row border-bottom" style="font-size: 15px;">
									<div class="col-3 align-self-center">교환/환불시 주의사항</div>
									<div class="col">
										<ul style="list-style: none; padding-left: 0px;">

											<li>상품 수령 후 7일 이내 교환/환불을 요청해야 합니다.</li>
											<li>동일 업체일 경우라도 상품별로 반품비용이 상이하게 발생할 수 있습니다.</li>
											<li>교환/환불 시 반품비용은 선결제함으로 동봉하지 마시고, 동봉하여 발송하신 경우 확인 후 반품비
												환불 처리됩니다.</li>
											<li>자동회수 접수 시 영업일 기준 2~3일 내에 택배기사님 연락 후 방문하여 회수 진행됩니다.</li>
											<li>수령하신 택배사가 아닌 다른 택배사로 발송하시는 경우(신규 택배 접수 포함) 추가 비용이 발생
												할 수 있습니다.</li>
											<li>반품 주소지는 브랜드(업체)마다 다르므로 확인 후 각각 보내셔야 합니다.</li>
											<li>상품의 내용이 표시, 광고 내용과 다르거나 계약 내용이 다를 경우 상품을 공급받은 날부터
												3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 내 청약 철회를 할 수 있습니다.</li>
											<li>상품을 반환받은 날로부터 영업일 기준 3일 내 지급받은 대금을 환급합니다.</li>
											<li>미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수
												있습니다.</li>
											<li>도서산간 지역의 경우 결제하신 기본 교환/환불 배송비 외에 편도 기준 최대 8천원(왕복 기준
												최대 16천원)까지 추가 비용이 발생할 수 있습니다. 택배사, 판매업체, 지역별로 도서산간 발생 금액이
												상이해 구매 시점에서는 정확한 금액 안내가 어렵습니다.</li>
										</ul>
									</div>
								</div>


								<div class="row" style="font-size: 15px;">
									<div class="col-3 align-self-center">
										<div class="row">
											<div class="col">교환/환불이</div>
										</div>
										<div class="row">
											<div class="col">불가능한 경우</div>
										</div>
									</div>
									<div class="col">
										<ul style="list-style: none; padding-left: 0px;">
											<li>사용 흔적이 있거나 훼손, 오염된 경우</li>
											<li>상품의 택(Tag)을 분실, 훼손한 경우</li>
											<li>사은품을 사용, 분실한 경우</li>
											<li>상품이 없거나 훼손(테이핑)된 경우</li>
											<li>사용 흔적이 있거나 훼손, 오염된 경우</li>
											<li>반품요청 기간(수령 후 7일 이내)이 초과된 경우</li>
											<li>맞춤 주문제작, 착용 상품인 경우</li>
											<li>개봉 후 가치가 현저히 감소한 경우</li>
										</ul>
									</div>
								</div>
							</div>
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

							<!-- 별점 출력 -->
							<div class="star-rating">
								<c:if test="${data.reviewVo.review_star==5 }">
									<label for="5-stars" class="star">&#9733;</label>
								</c:if>
							</div>
							<c:forEach items="${list2}" var="data">
								<div class="row">
									<!-- 구매자 닉네임 -->
									<div class="col fw-bold">
										<i class="bi bi-person-circle" style="font-size: 2rem">${data.memberVo.member_nick }</i>
										<c:if test="${data.reviewVo.review_star==5 }">
											<img src="../resources/img/5star.jpg" width="120" height="50">
										</c:if>
										<c:if test="${data.reviewVo.review_star==4 }">
											<img src="../resources/img/4star.jpg" width="120" height="50">
										</c:if>
										<c:if test="${data.reviewVo.review_star==3 }">
											<img src="../resources/img/3star.jpg" width="120" height="50">
										</c:if>
										<c:if test="${data.reviewVo.review_star==2 }">
											<img src="../resources/img/2star.jpg" width="120" height="50">
										</c:if>
										<c:if test="${data.reviewVo.review_star==1 }">
											<img src="../resources/img/1star.jpg" width="120" height="50">
										</c:if>
									</div>
									<div class="col text-end">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${data.reviewVo.review_date }" />
									</div>
								</div>

								<div class="row">
									<div class="col"></div>
								</div>

								<div class="row mb-3">
									<div class="col">${data.reviewVo.review_content }</div>
								</div>
							</c:forEach>

							<!-- 구매후기  입력  부분 -->
							<div class="row mt-3">
								<div class="col fs-5">후기를 입력해보세요.</div>
							</div>
							<form action="./writeReviewProcess.do" method="post">
								<!-- 별점 -->
								<div class="row">
									<div class="col mb-2">
										<div class="star-rating">
											<input type="radio" text="5점" id="5-stars" name="review_star"
												value="5" /> <label for="5-stars" class="star">&#9733;</label>
											<input type="radio" text="4점" id="4-stars" name="review_star"
												value="4" /> <label for="4-stars" class="star">&#9733;</label>
											<input type="radio" text="3점" id="3-stars" name="review_star"
												value="3" /> <label for="3-stars" class="star">&#9733;</label>
											<input type="radio" text="2점" id="2-stars" name="review_star"
												value="2" /> <label for="2-stars" class="star">&#9733;</label>
											<input type="radio" text="1점" id="1-star" name="review_star"
												value="1" /> <label for="1-star" class="star">&#9733;</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col d-grid">
										<input type="hidden" name="sell_no"
											value="${buydata.sellVo.sell_no }">
										<textarea rows="2" cols="140" name="review_content"></textarea>
									</div>
									<div class="col-1 text-end d-grid">
										<input class="btn btn-primary" type="submit" value="후기등록">
									</div>
								</div>
							</form>

							<!-- 페이지버튼들 -->
							<div class="row mt-2">
								<div class="col-2"></div>
								<div class="col">
									<!-- 페이지넘기는거 -->
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center">
											<li class="page-item"><a class="page-link"
												style="color: #000000;" href="#" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
											</a></li>
											<li class="page-item"><a class="page-link"
												style="color: #000000;" href="#">1</a></li>
											<li class="page-item"><a class="page-link"
												style="color: #000000;" href="#">2</a></li>
											<li class="page-item"><a class="page-link"
												style="color: #000000;" href="#">3</a></li>
											<li class="page-item"><a class="page-link"
												style="color: #000000;" href="#" aria-label="Next"> <span
													aria-hidden="true">&raquo;</span>
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

							<c:forEach items="${list}" var="data">
								<div class="row">
									<!-- 상품문의를 쓴 구매자 댓글출력 -->
									<div class="col fw-bold">
										<i class="bi bi-person-circle" style="font-size: 2rem">${data.memberVo.member_nick }</i>
									</div>
									<div class="col text-end">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${data.buyQnaVo.buyqna_date}" />
									</div>
								</div>

								<div class="row">
									<div class="col"></div>
								</div>

								<div class="row mb-3">
									<div class="col">${data.buyQnaVo.buyqna_content }</div>
								</div>
							</c:forEach>

							<!-- 구매자 댓글  입력  부분 -->
							<div class="row mt-3">
								<div class="col fs-5">문의할 상품에 대해 적어주세요.</div>
							</div>
							<form action="./writeBuyQnaProcess.do" method="post">
								<div class="row">
									<div class="col d-grid">
										<input type="hidden" name="sell_no"
											value="${buydata.sellVo.sell_no }">
										<textarea rows="2" cols="140" name="buyqna_content"></textarea>
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
								<div class="col">
									<!-- 상품정보 제공고시 입력한 부분 -->
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




					<!-- 목록 -->
					<div class="row text-end mt-3" style="padding-right: 0px;">
						<div class="col" style="padding-right: 0px">
							<a class="btn btn-warning" href="./buyBoardPage.do" role="button">목록</a>

						</div>
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
		crossorigin="anonymous">
			
		</script>
</body>
</html>