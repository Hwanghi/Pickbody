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

</style>
<script>
function doSubmit(){
	var willbuybuy = document.getElementById("willbuybuy");
	
	willbuybuy.submit();
	
}
</script>
</head>
<body>
   <div style="width: 1200px; margin: 0 auto;">
   		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
      <div class="container">


         <div class="row">
            
             
				<form id="willbuybuy" action="./buyWillOrderProcess.do" method="get">
						<div class="col-1"></div>
						<div class="col">

							<div class="row mt-5">
								<!-- 게시판로고 -->
								<div class="col fs-1 fw-bold text-center">
									<a class="text-dark" href="../board/buyOrderPage.do"
										style="text-decoration: none;">${memberUser.member_nick}님의
										장바구니</a>
								</div>
							</div>


							<div class="row mt-2">
								<!-- 테이블내용 -->
								<div class="col">

									<c:forEach items="${willBuyList}" var="willdata">
										<input type="hidden" name="willBuy_nos"
											value="${willdata.willBuyVo.willBuy_no}">
										<input type="hidden" name="sell_nos"
											value="${willdata.sellBoardVo.sell_no}">
										<input type="hidden" name="willBuy_amounts"
											value="${willdata.willBuyVo.willBuy_amount}">
										<input type="hidden" name="address"
											value="${memberUser.member_address}">
										<div class="row border border-1 my-5">
											<div class="col">
												<div class="col">
													<div class="row border-bottom fs-3">
														<div class="col text-center"
															style="background-color: #BEBEBE;">나의 장바구니</div>
													</div>
												</div>

												<div class="row fs-3">
													<div class="col-1">

														<div class="form-check form-check-inline">
															<input class="form-check-input" type="checkbox"
																id="inlineCheckbox1" value="option1"> <label
																class="form-check-label" for="inlineCheckbox1"></label>
														</div>
													</div>
													<div class="col-3">
														<img
															src="/upload/${willdata.sellImageVo[0].sellImage_link}"
															style="height: 200px;">
													</div>


													<div class="col">

														<div class="row my-2">
															<div class="col text-center">상품명</div>
															<div class="col text-center">
																<a
																	href="./readBuyBoardPage.do?sell_no=${willdata.sellBoardVo.sell_no}">${willdata.sellBoardVo.sell_name}</a>
															</div>

														</div>
														<div class="row my-2">
															<div class="col text-center">개당 가격</div>
															<div class="col text-center">${willdata.sellBoardVo.sell_price}원</div>
														</div>
														<div class="row my-2">
															<div class="col text-center">구입 수량</div>
															<div class="col text-center">${willdata.willBuyVo.willBuy_amount}개</div>
															<input type="hidden" name="buy_Quantity"
																value="${willdata.willBuyVo.willBuy_amount}">
														</div>
														<div class="row my-2">
															<div class="col text-center">가격</div>
															<div class="col text-center">${willdata.willBuyVo.willBuy_price}원</div>
															<input type="hidden" name="price"
																value="${willdata.willBuyVo.willBuy_price}">
														</div>
														<div class="row my-2">
															<div class="col text-end">
																<a class="btn btn-danger"
																	href="./deleteWillBuyProcess.do?willBuy_no=${willdata.willBuyVo.willBuy_no }"
																	role="button">삭제</a>
															</div>
														</div>
													</div>
												</div>

											</div>

										</div>
									</c:forEach>

								</div>

							</div>
<!-- 							<div class="row my-2  fs-5"> -->
<!-- 								<div class="col text-center">총 합계</div> -->
<!-- 								<div class="col text-end">총 -->
<%-- 									합계:${willdata.willBuyVo.willBuy_price} 원</div> --%>
<!-- 							</div> -->

							<div class="row border border-1 my-5">
								<div class="col">
									<div class="row border-bottom fs-3">
										<div class="col text-center"
											style="background-color: #BEBEBE;">배송지</div>
									</div>
								</div>

								<div class="row my-2 fs-5">
									<div class="col-3"></div>
									<div class="col-4 text-center">이름:</div>
									<div class="col">${memberUser.member_name}</div>
								</div>
								<div class="row my-2 fs-5">
									<div class="col-3"></div>
									<div class="col-4 text-center">연락처:</div>
									<div class="col">${memberUser.member_phone }</div>
								</div>
								<div class="row my-2 fs-5">
									<div class="col-3"></div>
									<div class="col-4 text-center">배송지:</div>
									<div class="col">${memberUser.member_address}</div>
									<input type="hidden" name="buy_adress"
										value="${memberUser.member_address }">
								</div>
								<div class="row my-2 fs-5">
									<div class="col-3"></div>
									<div class="col-4 text-center">배송메모:</div>
									<div class="col">
										<input type="text" name="memo">
									</div>
								</div>
							</div>

							<div class="row text-end mt-3" style="padding-right: 0px;">
								<div class="col" style="padding-right: 0px;">
									<a class="btn" style="background: #F2CB05; color: #FFFFFF"
										href="javascript:history.back()" role="button">이전</a> <input
										type="hidden" name="member_no"
										value="${memberUser.member_no }"> <input type="hidden"
										name="sell_no" value="${willdata.sellBoardVo.sell_no }">
									<input class="btn btn-outline-light " type="button"
										style="background: #F25C19; color: #FFFFFF;"
										onclick="doSubmit()" value="주문 하기">

								</div>
							</div>
							</div>
							<div class="col-1"></div>
					</form>
               </div>
               
            </div>
         </div>

      	<jsp:include page="../common/global_footer.jsp"></jsp:include>
</body>
</html>