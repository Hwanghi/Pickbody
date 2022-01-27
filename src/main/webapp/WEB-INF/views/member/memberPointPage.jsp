<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="../resources/js/sidebar_member.js"></script>

<script>
var chargeMemberPointModal = null;
var withdrawMemberPointModal = null;

function refreshMemberPointHistory(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			var pointHistoryBox = document.getElementById("pointHistoryList");
			pointHistoryBox.innerHTML="";
			
			for(pointHistoryData of data.memberPointHistoryList){
				
				var historyRaw = document.createElement("div");
				historyRaw.setAttribute("class" , "row mx-2 text-center");
				historyRaw.setAttribute("style", "border: 1px solid #BEBEBE;");
				
				var historyDateBox = document.createElement("div");
				historyDateBox.setAttribute("class" , "col-4");
				var ddd = new Date(pointHistoryData.memberPointHistoryVo.point_history_date);
	    		var timeString = ddd.getFullYear() + "/" + (ddd.getMonth() + 1) + "/" + ddd.getDate();
	    		historyDateBox.innerText = timeString;
				historyRaw.appendChild(historyDateBox);
				
				var historyUsewayBox = document.createElement("div");
				historyUsewayBox.setAttribute("class" , "col-2");
				historyUsewayBox.innerText = pointHistoryData.memberPointHistoryVo.point_history_useway;
				historyRaw.appendChild(historyUsewayBox);
				
				var historyAmountBox = document.createElement("div");
				historyAmountBox.setAttribute("class" , "col-3");
				historyAmountBox.innerText = pointHistoryData.memberPointHistoryVo.point_history_amount;
				historyRaw.appendChild(historyAmountBox);
				
				var historyleftBox = document.createElement("div");
				historyleftBox.setAttribute("class" , "col");
				historyleftBox.innerText = pointHistoryData.memberPointHistoryVo.point_history_leftover_point;
				historyRaw.appendChild(historyleftBox);
				
				
				pointHistoryBox.appendChild(historyRaw);
			}
		}
	};
	
	xmlhttp.open("get" , "./getMemberPointHistory.do?member_no=" + memberNo); 
	xmlhttp.send();	
}

function refreshMemberPoint(){
	
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);
				var memberPointBox = document.getElementById("memberPoint");
				memberPointBox.innerHTML = "";
				
				memberPointBox.innerText = data.memberVo.member_point;
			}
		};
		
		xmlhttp.open("get" , "./getMemberVoProcess.do?member_no=" + memberNo); 
		xmlhttp.send();		
			
}

function showChargePointModal(){

	chargeMemberPointModal.show();
}

function hideChargePointModal(){
	
	chargeMemberPointModal.hide();
}


function doChargeMemberPoint(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링 DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근 속성 innerText등
			
			//제한조건 innerHTML은 초기화 제외 절대 사용 x
			refreshMemberPoint();
			refreshMemberPointHistory()
		}
	};
	var howchargeBox = document.getElementById("howChargePoint");
	var pointText = howchargeBox.value;
	howchargeBox.innerHTML = "";
	
	if(howchargeBox.value == ""){
		alert("충전 하실 포인트 양을 입력해주세요");
		nickname.focus();
		return;
	}
	
	xmlhttp.open("post" , "./chargeMemberPointProcess.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_no=" + memberNo + "&point=" + pointText);
	
	hideChargePointModal();
}

function showWithdrawPointModal(){

	withdrawMemberPointModal.show();
}

function hideWithdrawPointModal(){
	
	withdrawMemberPointModal.hide();
}


function doWithdrawMemberPoint(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링 DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근 속성 innerText등
			
			//제한조건 innerHTML은 초기화 제외 절대 사용 x
			refreshMemberPoint();
			refreshMemberPointHistory();
		}
	};
	var howWithdrawBox = document.getElementById("howWithdrawPoint");
	var pointText = howWithdrawBox.value;
	howWithdrawBox.innerHTML = "";
	
	
	if(howWithdrawBox.value == ""){
		alert("충전 하실 포인트 양을 입력해주세요");
		nickname.focus();
		return;
	}
	
	xmlhttp.open("post" , "./deductionMemberPointProcess.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_no=" + memberNo + "&point=" + pointText);
	
	hideWithdrawPointModal();
}

function chargeModal(){
	chargeMemberPointModal = new bootstrap.Modal(document.getElementById('memberChargePointModal'));
}
function withdrawModal(){
	withdrawMemberPointModal = new bootstrap.Modal(document.getElementById('memberWithdrawPointModal'));
}

function init(){
	getSessionUserInfo(function(){
		if(logined == true){
			refreshMemberPointHistory();
			refreshMemberPoint();
			chargeModal();
			withdrawModal();
			
		}
	});
}



window.addEventListener("DOMContentLoaded" , init);
</script>
</head>
<body>
	<div style="width:1200px; margin:0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row mt-2">
				<div class="col-1">
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
							<div class="row mt-3">
								<div class="col-1"></div>
								<div class="col-3 text-center"  style="background-color: #F2F2F2;">
									<img src="/upload/member/profile/${memberProfileImageVo.image_link }" style="width:200px; height: 200px;">
								</div>
								<div class="col"  style="background-color: #F2F2F2;">
									<div class="row mt-1">
										<div class="col">
											<div class="row mt-2">
												<div class="col py-1" style="border-bottom: 1px solid #F2B705;">
													${memberUser.member_nick }님 
												</div>
											</div>
											<div class="row mt-2" style="border-bottom: 1px solid #F2B705;">
												<div class="col py-1">
													보유 포인트
												</div>
												<div id="memberPoint" class="col">
													${memberUser.member_point }
												</div>
												<div class="col text-end py-1">
													<button type="button" class="btn btn-secondary btn-sm"
															id="chargePointButton" style="background-color: #F25C19;" onclick="showChargePointModal()">충전</button>
													<!-- Modal -->
													<div class="modal fade" id="memberChargePointModal" tabindex="-1" aria-labelledby="memberChargePointModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header" style="color: black;">
													        <h5 class="modal-title" id="memberChargePointModalLabel">포인트 충전</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body" style="color: black;">
													      	<div class="mb-3">
													      		<form>
													            	<label for="mPoint" class="col-form-label">충전 할 포인트</label>
														            <input type="text" class="form-control" id="howChargePoint">
													         	 </form>
													         </div>
													        
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary" onclick="doChargeMemberPoint()">충전</button>
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
													      </div>
													    </div>
													  </div>
													</div>
												</div>
												
												<div class="col py-1">
													<button type="button" class="btn btn-secondary btn-sm"
															id="chargePointButton" style="background-color: #BEBEBE;" onclick="showWithdrawPointModal()">출금</button>
													<!-- Modal -->
													<div class="modal fade" id="memberWithdrawPointModal" tabindex="-1" aria-labelledby="memberWithdrawPointModalLabel" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header" style="color: black;">
													        <h5 class="modal-title" id="memberWithdrawPointModalLabel">포인트 충전</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body" style="color: black;">
													      	<div class="mb-3">
													      		<form>
													            	<label for="mPoint" class="col-form-label">출금 할 포인트</label>
														            <input type="text" class="form-control" id="howWithdrawPoint">
													         	 </form>
													         </div>
													        
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary" onclick="doWithdrawMemberPoint()">출금</button>
													        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
													      </div>
													    </div>
													  </div>
													</div>
												</div>
											</div>
											<div class="row my-2 py-1 text-center">
												<div class="col ps-0 pe-3">
													<div class="row mx-2">
														<div class="col-4" style="border-bottom: 1px solid #BEBEBE;">날짜</div>
														<div class="col-2" style="border-bottom: 1px solid #BEBEBE;">내역</div>
														<div class="col-3" style="border-bottom: 1px solid #BEBEBE;">포인트</div>
														<div class="col" style="border-bottom: 1px solid #BEBEBE;">잔여 포인트</div>
													</div>
													<div id="pointHistoryList">
													</div>
												</div>
												
											</div>
											
										</div>
										<div class="col-3"></div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<div class="col-1">
				</div>
			</div>
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		
</body>
</html>