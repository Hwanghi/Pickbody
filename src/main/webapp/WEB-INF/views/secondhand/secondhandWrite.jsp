<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function doSubmit() {

		var frm1 = document.getElementById("frm1");
		frm1.submit();
	}
	
	function popAddress(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	           document.getElementById("addressBox").value = data.address;
	        }
	    }).open();
		
	}
</script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e40c027a29cc3023268d8f3dfd0fc467"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.7"></script>



<style type="text/css">
a.salepage:link {
	color: black;
	text-decoration: none;
}

a.salepage:visited {
	color: black;
	text-decoration: none;
}

a.salepage:hover {
	color: red;
	text-decoration: none;
}

a.salepage:active {
	color: black;
	text-decoration: none;
}
</style>

</head>


<body>
	<div style="width: 1200px; margin: 0 auto">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
        <jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<div class="col"></div>
				<!-- 로그인 + 네비바-->
				<div class="col-10">
					<div class="row mt-5">
						  <a href="./secondhandMainPage.do" class="tothehome">
							<div class="col fs-1 fw-bold text-center">중고장터</div>
						</a>
					</div>
					<!--중고장터 전용 헤더 시작-->
					<div class="row mt-5"
						style="border-bottom: black 1px solid; padding-bottom: 15px;">

						<div class="col-2">
							<a href="./secondhandWritePage.do" class="salepage">
								<div class="row">
									<div class="col-5" style="text-align: right; padding-right: 0;">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
                                <path
												d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z" />
                              </svg>

									</div>
									<div class="col-6">판매하기</div>

								</div>
							</a>
						</div>
						<div class="col-6" style="padding-right: 0; padding-left: 20;">
							<div class="row">
								<div class="col-11">
									<input type="search" id="form1" class="form-control" />
								</div>
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path
											d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                          </svg>
								</div>


							</div>

						</div>


						<div class="col-2" style="padding-right: 0;">

							<div class="row">
								<div class="col-1"></div>
								<div class="col">
									<a href="secondhandWishlist.do" class="salepage">
										<div class="row">

											<div class="col-6"
												style="text-align: right; padding-right: 0;">
												<svg xmlns="http://www.w3.org/2000/svg" width="25"
													height="25" fill="currentColor" class="bi bi-bag"
													viewBox="0 0 16 16">
                                        <path
														d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                                      </svg>
											</div>
											<div class="col-6">찜목록</div>
										</div>
									</a>
								</div>
							</div>

						</div>


						<div class="col-2" style="padding-left: 0;">
							<a href="secondhandMyshop.do" class="salepage">
								<div class="row">
									<div class="col-5" style="text-align: right; padding-right: 0;">
										<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
											fill="currentColor" class="bi bi-person-circle"
											viewBox="0 0 16 16" align>
                                        <path
												d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
                                        <path fill-rule="evenodd"
												d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
                                        </svg>

									</div>
									<div class="col-6">내상점</div>

								</div>
							</a>
						</div>
					</div>
					<!--중고상품 페이지 헤더 끝-->

					<!--상품 판매 글 등록 시작-->
					<form action="./secondhandWriteProcess.do" id="frm1" method="post"
						enctype="multipart/form-data">

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">

							<div class="col-2" style="text-align: center;">상품 이미지</div>
							<div class="col-4">
								<div class="row">
									<div class="col">
											<input type="file" multiple accept="image/*" name="files">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">유의사항</div>
								</div>
								<div class="row">
									<div class="col">이미지는 640640 최적화</div>
								</div>
								<div class="row">
									<div class="col">사진은 6장 까지 등록할 수 있습니다.</div>
								</div>
								<div class="row">
									<div class="col">가장 먼저 등록된 사진이 대표사진입니다.</div>
								</div>

							</div>
							<div class="col-6">등록된 사진</div>
						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">제목</div>
							<div class="col-10">
								<input type="text" name="item_title">
							</div>
						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">카테고리</div>
							<div class="col-10">
								<div class="row">
									<div class="col-3">

										
									<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									  <option selected>대분류</option>
										<c:forEach items="${cbvo }" var="cbvo" varStatus="i">
											<option value="${i.count }">${cbvo.big_name }</option>
										</c:forEach>							
									</select>
									
									</div>	
									
									<div class="col-3">

									<select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									  <option selected>대분류</option>
										<c:forEach items="${cbvo }" var="cbvo" varStatus="i">
											<option value="${i.count }">${cbvo.big_name }</option>
										</c:forEach>							
									</select>
									
									</div>							
									




								</div>
								<div class="row mt-3">
									<div class="col-3" style="text-align: center;">선택한 카테고리는
										</div>
									<div class="col-3">뭐뭐뭐 입니다.</div>
								</div>
							</div>

						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">상태</div>
							<div class="col-10">
								<div class="row">
									<div class="col-2">
										<input type="radio" name="item_condition" value="N">새상품
									</div>
									<div class="col-2">
										<input type="radio" name="item_condition" value="S">중고상품
									</div>
								</div>

							</div>
						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">환불 여부</div>
							<div class="col-10">
								<div class="row">
									<div class="col-2">
										<input type="radio" name="item_refund" value="Y">환불 가능
									</div>
									<div class="col-2">
										<input type="radio" name="item_refund" value="N">환불 불가
									</div>
								</div>

							</div>
						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">가격</div>
							<div class="col-10">
								<div class="row">
									<div class="col">
										<input type="number" name="item_price" value="가격을 입력하세요">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-2">
										<input type="radio" name="item_negotiate" value="Y">가격
										협의 가능
									</div>
									<div class="col-2">
										<input type="radio" name="item_negotiate" value="N">가격
										협의 불가
									</div>
								</div>

							</div>
						</div>


						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">제품 설명</div>
							<div class="col-10">
								<textarea rows="10" cols="60" name="item_content"> 제품설명</textarea>
							</div>
						</div>
						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">키워드</div>
							<div class="col-10">
								<textarea rows="1" cols="60" name="item_keyword"></textarea>
							</div>
						</div>

						<div class="row mt-4"
							style="border-bottom: gray 1px solid; padding-bottom: 24px;">
							<div class="col-2" style="text-align: center;">위치</div>
							<div class="col-10">
								<textarea id="addressBox" rows="1" cols="60" name="item_location" onclick="popAddress()"></textarea>
							</div>
						</div>


						<div class="row mt-4" style="padding-bottom: 24px;">
							<div class="col-10"></div>
							<div class="col-2" style="text-align: center;">


								<input type="button" onclick="doSubmit()" value="제출">
							</div>

						</div>

					</form>






				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
