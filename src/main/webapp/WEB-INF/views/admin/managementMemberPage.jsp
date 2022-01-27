<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}
a{
	text-decoration:none;
}
</style>

<script>
var logined = false;
var adminNo = null;
var inhibitionMemberModal = null;

function getSessionAdminInfo(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			if(data.isLogined == true){
				logined = true;
				adminNo = data.adminNo; 
			}else{
				logined = false;
			}
		}
	};
	xmlhttp.open("get" , "../admin/getSessionAdminInfo.do" , false); 
	xmlhttp.send();		
}

function refreshMemberList(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			
			var memberListBox = document.getElementById("memberList");
			memberListBox.innerHTML="";
			
			for(memberData of data.memberList){
				
				var memberListRaw = document.createElement("div");
				memberListRaw.setAttribute("class" , "row my-2");
				
				var memberNoBox = document.createElement("div");
				memberNoBox.setAttribute("class" , "col-1");
				memberNoBox.innerText = memberData.memberVo.member_no;
				memberListRaw.appendChild(memberNoBox);
				
				var memberNickBox = document.createElement("div");
				memberNickBox.setAttribute("class" , "col");
				memberNickBox.innerText = memberData.memberVo.member_nick;
				memberListRaw.appendChild(memberNickBox);
				
				var memberIdBox = document.createElement("div");
				memberIdBox.setAttribute("class" , "col");
				memberIdBox.innerText = memberData.memberVo.member_id;
				memberListRaw.appendChild(memberIdBox);
				
				var memberJoinDateBox = document.createElement("div");
				memberJoinDateBox.setAttribute("class" , "col");
				var a = new Date(memberData.memberVo.member_joindate);
	    		var joindateString = a.getFullYear() + "/" + (a.getMonth() + 1) + "/" + a.getDate();
	    		memberJoinDateBox.innerText = joindateString;
				memberListRaw.appendChild(memberJoinDateBox);
				
				var memberPointBox = document.createElement("div");
				memberPointBox.setAttribute("class" , "col");
				memberPointBox.innerText = memberData.memberVo.member_point;
				memberListRaw.appendChild(memberPointBox);
				
				var memberInhibitionEndDateBox = document.createElement("div");
				memberInhibitionEndDateBox.setAttribute("class" , "col");
				if(memberData.memberInhibitionVo == null){
					memberInhibitionEndDateBox.innerText = "";
				} else{
					var b = new Date(memberData.memberInhibitionVo.inhibition_date);
		    		var inhibitionEndDateString = b.getFullYear() + "/" + (b.getMonth() + 1) + "/" + b.getDate();
		    		memberInhibitionEndDateBox.innerText = inhibitionEndDateString;
		    	}
				memberListRaw.appendChild(memberInhibitionEndDateBox);
				
				var memberInhibitionStartDateBox = document.createElement("div");
				memberInhibitionStartDateBox.setAttribute("class" , "col");
				if(memberData.memberInhibitionVo == null){
					memberInhibitionStartDateBox.innerText = "";
				}else{
					var c = new Date(memberData.memberInhibitionVo.inhibition_resistdate);
		    		var inhibitionStartDateString = c.getFullYear() + "/" + (c.getMonth() + 1) + "/" + c.getDate();
		    		memberInhibitionStartDateBox.innerText = inhibitionStartDateString;
				}
				memberListRaw.appendChild(memberInhibitionStartDateBox);
				
				var inhibitionButtonBox = document.createElement("div");
				inhibitionButtonBox.setAttribute("class", "col-1");
				inhibitionButtonBox.innerText="";
				memberListRaw.appendChild(inhibitionButtonBox);
				
				
				var bb = document.createElement("i");
				bb.setAttribute("onclick" , "showInhibitionMemberModal("+memberData.memberVo.member_no+")");
				bb.setAttribute("class" , "bi bi-person-dash");
				bb.setAttribute("style" , "color: #DB3607;");
				
				
				inhibitionButtonBox.appendChild(bb);
				
				
				
				
				
				memberListBox.appendChild(memberListRaw);
			}
		}
	};
	
	xmlhttp.open("post" , "./getMemberList.do"); 
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();
}

function showInhibitionMemberModal(no){

	document.getElementById("whatMemberNo").value = no;
	
	inhibitionMemberModal.show();
}

function hideInhibitionMemberModal(){
	
	inhibitionMemberModal.hide();
}

function doInhibitionMember(){
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			
			//렌더링 DOM 엘리먼트 컨트롤 : 생성 추가 삭제 접근 속성 innerText등
			
			//제한조건 innerHTML은 초기화 제외 절대 사용 x
			refreshMemberList();

		}
	};
	var howInhibitionDayBox = document.getElementById("howInhibitionDay");
	var dayText = howInhibitionDayBox.value;
	howInhibitionDayBox.innerHTML = "";
	
	var whatMemberNoBox = document.getElementById("whatMemberNo");
	var memberNoText = whatMemberNoBox.value;
	whatMemberNoBox.innerHTML = "";
	
	if(whatMemberNoBox.value == ""){
		alert("회원번호를 입력해주세요");
		whatMemberNoBox.focus();
		return;
	}
	if(howInhibitionDayBox.value == ""){
		alert("정지시킬 일 수를 입력 해 주세요.");
		howInhibitionDayBox.focus();
		return;
	}
	
	xmlhttp.open("post" , "./inhibitionProcess.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_no=" + memberNoText + "&day=" + dayText);
	
	hideInhibitionMemberModal();
}

function inhibitionModal(){
	inhibitionMemberModal = new bootstrap.Modal(document.getElementById('inhibitionMemberModal'));
}

function init(){
	inhibitionModal();
	refreshMemberList();
	setInterval(refreshMemberList , 10000);	
	getSessionAdminInfo(function(){
		if(logined == true){
			
			
			
		}
	});
}

window.addEventListener("DOMContentLoaded" , init);
</script>
</head>
<body>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<!-- 네이 바 row -->
				<div class="col-2 px-0">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col-9 my-2" style="background-color:#F2F2F2;">
					<div class="row mt-3 px-1"><!-- 검색... -->
						<div class="col-2">
							<select name="searchOption" class="form-control">
								<option value="member_no">회원 번호</option>
								<option value="member_id">회원 ID</option>
							</select>
						</div>
						<div class="col">
							<input name="searchWord" class="form-control" type="text" placeholder="검색어를 입력하세요">
						</div>
						<div class="col-2 d-grid">
							<input class="btn btn-secondary" type="submit" value="검색" style="background-color:#F25C19;">
						</div>
					</div>
					<div class="row mt-2 mx-1 text-center" style="background-color: white;  ">
						<div class="col">
							<div class="row mb-1 border-bottom" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">
								<div class="col-1">
									번호
								</div>
								<div class="col">
									<i class="bi bi-person-fill"></i>닉네임
								</div>
								<div class="col">
									<i class="bi bi-fingerprint"></i>아이디
								</div>
								<div class="col">
									<i class="bi bi-calendar"></i>가입일
								</div>
								<div class="col">
									<i class="bi bi-coin"></i>보유포인트
								</div>
								<div class="col">
									<i class="bi bi-calendar-x"></i>정지 해제
								</div>
								<div class="col">
									<i class="bi bi-calendar-plus"></i>정지 시작
								</div>
								<div class="col-1">
									<i class="bi bi-person-dash-fill" id="inhibitionMemberButton" onclick="showInhibitionMemberModal()" style="color: #DB3607;"></i>정지
									<!-- Modal -->
									<div class="modal fade" id="inhibitionMemberModal" tabindex="-1" aria-labelledby="inhibitionMemberModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header" style="color: black;">
									        <h5 class="modal-title" id="inhibitionMemberModalLabel">회원정지</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body" style="color: black;">
									      	<div class="mb-3">
									      		<form>
									            	<label for="mPoint" class="col-form-label">정지 시킬 회원 번호</label>
										            <input type="text" class="form-control" id="whatMemberNo" disabled>
									            	<label for="mPoint" class="col-form-label">정지 시킬 일 수</label>
										            <input type="text" class="form-control" id="howInhibitionDay">
									         	 </form>
									         </div>
									        
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-primary" onclick="doInhibitionMember()">정지</button>
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									      </div>
									    </div>
									  </div>
									</div>
								</div>
							</div>
							<div id="memberList">
							</div>
						</div>
					</div>
				</div>
				<div class="col">
				</div>
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