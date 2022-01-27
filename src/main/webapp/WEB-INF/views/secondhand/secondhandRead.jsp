<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e40c027a29cc3023268d8f3dfd0fc467"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.7"></script>



<script type="text/javascript">
	
	
	
	var myModal = null;
	
	

	window.addEventListener('DOMContentLoaded', function(){
	   myModal = new bootstrap.Modal(document.getElementById('itemModal'));
	});

	function showitemModal(){
	   
	   
	   myModal.show();
	}

	function submit(){
	   var evaluateprocesssales = document.getElementById("evaluateprocesssales");
	   evaluateprocesssales.submit();
	   
	   myModal.hide();
	 
	  
	}
	
	</script>

<script type="text/javascript">
	
	
	
	var myModall = null;
	
	

	window.addEventListener('DOMContentLoaded', function(){
	   myModall = new bootstrap.Modal(document.getElementById('evaluateModal'));
	});

	function showevaluateModal(){
	   
	   
	   myModall.show();
	}

	function submit(){

	   myModall.hide();
	 
	  
	}
	
	</script>

<style>
.boardbigbox1 {
	border: 1px solid rgb(180, 180, 180);
}

.boardbigbox2 {
	border: 1px solid rgb(180, 180, 180);
	background-color: rgb(220, 220, 220);
}

.boardbigbox3 {
	border: 1px solid rgb(180, 180, 180);
	background-color: rgb(150, 150, 150);
}

#cardbox, #cardbox2, #cardbox3, #cardbox4, #cardbox5 {
	padding: 10px;
}

.image {
	width: 228px;
	height: 256px;
}

<
style type ="text /css">a.salepage:link {
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

a.salebox:link {
	color: black;
	text-decoration: none;
}

a.salebox:visited {
	color: black;
	text-decoration: none;
}

a.salebox:hover {
	color: black;
	text-decoration: none;
}

a.salebox:active {
	color: black;
	text-decoration: none;
}

a.wc:hover {
	color: red;
}

.background-gray {
	background-color: #F2F2F2;
}
</style>


<style type="text/css">
.a :hover {
	color: red;
}
</style>

<script>

window.addEventListener("DOMContentLoaded" , function(){
	
	var mapContainer = document.getElementById('locationBox'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
});

</script>

<script type="text/javascript">


var logined = false;
var memberNo = null;
var item_no = ${data.svo.item_no};


function buyprocess(){
	
	
	var buyprocess = document.getElementById("buyprocess");
	buyprocess.submit();
}





function like() {

	
	
	//AJAX API 사용....
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			refreshLikeButton();
			refreshTotalLike();
		}
	};
	
	xmlhttp.open("get" , "./doLikeRest.do?item_no=${data.svo.item_no}"); 
	xmlhttp.send();
	
	
}

function refreshLikeButton(){
	
	if(logined == false){
		return;
	}
	
	//var aaa = null;
	//aaa.xxx = 10;
	
	
	var xmlhttp = new XMLHttpRequest();

	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링..DOM 조작 : 엘리먼트 접근 , 생성 , 추가 , 삭제... 속성 컨트롤 , 스타일 컨트롤..
			var heartButton = document.getElementById("heartButton");
			
			if(data.myLikeCount > 0){
				heartButton.setAttribute("class" , "btn btn-danger");
			}else{
				heartButton.setAttribute("class" , "btn btn-info");
			}
		}
	};
	
	xmlhttp.open("get" , "./getMyLikeData.do?item_no=${data.svo.item_no}"); 
	xmlhttp.send();
}

function refreshTotalLike(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링...
			var totalCountBox = document.getElementById("totalCountBox");
			totalCountBox.innerText = "찜 수" + data.totalLikeCount;
		}
	};
	
	xmlhttp.open("get" , "./getTotalLikeCount.do?item_no=${data.svo.item_no}"); 
	xmlhttp.send();
}



function getSessionUserInfo(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			if(data.isLogined == true){
				logined = true;
				memberNo = data.memberNo; 
			}else{
				logined = false;
			}
		}
	};
	
	
	xmlhttp.open("get" , "../member/getSessionUserInfo.do" , false); 
	xmlhttp.send();		
}







function writeComment(){
	
	
	var commentBox = document.getElementById("writecomment");
	var commentText = commentBox.value;
	
			
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			refreshCommentList();
		}
	};
	
	xmlhttp.open("post" , "./writeCommentProcess.do"); 
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("item_no=" + item_no + "&comment_content=" + commentText);
	
	
	commentBox.value = "";
}



function refreshCommentList(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링...DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근... 속성...innerText등...
			
			var commentListBox = document.getElementById("commentListBox");
			
			//제한조건...innerHTML은...절대 쓰지 마셈...!!!!! 단 아래처럼 초기화 할때 빼고...
			commentListBox.innerHTML = ""; //초기화...
			
			for(commentData of data.commentlist){
				
				var outerRow = document.createElement("div");
				outerRow.setAttribute("class" , "row");
				
				var outerCol = document.createElement("div");
				outerCol.setAttribute("class" , "col commentWrapper");
				
				outerRow.appendChild(outerCol);
				
				var rowBox = document.createElement("div"); //<div></div>
				rowBox.setAttribute("class" , "row"); //<div class='row'></div>
				
				outerCol.appendChild(rowBox);
				
				var nickColBox = document.createElement("div");
				nickColBox.setAttribute("class" , "col-3");
				nickColBox.innerText = commentData.mvo.member_nick; //<div class='col-2 bg-primary'>afef</div>
				
				//조립...
				rowBox.appendChild(nickColBox);
				
				var contentColBox = document.createElement("div");
				contentColBox.setAttribute("class" , "col-4 ");
				contentColBox.innerText = commentData.cvo.comment_content;
				
				rowBox.appendChild(contentColBox);
				
				var dateColBox = document.createElement("div");
				dateColBox.setAttribute("class" , "col-2 ");
				
				var ddd = new Date(commentData.cvo.comment_writedate);
				var timeString = ddd.getFullYear() + "/" + (ddd.getMonth() + 1) + "/" + ddd.getDate();
				
				dateColBox.innerText = timeString;
				
				rowBox.appendChild(dateColBox);
				
				//삭제 버튼...
				
				var deleteColBox = document.createElement("div");
				deleteColBox.setAttribute("class" , "col-1 ");
				
				if(memberNo == commentData.mvo.member_no){
					deleteColBox.setAttribute("onclick" , "deleteComment("+ commentData.cvo.comment_no +")");
					deleteColBox.innerText = "삭제";
				}
				
				//수정버튼...
				var updateButtonBox = document.createElement("div");
				updateButtonBox.setAttribute("class" , "col-1");
				if(memberNo == commentData.mvo.member_no){
					updateButtonBox.setAttribute("onclick" , "createUpdateForm(this , "+ commentData.cvo.comment_no +")");
					updateButtonBox.innerText = "수정";
				}

				rowBox.appendChild(updateButtonBox);
				rowBox.appendChild(deleteColBox);

				//수정 입력 양식 위치 작업..
				var updateFormRow = document.createElement("div");
				updateFormRow.setAttribute("class","row");

				var updateFormCol = document.createElement("div");
				updateFormCol.setAttribute("class","col updateFormCol");
				

				updateFormRow.appendChild(updateFormCol);
				
				outerCol.appendChild(updateFormRow);
				
				
				commentListBox.appendChild(outerRow);
			}
			
		}
	};
	
	xmlhttp.open("get" , "./getCommentLists.do?item_no=" + item_no); 
	xmlhttp.send();		
	
}


function init(){
	//로그인 상태 처리...
	//getSessionUserInfo();
	
	if(logined == true){
		refreshLikeButton();
	}
	refreshTotalLike();
	refreshCommentList();
	
	//setInterval(refreshCommentList , 5000);	
	
}

window.addEventListener("DOMContentLoaded" , init);


</script>


<style type="text/css">
a.showmoreitem:hover {
	color: blue;
	text-decoration: none;
}

a.showmorereview:hover {
	color: blue;
}

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

.image {
	width: 128px;
	height: 150px;
}

a.tothehome:link {
	color: black;
	text-decoration: none;
}

a.tothehome:visited {
	color: black;
	text-decoration: none;
}

a.tothehome:hover {
	color: black;
	text-decoration: none;
}

a.tothehome:active {
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
				<div class="col-1"></div>
				<!-- 로그인 + 네비바-->
				<div class="col-10 background-gray">

					<div class="row"
						style="border-bottom: black 1px solid; padding-bottom: 15px; padding-top: 15px;">

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

					<!-- 리딩 페이지-->


					<div class="row mt-4" style="padding-bottom: 16px;">
						<div class="col-5">
							<div class="row">
								<div class="col">
									<div id="carouselExampleControls" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner">

											<div class="carousel-item active">
												<c:forEach items="${data.ivo }" var="data" begin='0' end='0'>
													<img src="/upload/${data.image_link }"
														class="d-block w-100" style="height: 360px;">
												</c:forEach>
											</div>
											<c:forEach items="${data.ivo }" var="dataa" begin='1'>
												<div class="carousel-item">

													<img src="/upload/${dataa.image_link }"
														class="d-block w-100" style="height: 360px;">

												</div>
											</c:forEach>

										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#carouselExampleControls"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#carouselExampleControls"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>





								</div>
							</div>



						</div>


						<div class="col-7">
							<div class="row">
								<div class="col">
									<h4>${data.svo.item_title }</h4>
								</div>
							</div>
							<div class="row mt-4"
								style="border-bottom: gray 1px solid; padding-bottom: 24px;">
								<div class="col">
									<h4>${data.svo.item_price }원</h4>
								</div>
							</div>

							<div class="row mt-4">
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                                                <path
											d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z" />
                                              </svg>
								</div>
								<div class="col-2" id="totalCountBox"></div>
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                            <path
											d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                                            <path
											d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                                          </svg>
								</div>
								<div class="col-2">${data.svo.item_readcount }</div>

								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-clock-fill"
										viewBox="0 0 16 16">
                                                <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
                                              </svg>
								</div>
								<div class="col-2">
									<fmt:formatDate pattern="yyyy/MM/dd"
										value="${data.svo.item_writedate }" />
								</div>
								<div class="col-1"></div>
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-star-fill"
										viewBox="0 0 16 16">
  <path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>

								</div>
								<div class="col-1">${data.averageevaluate }</div>
							</div>
							<div class="row mt-4">
								<div class=col-1>
									<div class="row mt-2">
										<div class="col">o</div>
									</div>
									<div class="row mt-2">
										<div class="col">o</div>
									</div>
									<div class="row mt-2">
										<div class="col">o</div>
									</div>
									<div class="row mt-2">
										<div class="col">o</div>
									</div>
								</div>
								<div class="col-2">
									<div class="row mt-2">
										<div class="col">상품상태</div>
									</div>
									<div class="row mt-2">
										<div class="col">환불여부</div>
									</div>
									<div class="row mt-2">
										<div class="col">가격협의</div>
									</div>
									<div class="row mt-2">
										<div class="col">거래지역</div>
									</div>
								</div>
								<div class="col">
									<div class="row mt-2">
										<div class="col">${data.svo.item_condition }</div>
									</div>
									<div class="row mt-2">
										<div class="col">${data.svo.item_refund}</div>
									</div>
									<div class="row mt-2">
										<div class="col">${data.svo.item_negotiate }</div>
									</div>
									<div class="row mt-2">
										<div class="col">${data.svo.item_location }</div>
									</div>

								</div>

							</div>

							<div class="row mt-4" style="text-align: center;">
								<div class="col-4" style="padding: 0;">

									<c:choose>
										<c:when test="${memberUser.member_no eq data.svo.member_no }">
											<button type="button" class="a btn btn-danger"
												style="width: 194.44px;">삭제하기</button>

										</c:when>

										<c:otherwise>

											<button type="button" id="heartButton"
												class="a btn btn-danger" style="width: 194.44px"
												onclick="like()">찜하기</button>

										</c:otherwise>
									</c:choose>

								</div>


								<div class="col-4" style="padding: 0;">
									<a href="#aaa1" type="button" class="b btn btn-secondary"
										style="width: 194.44px;">문의하기</a>
								</div>


								<div class="col-4" style="padding: 0;">
									<c:choose>
										<c:when test="${memberUser.member_no eq data.svo.member_no }">

											<input type="button" class="c btn btn-primary"
												style="width: 194.44px;" value="수정하기">

										</c:when>

										<c:when test="${memberUser.member_no eq data.stvo.buyer_no }">
											<input type="button" class="c btn btn-primary"
												style="width: 194.44px;" value="구매하기">

										</c:when>


										<c:otherwise>

											<form action="buyprocess.do" method="post" id="buyprocess">

												<input type="hidden" name="item_no"
													value="${data.svo.item_no }"> <input type="hidden"
													name="buyer_no" value="${memberUser.member_no }"> <input
													type="button" class="c btn btn-primary"
													onclick="buyprocess()" style="width: 194.44px;"
													value="구매하기">

											</form>

										</c:otherwise>
									</c:choose>
								</div>


							</div>




						</div>
					</div>

					<div class="row mt-4"
						style="border-top: gray 1px solid; padding-top: 16px;">
						<div class="col-8">

							<div class="row">

								<div class="col-12">
									<div class="row">
										<div class="col">

											<!-- 구매후기, 상품문의, 상품정보 제공고시, 판매자 정보 -->
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
												<li class="nav-item" role="presentation">
													<button class="nav-link active" id="pills-home-tab"
														data-bs-toggle="pill" data-bs-target="#pills-home"
														type="button" role="tab" aria-controls="pills-home"
														aria-selected="true">상품 정보</button>
												</li>
												<li class="nav-item" role="presentation">
													<button class="nav-link" id="pills-profile-tab"
														data-bs-toggle="pill" data-bs-target="#pills-profile"
														type="button" role="tab" aria-controls="pills-profile"
														aria-selected="false">상품문의 내역</button>
												</li>

											</ul>
											<!--                             버튼부분ㄴ-->


											<div class="tab-content" id="pills-tabContent">
												<div class="tab-pane fade show active" id="pills-home"
													role="tabpanel" aria-labelledby="pills-home-tab">
													<div class="row mt-3">
														<div class="col fs-3">상품정보</div>
													</div>

													<!-- 구매후기  입력  부분 -->
													<div class="row mt-3">
														<div class="col" style="height: 200px;">${data.svo.item_content }</div>
													</div>

													<div class="row mt-3">
														<div class="col fs-3">판매 장소</div>
													</div>

													<div class="row"
														style="text-align: center; border-bottom: gray 1px solid; padding-bottom: 8px;">
														<div class="col-1"></div>
														<div class="col" id="locationBox" style="height: 300px"></div>
														<div class="col-1"></div>
													</div>
												</div>

												<!-- 상품문의 -->
												<div class="tab-pane fade" id="pills-profile"
													role="tabpanel" aria-labelledby="pills-profile-tab">
													<div class="row mt-3">
														<div class="col fs-3">
															<!-- 상품문의  출력 부분 -->
															상품문의 내역
														</div>
													</div>
													<!-- 구매자 댓글  입력  부분 -->
													<div class="row mt-3">
														<div class="col">
															<div id="commentListBox"></div>
														</div>
													</div>
													<!-- 관리자가 쓸 상품문의 덧글추가해야함 출력과 입력둘다 -->
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>

							<div class="row mt-3">
								<div class="col-12"
									style="border-bottom: gray 1px solid; padding-bottom: 24px; height: 400px;"></div>
							</div>




						</div>

						<div class="col-4" style="border-left: gray 1px solid;">
							<div class="row">
								<div class="col"
									style="border-bottom: gray 1px solid; padding-bottom: 16px;">판매자
									정보</div>
							</div>
							<div class="row mt-4">
								<div class="col-1"></div>
								<div class="col">${data.mvo.member_nick }님의상점</div>
								<div class="col-1"></div>
							</div>
							<div class="row mt-1">
								<div class="col-1"></div>
								<div class="col-2">상품</div>
								<div class="col-2">${data.countsell }</div>
								<div class="col-1"></div>
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-star-fill"
										viewBox="0 0 16 16">
  <path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>


								</div>
								<div class="col-3">${data.averageevaluate }</div>
								<div class="col-2"></div>
							</div>
							<div class="row mt-2">
								<div class="col-1"></div>
								<c:forEach items="${two }" var="two">
									<div class="col-5"
										style="text-align: center; padding: 5px; border: 1px solid black;">
										<img class="image" src="/upload/${two.ivo.image_link }">
									</div>
								</c:forEach>

								<div class="col-1"></div>
							</div>
							<div class="row mt-2">
								<div class="col-1"></div>
								<div class="col-10"
									style="text-align: center; border-bottom: gray 1px solid; padding-bottom: 8px;">
									<a class="showmoreitem" onclick="showitemModal()">${data.countsell }개
										상품 더보기</a>
								</div>

								<div class="modal fade" id="itemModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">${data.mvo.member_nick }님의 
													상점</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div class=row>


													<c:forEach items="${two}" var="data">

														<div class="col-3" id="cardbox">
															<c:choose>
																<c:when test="${data.svo.item_status eq '판매중' }">

																	<div class="boardbigbox1">
																</c:when>
																<c:when test="${data.svo.item_status eq '거래중' }">

																	<div class="boardbigbox2">
																</c:when>
																<c:when
																	test="${data.svo.item_status eq '거래완료' ||data.svo.item_status eq '평가완료' }">

																	<div class="boardbigbox3">
																</c:when>
															</c:choose>
															<a
																href="./secondhandReadPage.do?item_no=${data.svo.item_no }&no=${data.svo.member_no}"
																class="salebox">

																<div class="row"">
																	<div class="col-1"
																		style="padding-right: 0; padding-left: 0;"></div>
																	<div class="col" style="padding-left: 0;">

																		<c:choose>
																			<c:when test="${data.svo.item_status eq '평가완료' }">
                                    거래완료
                                    </c:when>
																			<c:otherwise>
                                    ${data.svo.item_status }
                                    </c:otherwise>
																		</c:choose>



																	</div>
																	<div class="col-1"></div>

																	<div class="col" style="padding-right: 0;">
																		<fmt:formatDate pattern="yyyy/MM/dd"
																			value="${data.svo.item_writedate }" />
																	</div>
																	<div class="col-1"
																		style="padding-left: 0; padding-right: 0;"></div>
																</div>


																<div class="row mt-1">
																	<div class="col" style="height: 247px;">
																		<img 
																		style="height: 247px; width:176px;"
																		class="image"
																			src="/upload/${data.ivo.image_link }">
																	</div>
																</div>

																<div class="row mt-1">
																	<div class="col-1" style="padding-right: 0;"></div>
																	<div class="col"
																		style="padding-left: 0; padding-right: 0;">
																		<h5>

																			<c:choose>
																				<c:when
																					test="${fn:length(data.svo.item_title) gt 11 }">
																					<c:out
																						value="${fn:substring(data.svo.item_title, 0, 10)}..."></c:out>
																				</c:when>
																				<c:otherwise>
																					<c:out value="${data.svo.item_title}">
																					</c:out>
																				</c:otherwise>


																			</c:choose>
																		</h5>
																	</div>
																	<div class="col-1" style="padding-left: 0;"></div>
																</div>
																<div class="row mt-1">
																	<div class="col-1" style="padding-right: 0;"></div>
																	<div class="col" style="padding-left: 0;">${data.svo.item_price }
																		원</div>

																	<div class="col-5" style="padding-right: 0;">
																		<c:choose>
																			<c:when test="${data.average ne '0'}">
																				<div class="row">
																					<div class="col-3"></div>

																					<div class="col-1">
																						<svg xmlns="http://www.w3.org/2000/svg" width="16"
																							height="16" fill="currentColor"
																							class="bi bi-star-fill" viewBox="0 0 16 16">
  <path
																								d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>


																					</div>
																					<div class="col" style="text-align: right;">${data.average }8.5</div>
																				</div>
																			</c:when>
																			<c:otherwise>
																				<div class="row">
																					<div class="col" style="text-align: right;">
																						첫거래입니다</div>
																				</div>

																			</c:otherwise>
																		</c:choose>
																	</div>
																	<div class="col-1" style="padding-left: 0;"></div>
																</div>
															</a>
														</div>
												</div>
												</c:forEach>




											</div>


										</div>


										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>

										</div>
									</div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>

						<div class="row mt-4">
							<div class="col-1"></div>
							<div class="col-3"
								style="text-align: center; border-bottom: gray 1px solid; padding-bottom: 8px;">상점후기</div>
							<div class="col-7"
								style="text-align: center; border-bottom: gray 1px solid; padding-bottom: 8px;"></div>
						</div>

						<c:forEach items="${one }" var="one">
							<div class="row mt-2">

								<div class="col-1"></div>
								<div class="col-4">${one.smvo.member_nick }</div>
								<div class="col-6" style="text-align: right;">

									<fmt:formatDate pattern="yyyy/MM/dd"
										value="${one.sevo.evaluate_date }" />


								</div>
								<div class="col-1"></div>
							</div>
							<div class="row">
								<div class="col-1"></div>
								<div class="col-7"></div>
								<div class="col-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
										fill="currentColor" class="bi bi-star-fill"
										viewBox="0 0 16 16">
  <path
											d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>
								</div>
								<div class="col-1">${one.sevo.evaluate_score }</div>
							</div>
							<div class="row mt-1">
								<div class="col-1"></div>
								<div class="col-10"
									style="border-bottom: gray 1px solid; padding-bottom: 8px;">${one.sevo.evaluate_comment }</div>
								<div class="col-1"></div>
							</div>

							<div class="row mt-2">
								<div class="col-1"></div>
								<div class="col-10"
									style="text-align: center; border-bottom: gray 1px solid; padding-bottom: 8px;">

									<a class="showmorereview" onclick="showevaluateModal()">
										${data.countevaluate }개 후기 더보기</a>
								</div>

								<div class="col-1"></div>
							</div>
						</c:forEach>

						<div class="modal fade" id="evaluateModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">이브라히모비치님의
											거래 후기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class=row style="border-right: black 1px solid;">

											<c:forEach items="${salesevaluate }" var="data">

												<div class="col-3">

													<div class="row">
														<div class="col">${data.wmvo.member_nick }</div>


														<div class="col">
															<fmt:formatDate pattern="yyyy/MM/dd"
																value="${data.sevo.evaluate_date }" />
														</div>
													</div>



													<div class="row mt-1">
														<div class="col-6"></div>
														<div class="col">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>
                                    	
                                    	
														
														</div>
														<div class="col">
														${data.sevo.evaluate_score }
														
														</div>
												
													</div>
													<div class="row">
														<div class="col">
														${data.sevo.evaluate_comment }
														</div>
													</div>


												</div>
											</c:forEach>
										</div>
										<div class="row">
											<c:forEach items="${buyevaluate }" var="dataa">
												<div class="col-3">
													<div class="row">
														<div class="col">${dataa.wmvo.member_nick }</div>

														<div class="col">
															<fmt:formatDate pattern="yyyy/MM/dd"
																value="${dataa.sevo.evaluate_date }" />
														</div>
													</div>
													<div class="row mt-1">
														<div class="col">${dataa.sevo.evaluate_score }</div>
														<div class="col-2"></div>
														<div class="col">${dataa.sevo.evaluate_comment }</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										
									</div>
								</div>
							</div>
						</div>









						<div class="row mt-4">
							<div class="col-5">

								<c:choose>
									<c:when test="${memberUser.member_no eq data.svo.member_no }">
										<button type="button" class="btn btn-danger"
											style="width: 142.656px;">삭제하기</button>

									</c:when>

									<c:otherwise>

										<button type="button" id="heartButton" class="btn btn-danger"
											style="width: 142.64px" onclick="like()">찜하기</button>

									</c:otherwise>
								</c:choose>




							</div>
							<div class="col-1"></div>

							<div class="col-5">
								<c:choose>
									<c:when test="${memberUser.member_no eq data.svo.member_no }">

										<input type="button" class="btn btn-primary"
											style="width: 142.656px;" value="수정하기">

									</c:when>

									<c:when test="${memberUser.member_no eq data.stvo.buyer_no }">
										<input type="button" class="btn btn-primary"
											style="width: 142.656px;" value="구매하기">

									</c:when>


									<c:otherwise>

										<form action="buyprocess.do" method="post" id="buyprocess">

											<input type="hidden" name="item_no"
												value="${data.svo.item_no }"> <input type="hidden"
												name="buyer_no" value="${memberUser.member_no }"> <input
												type="button" class="btn btn-primary" onclick="buyprocess()"
												style="width: 142.656px;" value="구매하기">

										</form>

									</c:otherwise>
								</c:choose>
							</div>

						</div>

						<div class="row mt-4" id="aaa1"
							style="border-top: gray 1px solid; padding-top: 8px;">
							<div class="col-6">문의하기</div>
						</div>
						<div class="row mt-2">

							<div class="col">
								<textarea id="writecomment" rows="10" cols="34"></textarea>
								<a class="wc" onclick="writeComment()">질문 등록하기</a>

							</div>



						</div>




					</div>



				</div>

			</div>


		</div>


	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
	</script>
</body>
</html>