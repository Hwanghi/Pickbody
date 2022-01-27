<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="../resources/js/sidebar_member.js?version=2.2.2"></script>
<!-- 그래프 관련 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});


  function drawChart1(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date', 'weight']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);

		  var timeString = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_weight]);
	  }


    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '몸무게',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_weight'));

    chart.draw(data, options);
  }
  
  function drawChart2(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date', 'skeletalmusclemass']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);

		  var timeString = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_skeletalmusclemass]);
	  }

    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '골격근량',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_skeletalmusclemass'));

    chart.draw(data, options);
  }
  
  function drawChart3(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date','bodyfatmass']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);

		  var timeString = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_bodyfatmass]);
	  }

    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '체지방량',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_bodyfatmass'));

    chart.draw(data, options);
  }

</script>
<script>
var updateMemberNickModal = null;
var doMemberProfileImageModal = null;


/*인바디 쓰기*/
function writeInbody(){
	
	if(logined == false){

		var result = confirm("로그인 하셔야 이용 가능합니다. 로그인 페이지로 이동하시겠습니까?");
		if(result){
			location.href = "./member/loginPage.do";				
		}
		return;
	}
	
	var measureddateBox = document.getElementById("measureddate");
	var measureddateText = measureddateBox.value;
	
	var statureBox = document.getElementById("stature");
	var statureText = statureBox.value;
	
	var weightBox = document.getElementById("weight");
	var weightText = weightBox.value;
	
	var skeletalmusclemassBox = document.getElementById("skeletalmusclemass");
	var skeletalmusclemassText = skeletalmusclemassBox.value;
	
	var bodyfatmassBox = document.getElementById("bodyfatmass");
	var bodyfatmassText = bodyfatmassBox.value;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			
			refreshInbodyList();
		}
	};
	
	xmlhttp.open("post" , "./writeInbodyProcess.do"); 
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("inbody_measureddate=" + measureddateText + "&inbody_stature=" + statureText + "&inbody_weight=" + weightText + "&inbody_skeletalmusclemass=" + skeletalmusclemassText + "&inbody_bodyfatmass=" + bodyfatmassText);
	
	measureddateBox.value = "";
	statureBox.value = "";
	weightBox.value = "";
	skeletalmusclemassBox.value = "";
	bodyfatmassBox.value = "";
	
	
}

function refreshInbodyList(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			
			drawChart1(data);
			drawChart2(data);
			drawChart3(data);
			
			
			//렌더링 DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근 속성 innerText등
			
			var inbodyListBox = document.getElementById("inbodyListBox");
			
			//제한조건 innerHTML은 초기화 제외 절대 사용 x
			inbodyListBox.innerHTML = "";
			
			for(inbodyData of data.inbodyDataList){
				
				var outerRow = document.createElement("div");
				outerRow.setAttribute("class" , "row mx-2 text-center");
				
				var outerCol = document.createElement("div");
				outerCol.setAttribute("class" , "col inbodyWrapper");
				
				outerRow.appendChild(outerCol);
				
				//리스트 부분
				var rowListBox = document.createElement("div");
				rowListBox.setAttribute("class", "row text-center");
				rowListBox.setAttribute("style", "border-bottom:1px solid #BEBEBE;");
				
				outerCol.appendChild(rowListBox);
				
				
				var ddd = new Date(inbodyData.memberInbodyVo.inbody_measureddate);
	    		  
	    		 var timeString = ddd.getFullYear() + "/" + (ddd.getMonth() + 1) + "/" + ddd.getDate();
				
				var measureddateBox = document.createElement("div");
				measureddateBox.setAttribute("class", "col-2 pe-0");
				//inbodyData.memberInbodyVo.inbody_measureddate
				measureddateBox.innerText = timeString;
				
				rowListBox.appendChild(measureddateBox);
				
				var statureBox = document.createElement("div");
				statureBox.setAttribute("class", "col px-0");
				statureBox.innerText = inbodyData.memberInbodyVo.inbody_stature;
				
				rowListBox.appendChild(statureBox);
				
				var weightBox = document.createElement("div");
				weightBox.setAttribute("class", "col px-0");
				weightBox.innerText = inbodyData.memberInbodyVo.inbody_weight;
				
				rowListBox.appendChild(weightBox);
				
				var skeletalmusclemassBox = document.createElement("div");
				skeletalmusclemassBox.setAttribute("class", "col px-0");
				skeletalmusclemassBox.innerText = inbodyData.memberInbodyVo.inbody_skeletalmusclemass;
				
				rowListBox.appendChild(skeletalmusclemassBox);
				
				var bodyfatmassBox = document.createElement("div");
				bodyfatmassBox.setAttribute("class", "col px-0");
				bodyfatmassBox.innerText = inbodyData.memberInbodyVo.inbody_bodyfatmass;
				
				rowListBox.appendChild(bodyfatmassBox);
				
				var bmiBox = document.createElement("div");
				bmiBox.setAttribute("class", "col px-0");
				bmiBox.innerText = inbodyData.bmi;
				
				rowListBox.appendChild(bmiBox);
				
				//삭제
				var deleteInbodyBox = document.createElement("div");
				deleteInbodyBox.setAttribute("class", "col ps-0");
				if(memberNo == inbodyData.memberInbodyVo.member_no){
					deleteInbodyBox.setAttribute("onclick" , "deleteInbody("+ inbodyData.memberInbodyVo.inbody_no +")");
				}
				deleteInbodyBox.innerText = "X";
				
				rowListBox.appendChild(deleteInbodyBox);
				
				inbodyListBox.appendChild(outerRow);
			}
			
		}
	};
	
	xmlhttp.open("get" , "./getInbodyList.do?member_no=" + memberNo); 
	xmlhttp.send();	
}



function deleteInbody(inbodyNo){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			refreshInbodyList();
		}
	};
	
	xmlhttp.open("get" , "./deleteInbodyProcess.do?inbody_no=" + inbodyNo); 
	xmlhttp.send();	
	
}

function refreshMyPageProfileImage(callback){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			// 프로필 이미지 업데이트
			if(data.profileImageVo != null)
	        	profileImageLink = data.profileImageVo.image_link;
			else
				profileImageLink = null;
			var memberProfileImageBox = document.getElementById("memberProfileImageBox");
			memberProfileImageBox.innerHTML = "";
			
			var registedMemberProfileImageImg = document.createElement("img");
			registedMemberProfileImageImg.setAttribute("id", "registedMemberProfileImage");
			registedMemberProfileImageImg.setAttribute("class", "img-fluid");
			registedMemberProfileImageImg.setAttribute("style", "max-height:300px");
			var imageLink = "/upload/member/profile/";
			if(profileImageLink != null) {
				imageLink += profileImageLink;
			} else {
				imageLink = "../resources/img/profile_blank.png";
			}
			registedMemberProfileImageImg.setAttribute("src", imageLink);

			memberProfileImageBox.appendChild(registedMemberProfileImageImg);
			
			if(callback != undefined){
				callback();
			}
		}
	};
	
	xmlhttp.open("get" , "./updateSessionUserInfo.do"); 
	xmlhttp.send();
	
}

function showMemberProfileImageModal(){
	
	doMemberProfileImageModal.show();
}
function hideMemberProfileImageModal(){
	
	doMemberProfileImageModal.hide();
}

function doMemberProfileImage(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			refreshMyPageProfileImage(refreshSidebar);
		}
	};
	
	xmlhttp.open("post" , "./registerMemberProfileProcess.do");
	//xmlhttp.setRequestHeader("Content-type","multipart/form-data");
	var formData = new FormData();
	var inputFileBox = document.getElementById("memberProfileImageFile");
	if(inputFileBox.value == ""){
		alert("이미지 파일이 선택되지 않았습니다.");

		return;
	}
	formData.append("memberProfileImageFile", inputFileBox.files[0]);
	xmlhttp.send(formData);	
	hideMemberProfileImageModal();
}

function refreshMemberNick(){
	
	var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status==200){
				var data = JSON.parse(xmlhttp.responseText);
				var memberNickBox = document.getElementById("memberNick");
				memberNickBox.innerHTML = "";
				
				memberNickBox.innerText = data.memberVo.member_nick;
			}
		};
		
		xmlhttp.open("get" , "./getMemberVoProcess.do?member_no=" + memberNo); 
		xmlhttp.send();		
			
}

function showNickModal(){

	updateMemberNickModal.show();
}

function hideNickModal(){
	
	updateMemberNickModal.hide();
}


function doUpdateMemberNick(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링 DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근 속성 innerText등
			
			//제한조건 innerHTML은 초기화 제외 절대 사용 x
			refreshMemberNick();
		}
	};
	var nicknameBox = document.getElementById("nickname");
	var nickNameText = nicknameBox.value;
	
	
	if(nicknameBox.value == ""){
		alert("변경하실 닉네임을 입력해주세요.");
		nickname.focus();
		return;
	}
	
	xmlhttp.open("post" , "./updateMemberNickProcess.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_no=" + memberNo + "&member_nick=" + nickNameText);
	
	hideNickModal();
}

function updateModal(){
	updateMemberNickModal = new bootstrap.Modal(document.getElementById('memberNickModal'));
}
function registerModal(){
	doMemberProfileImageModal = new bootstrap.Modal(document.getElementById('memberProfileImageModal'));
}

function initMyPage(){
	getSessionUserInfo(function(){
		if(logined == true){
			//refreshInbodyList();
			refreshMemberNick();
			refreshMyPageProfileImage();
			updateModal();
			registerModal();
		}
	});
}


google.charts.setOnLoadCallback(
	function() {
		getSessionUserInfo(refreshInbodyList);
	}
);
window.addEventListener("DOMContentLoaded" , initMyPage);
</script>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row background-gray">
				<div class="col-1"></div>
				<div class="col">
					<div class="row my-2 mx-0">
						<div class="col">
							<div class="row mt-3">
								<div class="col-6 px-3">
									<div class="row">
										<div class="col">
											<div id="memberProfileImageBox" class="col p-0 border text-center bg-black"></div>
										</div>
									</div>
									<div class="row mt-1">
										<div class="col-4"></div>
										<div class="col">
											<div class="row">
												<div class="col d-grid">
													<button id="memberProfileImageButton" type="button" class="btn btn-sm background-orange text-white" onclick="showMemberProfileImageModal()"><i class="bi bi-cloud-upload"></i>등록/수정</button>
												</div>
												<div class="col d-grid">
													<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='./deleteMemberProfileImageProcess.do'">
														<i class="bi bi-x-lg"></i>삭제
													</button>
												</div>
											</div>
											
											
										</div>
									</div>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="memberProfileImageModal" tabindex="-1" aria-labelledby="memberProfileImageModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header" style="color: black;">
								        <h5 class="modal-title" id="memberProfileImageModalLabel">프로필 사진</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body" style="color: black;">
								      	<div class="mb-3">
								      		<form>
								            	<input id="memberProfileImageFile" type="file" multiple accept="image/*" name="file">
								         	 </form>
								         </div>
								        
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn background-orange text-white" onclick="doMemberProfileImage()">등록</button>
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								      </div>
								    </div>
								  </div>
								</div>	
								<div class="col-6">
									<div class="row my-1">
										<div class="col-3">
											<i class="bi bi-person-circle" style="color: #F2B705;"></i>아이디
										</div>
										<div class="col">
											${memberUser.member_id }
										</div>
										<div class="col"></div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-person-fill" style="color: #F2B705;"></i>이름
										</div>
										<div class="col">
											${memberUser.member_name }
										</div>
										<div class="col"></div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-brush" style="color: #F2B705;"></i>닉네임
										</div>
										<div class="col" id="memberNick">
											
										</div>
										<div class="col d-grid">
											<button type="button" class="btn btn-sm background-orange text-white" id="nickUpdateButton" onclick="showNickModal()"><i class="bi bi-pencil-square"></i>수정</button>
										</div>
									</div>
									<!-- Modal -->
									<div class="modal fade" id="memberNickModal" tabindex="-1" aria-labelledby="memberNickModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header" style="color: black;">
									        <h5 class="modal-title" id="memberNickModalLabel">닉네임 수정</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body" style="color: black;">
									      	<div class="mb-3">
									      		<form>
									            	<label for="nickname" class="col-form-label">변경 할 닉네임</label>
										            <input type="text" class="form-control" id="nickname">
									         	 </form>
									         </div>
									        
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn" style="background-color: #F25C19;"onclick="doUpdateMemberNick()">수정</button>
									        <button type="button" class="btn" style="background-color: #BEBEBE;"data-bs-dismiss="modal">취소</button>
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-coin" style="color: #F2B705;"></i>포인트
										</div>
										<div class="col">
											${memberUser.member_point }
										</div>
										<div class="col d-grid">
											<button type="button" class="btn btn-sm btn-outline-danger font-red" onclick="location.href='./memberPointPage.do'"><i class="bi bi-plus-circle">충전</i></button>
										</div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-telephone-fill" style="color: #F2B705;"></i>전화
										</div>
										<div class="col">
											${memberUser.member_phone }
										</div>
										<div class="col"></div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-envelope-fill" style="color: #F2B705;"></i>이메일
										</div>
										<div class="col">
											${memberUser.member_email }
										</div>
										<div class="col"></div>
									</div>
									<div class="row my-3">
										<div class="col-3">
											<i class="bi bi-house-fill" style="color: #F2B705;"></i>주소
										</div>
										<div class="col">
											${memberUser.member_address }
										</div>
										<div class="col"></div>
									</div>
									<div class="row my-3">
										<div class="col-3"></div>
										<div class="col d-grid">
											<button type="button" class="btn btn-sm background-orange text-white" onclick="location.href='./updateMemberInfoPage.do'">회원정보 수정</button>
										</div>
										<div class="col-3"></div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<div class="row white-space mt-3" style="border-top: 2px solid #BEBEBE;">
						<div class="col mt-3"><h3>인바디 기록 측정</h3></div>
					</div>
					<div class="row text-center border py-3 ps-5">
						<div class="col-2 mx-1 px-0">
							<div class="row">
								<div class="col px-0">
									측정 날짜
								</div>
							</div>
							<div class="row">
								<div class="col px-0">
									<input class="form-control form-control-sm" id="measureddate" type="date" name="inbody_measureddate">
								</div>
							</div>
						</div>
						<div class="col-2 mx-3 px-0">
							<div class="row">
								<div class="col px-0">
								키(cm)
								</div>
							</div>
							<div class="row">
								<div class="col px-0">
									<input class="form-control form-control-sm" id="stature" type="number" step="0.01" name="inbody_stature">
								</div>
							</div>
						</div>
						<div class="col-2 mx-2 px-0">
							<div class="row">
								<div class="col px-0">
								몸무게(kg)
								</div>
							</div>
							<div class="row">
								<div class="col px-0">
									<input class="form-control form-control-sm" id="weight" type="number" step="0.01" name="inbody_weight">
								</div>
							</div>
						</div>
						<div class="col-2 mx-2 px-0">
							<div class="row">
								<div class="col px-0">
								골격근량(kg)
								</div>
							</div>
							<div class="row">
								<div class="col px-0">
									<input class="form-control form-control-sm" id="skeletalmusclemass" type="number" step="0.01" name="inbody_skeletalmusclemass">
								</div>
							</div>
						</div>
						<div class="col-2 mx-2 px-0">
							<div class="row">
								<div class="col px-0">
								체지방량(kg)
								</div>
							</div>
							<div class="row">
								<div class="col ps-0">
									<input class="form-control form-control-sm" id="bodyfatmass" type="number" step="0.01" name="inbody_bodyfatmass">
								</div>
							</div>
						</div>
						<div class="col position-relative">
							<div class="position-absolute bottom-0 start-0"><button type="button" class="btn btn-sm" onclick="writeInbody()" style="background-color: #F25C19;"><i class="bi bi-pencil text-white"></i></button></div>
						</div>
					</div>
					<div class="row text-center  mt-3" style="border-bottom:2px solid #BEBEBE;">
						<div class="col-2 pe-0">
							측정날짜
						</div>
						<div class="col px-0">
							키(cm)
						</div>
						<div class="col px-0">
							몸무게(kg)
						</div>
						<div class="col px-0">
							골격근량(kg)
						</div>
						<div class="col px-0">
							체지방량(kg)
						</div>
						<div class="col px-0">
							BMI
						</div>
						<div class="col ps-0">
							삭제
						</div>
					</div>
					<div class="row">
						<div id="inbodyListBox" class="col p-0" >
						</div>
					</div>
					<!-- 그래프 영역 -->
					<div class="row mt-5">
						<div class="col"></div>
						<div class="col">
							 <div  id="curve_chart_weight" style="width: 700px; height: 200px"></div>
						</div>
						<div class="col"></div>
					</div>
					<div class="row mt-2">
						<div class="col"></div>
						<div class="col">
							 <div id="curve_chart_skeletalmusclemass" style="width: 700px; height: 200px"></div>
						</div>
						<div class="col"></div>
					</div>
					<div class="row mt-2">
						<div class="col"></div>
						<div class="col">
							 <div id="curve_chart_bodyfatmass" style="width: 700px; height: 200px"></div>
						</div>
						<div class="col"></div>
					</div>
					<div class="row white-space my-5"></div>
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