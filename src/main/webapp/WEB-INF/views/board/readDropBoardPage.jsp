<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap"
   rel="stylesheet">

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
function needLogin(){
	   alert("로그인이 필요합니다.");
}

function doDrop(){
	var dropFrm = document.getElementById("dropFrm");
	var dropContent = document.getElementById("dropContentBox");
	if(dropContent.value == ""){
		alert("응모댓글을 입력해주세요.");
		dropContent.focus();
		return;
	}
	dropFrm.submit();
}
</script>
</head>
<body> 					
	<div style="width:1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">

			<div class="row">
				<div class="col">
				
			<div class="row mt-3">
						<div class="col border-end">
							<div class="row">
								<div class="col">
									<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
				                    	<div class="carousel-inner text-center">
				                       		 <c:forEach items="${dropdata.boardDropImageVoList }" var="boardDropImageVo" varStatus="i">
				                              	<c:choose>
				                                 	<c:when test="${i.count == 1}">
				                                    	<div class="carousel-item active">
				                                       		<img src="/upload/${boardDropImageVo.image_link }" style="width: 300px; height: 300px;">
				                                   		</div>
				                                 	</c:when>
				                                 	<c:otherwise>
				                                    	<div class="carousel-item">
				                                       		<img src="/upload/${boardDropImageVo.image_link }" style="width: 300px; height: 300px;">
				                                    	</div>
				                                 	</c:otherwise>
				                              </c:choose>
				                           </c:forEach>
				                        </div>
				                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
				                        	<span class="carousel-control-prev-icon btn-dark" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				                        </button>
				                        <button class="carousel-control-next" type="button"	data-bs-target="#carouselExampleFade" data-bs-slide="next">
				                        	<span class="carousel-control-next-icon btn-dark" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				                        </button>
				                	</div>
								</div>
							</div>
							<div class="row">
								<div class="col mt-2 mx-3 text-center">
									<a href="./dropBoardPage.do" class="d-grid" style="text-decoration: none">
										<button type="button" class="btn text-white" style="background-color:#F25C19;">다른 드랍 상품 보기</button>
									</a>
								</div>
							</div>
						</div>
						<div class="col mx-3">
							<div class="row mb-2 py-1 border-bottom">
		                        <!-- 상품이름 -->
		                        <div class="col-1 pe-1"><i class="bi bi-bookmark"></i></div>
		                        <div class="col-4 ps-0">제목</div>
		                        <div class="col-1"></div>
		                        <div class="col">${dropdata.boardDropVo.drop_title }</div>
		                    </div>
							<div class="row mb-3 py-1 border-bottom">
		                        <!-- 내용 -->
		                        <div class="col-1 pe-1"><i class="bi bi-book"></i></div>
		                        <div class="col-4 ps-0">내용</div>
		                        <div class="col-1"></div>
		                        <div class="col">${dropdata.boardDropVo.drop_content }</div>
		                    </div>
		                    <div class="row mb-1 py-1 border-bottom">
		                    	<!-- 수량 -->
		                    	<div class="col-1 pe-1"><i class="bi bi-cart4" style="color:#F2CB05;"></i></div>
		                        <div class="col-4 ps-0">수량
		                        </div>
		                        <div class="col-1"></div>
		                        <div class="col">${dropdata.boardDropVo.drop_amount }</div>
		                    </div>
		                    <div class="row mb-1 py-1 border-bottom">
		                    	<div class="col-1 pe-1"><i class="bi bi-currency-bitcoin" style="color:#F2CB05;"></i></div>
		                        <div class="col-4 ps-0">응모가</div>
		                        <div class="col-1"></div>
		                        <div class="col">${dropdata.boardDropVo.drop_price }</div>
		                    </div>
		                    <div class="row mb-1 py-1 ">
		                    	<div class="col-1 pe-1"><i class="bi bi-calendar-check" style="color:#F2CB05;"></i></div>
		                        <div class="col-4 ps-0">응모시작</div>
		                        <div class="col-1"></div>
		                        <div class="col"><fmt:formatDate value="${dropdata.boardDropVo.drop_startdate }" pattern="yy년 MM년dd일"/></div>
		                    </div>
		                    <div class="row mb-3 border-bottom">
		                    	<div class="col-1 pe-1"><i class="bi bi-calendar-x-fill" style="color:#F2CB05;"></i></div>
		                        <div class="col-4 ps-0">응모마감</div>
		                        <div class="col-1"></div>
		                        <div class="col"><fmt:formatDate value="${dropdata.boardDropVo.drop_enddate }" pattern="yy년 MM년dd일"/></div>
		                    </div>
		                    <div class="row mb-3 py-1 border-bottom">
		                    	<div class="col-1 pe-1"><i class="bi bi-people"></i></div>
		                        <div class="col-4 ps-0">응모자 수</div>
		                        <div class="col-1"></div>
		                        <div class="col">${totalApplicationCount }</div>
		                    </div>
		                    <div class="row mb-4 py-1 border-bottom">
		                    	<div class="col-1 pe-0"><i class="bi bi-award-fill" style="color:#F2CB05;"></i></div>
		                        <div class="col-4 ps-1">당첨자</div>
		                        <div class="col-1"></div>
		                        <div class="col" style="color:#F25C19;">
		                        <c:forEach items="${winninglist }" var="winningdata">
		                       			${winningdata.memberVo.member_nick }<br>
		                        </c:forEach>
		                        </div>
		                    </div>
		                    <div class="row mb-2 py-1">
		                    	<c:if test="${empty memberUser }">
			                    	<div class="col-9  d-grid">
			                    		<input type="text">
			                    	</div>
			                    	<div class="col d-grid">
			                    		<button type="button" class="btn btn-secondary btn-sm" onclick="needLogin()">응모하기</button>
			                    	</div>
		                    	</c:if>
	                    		<c:if test="${!empty memberUser }">
									<c:choose>
										<c:when test="${myApplicationCount > 0 }">
											<div class="col-9  d-grid">
					                    		<input type="text" style="display:none;">
					                    	</div>
					                    	<div class="col d-grid">
					                    		<button type="button" class="btn btn-secondary btn-sm" disabled>응모 완료!</button>
					                    	</div>
										</c:when>
										<c:otherwise>
											<div class="col-9 d-grid">
												<form id="dropFrm" action="./applicationDropProcess.do" method="post">
														<input id="dropContentBox" type="text" name="application_comment">
														<input type="hidden" name="drop_no" value="${dropdata.boardDropVo.drop_no }">
														<input type="hidden" name="drop_price" value="${dropdata.boardDropVo.drop_price }">
												</form>
											</div>
											<div class="col d-grid">
												<button type="button" class="btn btn-sm text-white" onclick="doDrop()" style="background-color: #F25C19;">응모하기</button>
											</div>
										</c:otherwise>
									</c:choose>
								</c:if>
		                    	
		                   </div>
		                   <div class="row mb-3">
		                   		<div class="col px-2 float-center">
		                   			<img class="img-fluid" src="../resources/img/event_banner1.png" style="width:100%; height:150px;">
		                   		</div>
		                   </div>
		                   <div class="row mb-1" style="background-color: #F2F2F2">
		                   		<div class="col-1 pe-1"><i class="bi bi-person-lines-fill"></i></div>
		                   		<div class="col-2 ps-0">응모자</div>
		                   		<div class="col-1 pe-1"><i class="bi bi-bookmark"></i></div>
		                   		<div class="col-4 ps-0">내용</div>
		                   		<div class="col-1 pe-1"><i class="bi bi-calendar4-event"></i></div>
		                   		<div class="col-3 ps-0">응모 날짜</div>
		                  	</div>
		                  	<c:forEach items="${applist }" var="applicationdata">
		                  	<div class="row mb-2">
		                  		<div class="col-1 pe-1"><i class="bi bi-bookmark-heart" style="color: red;"></i></div>
		                  		<div class="col-2 ps-0">
		                  			${applicationdata.memberVo.member_nick }
		                  		</div>
		                  		<div class="col-1 pe-1"></div>
		                  		<div class="col-4 ps-0">
		                  			${applicationdata.applicationVo.application_comment }
		                  		</div>
		                  		<div class="col-1 pe-1"></div>
		                  		<div class="col-3 ps-0">
		                  			<fmt:formatDate value="${applicationdata.applicationVo.application_applydate }" pattern="yy/MM/dd/HH:mm"/>
		                  		</div>
		                  	</div>
							</c:forEach>
						</div>
					
				<div class="col-2">
					<img class="img-fluid" src="../resources/img/event_banner7.jpg" style="height:100%;">
				</div>
			</div>
			
					<div class="row mt-3" style="background-color: #F2F2F2">
						<div class="col">
						
		                  <div class="row mt-4 border-top border-dark">
		                     <div class="col"> 
			                     <div class="row mt-5 mb-5">
			                        <div class="col-3 fs-3 text-end text-info" style="padding-right: 0px">PICKBODY</div>
			                        <div class="col fs-3 text-left">의 모든 제품들은 정품이므로 안심하시고 구매하셔도 됩니다.</div>
			                     </div>
		                     </div>
		                  </div>
		                  <div class="row border border-1 mb-4"  >
		                     <div class="col">
		                        <div class="row border-bottom"  style="background-color: #C0C0C0;">
		                           <div class="col-3">배송관련</div>
		                           <div class="col"></div>
		                        </div>
		                        <div class="row mt-3"  >
		                           <div class="col-3">택배배송</div>
		                           <div class="col">1. PICK BODY는 전 제품 100% 무료배송입니다.</div>
		                        </div>
		                        <div class="row"  >
		                           <div class="col-3"></div>
		                           <div class="col">2. 브랜드 및 제품에 따라 입점 업체(브랜드) 배송과 PICK BODY 자체 배송으로 나뉩니다.</div>
		                        </div>
		                        <div class="row"  >
		                           <div class="col-3"></div>
		                           <div class="col">3. 결제확인 후 1~3일 정도 소요됩니다. (예약상품, 해외배송 상품은  배송기간이 다를 수 있습니다.)</div>
		                        </div>
		                     </div>
		                  </div>


		                  <div class="row border border-1 mb-4"  >
		                     <div class="col">
		                        <div class="row border-bottom" style="background-color: #C0C0C0;">
		                           <div class="col">결제관련</div>
		                           <div class="col-9" ></div>
		                        </div>
		                        <div class="row border-bottom py-4"  >
		
		                           <div class="col-3 align-self-center">카드결제</div>
		                           <div class="col align-self-center">전체 카드사 사용가능 (일부 카드사  무이자 할부)</div>
		                        </div>
		                        <div class="row border-bottom"  >
		                           <div class="col-3 align-self-center">가상계좌(무통장입금)</div>
		                           <div class="col align-self-center">주문 시마다 새로운 계좌번호를 발급하는
		                             	 방식으로 해당 계좌에 입금 즉시 입금확인이 되는 방식 입니다. 단, 1원 단위까지 정확히 입금하셔야만 입금이
		                              	정상적으로 처리됩니다.</div>
		                        </div>
		                        <div class="row"  >
		                           <div class="col-3 align-self-center">해외카드결제</div>
		                           <div class="col align-self-center">대한민국 외에서 발급 된 해외 카드로도   결제가 가능합니다. (VISA, MasterCard, JCB, 은련)</div>
		                        </div>
		                     </div>
		                  </div>
		
		
		                  <div class="row border border-1 mb-4"  >
		                     <div class="col">
		                        <div class="row border-bottom" style="background-color: #C0C0C0;">
		                           <div class="col-3" >교환/환불</div>
		                           <div class="col"></div>
		                        </div>
		                        <div class="row border-bottom py-4"  >
		
		                           <div class="col-3 align-self-center">자동회수 택배사</div>
		                           <div class="col align-self-center">CJ대한통운</div>
		                        </div>
		                        <div class="row border-bottom"  >
		                           <div class="col-3 align-self-center">배송비</div>
		                           <div class="col align-self-center">왕복 5,000원 (교환/환불 요청  상품의 수량에 따라서 상이, 구매자 책임 사유일 경우에만 발생)</div>
		                        </div>
		                        <div class="row border-bottom"  >
		                           <div class="col-3 align-self-center">보내실 곳</div>
		                           <div class="col align-self-center">중앙정보기술개발원 6층 제 1실습실</div>
		                        </div>
		
		
		                        <div class="row border-bottom"  >
		                           <div class="col-3 align-self-center">교환/환불시 주의사항</div>
		                           <div class="col">
		                              <ul style="list-style: none; padding-left:0px;">
		                                 <li>상품 수령 후 7일 이내 교환/환불을 요청해야 합니다.</li>
		                                 <li>동일 업체일 경우라도 상품별로 반품비용이 상이하게 발생할 수 있습니다.</li>
		                                 <li>교환/환불 시 반품비용은 선결제함으로 동봉하지 마시고, 동봉하여 발송하신 경우 확인 후 반품비  환불 처리됩니다.</li>
		                                 <li>자동회수 접수 시 영업일 기준 2~3일 내에 택배기사님 연락 후 방문하여 회수 진행됩니다.</li>
		                                 <li>수령하신 택배사가 아닌 다른 택배사로 발송하시는 경우(신규 택배 접수 포함) 추가 비용이 발생  할 수 있습니다.</li>
		                                 <li>반품 주소지는 브랜드(업체)마다 다르므로 확인 후 각각 보내셔야 합니다.</li>
		                                 <li>상품의 내용이 표시, 광고 내용과 다르거나 계약 내용이 다를 경우 상품을 공급받은 날부터</li>
		                                 <li> 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 내 청약 철회를 할 수 있습니다.</li>
		                                 <li>상품을 반환받은 날로부터 영업일 기준 3일 내 지급받은 대금을 환급합니다.</li>
		                                 <li>미성년자가 체결한 계약은 법정대리인이 동의하지 않는 경우 본인 또는 법정대리인이 취소할 수 있습니다.</li>
		                                 <li>도서산간 지역의 경우 결제하신 기본 교환/환불 배송비 외에 편도 기준 최대 8천원(왕복 기준   최대 16천원)까지
		                                 <li>추가 비용이 발생할 수 있습니다.</li>
		                                 <li>택배사, 판매업체, 지역별로 도서산간 발생 금액이 상이해 구매 시점에서는 정확한 금액 안내가 어렵습니다.</li>
		                              </ul>
		                           </div>
		                        </div>
		
		
		                        <div class="row"  >
		                           <div class="col-3 align-self-center">
		                              <div class="row">
		                                 <div class="col">교환/환불이</div>
		                              </div>
		                              <div class="row">
		                                 <div class="col">불가능한 경우</div>
		                              </div>
		                           </div>
		                           <div class="col">
		                              <ul style="list-style: none; padding-left:0px; ">
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
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../common/global_footer.jsp"></jsp:include>
	
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>