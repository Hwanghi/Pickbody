/* global bootstrap: false */
(function () {
  "use strict";
  var tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]')
  );
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl);
  });
})();

var logined = false;
var subscribed = false;
var profileImageLink = null;
var memberName = null;
var memberPoint = -1;
var trainerName = null;
var dueToDate = null;

//선택한 노드 다음에 새로운 노드 추가
function insertAfter(referenceNode, newNode) {
  referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
}

function closeSidebar() {
  const sidebar =
    document.getElementsByClassName("sidenav")[0];
  sidebar.classList.remove("show-sidebar");
}

function toggleSidebar() {
  const sidebar =
    document.getElementsByClassName("sidenav")[0];

  if (sidebar.classList.contains("show-sidebar")) {
    sidebar.classList.remove("show-sidebar");
  } else {
    sidebar.classList.add("show-sidebar");
  }
}

function loginProcess(e) {
  var loginForm = e.closest(".loginForm");
  var idBox = loginForm.getElementsByClassName("idBox")[0];
  var pwBox = loginForm.getElementsByClassName("pwBox")[0];
  var params =
    "member_id=" +
    idBox.value +
    "&member_pw=" +
    pwBox.value;
  var xmlhttp = new XMLHttpRequest();

  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var data = JSON.parse(xmlhttp.responseText);
      logined = data.isLogined;
			if (logined == true) {
				memberName = data.memberName;
				memberPoint = data.memberPoint;
				if(data.profileImageVo != null)
				profileImageLink = data.profileImageVo.image_link;
				subscribed = data.isSubscribed;
				if(subscribed == true) {
					trainerName = data.trainerName;
					dueToDate = data.dueToDate;
				}
				refreshSidebar();
      } else {
				var warningBox = document.getElementById("warningBox");
				if(data.isBanned != null) {
					var bannedDate = new Date(data.isBanned);
					warningBox.innerText  = (""+bannedDate.getFullYear()).slice(-2)+"." + ("0"+(bannedDate.getMonth()+1)).slice(-2)+"."+("0" + bannedDate.getDate()).slice(-2) + "까지 정지된 회원입니다.";
				} else {
					warningBox.innerText = "아이디 또는 비밀번호가 틀립니다.";
				}
			}
    }
  };

  xmlhttp.open("post", "../member/loginProcess.do");
  xmlhttp.setRequestHeader(
    "Content-type",
    "application/x-www-form-urlencoded"
  );
  xmlhttp.send(params);
}
function moveMypage() {
	window.location.href='../member/myPage.do'; 
}
function refreshSidebar() {
		firstBox = document.getElementsByClassName("firstBox")[0];
		firstBox.innerHTML ="";

		// 프로필 사진
		var profileBox = document.createElement("div");
		profileBox.setAttribute("class", "col-7 d-flex flex-column text-center position-relative bg-black p-2");
		profileBox.setAttribute("style", "height:200px");
		profileBox.setAttribute("onclick", "moveMypage()");
		var logoutBtn = document.createElement("a");
		logoutBtn.setAttribute("class", "logoutBtn position-absolute text-start text-white");
		logoutBtn.setAttribute("href", "../member/logoutProcess.do");
		logoutBtn.innerText = "로그아웃";
		var profileImageBox = document.createElement("div");
		profileImageBox.setAttribute("class", "d-flex flex-column justify-content-center overflow-hidden background-gray pointer-text");
		profileImageBox.setAttribute("style", "height:180px");
		var profileImage = document.createElement("img");
		profileImage.setAttribute("class", "img-fluid");
		var imageLink = "/upload/member/profile/";
		if(profileImageLink != null) {
			imageLink += profileImageLink;
		} else {
			imageLink = "../resources/img/logo.png";
		}
		profileImage.setAttribute("src", imageLink);
		profileImageBox.appendChild(profileImage);
		var profileNick = document.createElement("div");
		profileNick.setAttribute("class", "fs-5 text-white");
		profileNick.innerText = memberName + " 회원님";

		profileBox.appendChild(logoutBtn);
		profileBox.appendChild(profileImageBox);
		profileBox.appendChild(profileNick);

		// 메뉴 
		var menuBox = document.createElement("div");
		menuBox.setAttribute("class", "col d-flex flex-column justify-content-center fs-5");
		var menuList = [];
		for(i=0; i<3; i++) {
			var menu = document.createElement("div");
			menu.setAttribute("class", "row mb-3");
			var iconBox = document.createElement("div");
			iconBox.setAttribute("class", "col-1");
			var icon = document.createElement("i");
			iconBox.appendChild(icon);
			var titleBox = document.createElement("a");
			titleBox.setAttribute("class", "col")
			menu.appendChild(iconBox);
			menu.appendChild(titleBox);
			menuList.push(menu);
		}
		
		// 쪽지함 
		var letterBox = menuList[0].children;
		var letterIcon = letterBox[0].children;
		letterIcon[0].setAttribute("class", "bi bi-envelope");
		letterBox[1].innerText = "쪽지함";
		letterBox[1].setAttribute("href", "../member/receiveMessagePage.do");

		// 좋아요 
		var likeBox = menuList[1].children;
		var likeIcon = likeBox[0].children;
		likeIcon[0].setAttribute("class", "bi bi-heart-fill");
		likeIcon[0].setAttribute("style", "color:red;")
		likeBox[1].innerText = "좋아요";

		// 그룹 팔로잉
		var followBox = menuList[2].children;
		var followIcon = followBox[0].children;
		followIcon[0].setAttribute("class", "bi bi-diagram-3");
		followBox[1].innerText = "스토리";
		followBox[1].setAttribute("href", "../member/myStoryPage.do");

		for(menu of menuList) {
			menuBox.appendChild(menu);
		}

		firstBox.appendChild(profileBox);
		firstBox.appendChild(menuBox);

		secendBox = document.getElementsByClassName("secendBox")[0];
		secendBox.innerHTML = "";
		var pointTitleBox = document.createElement("div");
		pointTitleBox.setAttribute("class", "col-7 fs-4 text-end align-baseline");
		var pointIcon = document.createElement("i");
		pointIcon.setAttribute("class", "bi bi-shop");
		var pointTitle = document.createElement("a");
		pointTitle.innerText = "보유포인트";
		pointTitleBox.appendChild(pointIcon);
		pointTitleBox.appendChild(pointTitle);
		var pointValue = document.createElement("div");
		pointValue.setAttribute("class", "col fs-4");
		pointValue.innerText = memberPoint;
		secendBox.appendChild(pointTitleBox);
		secendBox.appendChild(pointValue);

		// 구독 중이면...
		if(subscribed) {
			// 세번째 박스 조작부
			thirdBoxInfo = document.getElementsByClassName("thirdBoxInfo")[0];
			var infoBox = document.createElement("div");
			infoBox.setAttribute("class", "col infoBox");
			infoBox.innerHTML = "";
			// 00 강사 구독 중
			var trainerInfoRow = document.createElement("div");
			trainerInfoRow.setAttribute("class", "row my-2");
			var trainerInfoBox = document.createElement("div");
			trainerInfoBox.setAttribute("class", "col text-center text-white background-orange");
			var jsDate = new Date(dueToDate);
			trainerInfoBox.innerText = trainerName + " 강사 구독 중 ~" + (""+jsDate.getFullYear()).slice(-2)+"." + ("0"+(jsDate.getMonth()+1)).slice(-2)+"."+("0" + jsDate.getDate()).slice(-2);
			trainerInfoRow.appendChild(trainerInfoBox);
			infoBox.appendChild(trainerInfoRow);
			// 일정 확인 버튼 
			var scheduleRow = document.createElement("div");
			scheduleRow.setAttribute("class", "row");
			var scheduleBtnBox = document.createElement("div");
			scheduleBtnBox.setAttribute("class", "col");
			var scheduleBtn = document.createElement("button");
			scheduleBtn.setAttribute("class", "form-control btn btn-outline-light");
			scheduleBtn.setAttribute("onclick", "checkDailySchedule()");
			scheduleBtn.innerText = "오늘의 일정 보기";
			infoBox.appendChild(scheduleBtn);
			scheduleRow.appendChild(scheduleBtnBox);
			infoBox.appendChild(scheduleRow);
			thirdBoxInfo.appendChild(infoBox);
			// 데이터가 들어갈 자리
			thirdBox = document.getElementsByClassName("thirdBox")[0];
			thirdBox.innerHTML = "";
			var subscribedBox = document.createElement("div");
			subscribedBox.setAttribute("class", "col subscribedBox background-gray");
			thirdBox.appendChild(subscribedBox);
		}
}

function checkDailySchedule() {
  var xmlhttp = new XMLHttpRequest();

  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var data = JSON.parse(xmlhttp.responseText);
      subscribedBox = document.getElementsByClassName("subscribedBox")[0];
			subscribedBox.innerHTML = "";
			// 오늘의 식단 타이틀
			var dailyDietTitleRow = document.createElement("div");
			dailyDietTitleRow.setAttribute("class", "row");
			var dailyDietTitleCol = document.createElement("div");
			dailyDietTitleCol.setAttribute("class", "col fs-3 text-black");
			dailyDietTitleCol.innerText = "오늘의 식단";
			dailyDietTitleRow.appendChild(dailyDietTitleCol);
			subscribedBox.appendChild(dailyDietTitleRow);
			// 오늘의 식단표
			var dailyDietTableRow = document.createElement("div");
			dailyDietTableRow.setAttribute("class", "row");
			var dailyDietTableCol = document.createElement("div");
			dailyDietTableCol.setAttribute("class", "col");
			var dailyDietTable = document.createElement("table");
			dailyDietTable.setAttribute("class", "table table-bordered");
			var tableHead = document.createElement("thead");
			var trHead = document.createElement("tr");
			trHead.setAttribute("class", "text-center");
			var thHeadTitleList = ["아침", "점심", "저녁"];
			for (i=0; i<3; i++) {
				var thHead = document.createElement("th");
				thHead.innerText = thHeadTitleList[i];
				trHead.appendChild(thHead);
			}
			tableHead.appendChild(trHead);
			var tableBody = document.createElement("tbody");
			var trBody = document.createElement("tr");
			trBody.setAttribute("class", "text-center");
			var tdBodyList = [];
			for (i=0; i<3; i++) {
				var tdBody = document.createElement("td");
				tdBody.setAttribute("class", "p-2 light");
				tdBody.setAttribute("style", "font-size:10px");
				tdBodyList.push(tdBody);
			}
			for (dailyFoodMap of data.dailyFoodList) {
				var time = dailyFoodMap.time;
				for(foodMap of dailyFoodMap.foodMapList) {
					tdBodyList[time].innerHTML += foodMap.name + foodMap.number + foodMap.unit + "<br>";
				}
			}
			for (tdBody of tdBodyList) {
				trBody.appendChild(tdBody);
			}
			tableBody.appendChild(trBody);
			dailyDietTable.appendChild(tableHead);
			dailyDietTable.appendChild(tableBody);
			dailyDietTableCol.appendChild(dailyDietTable);
			dailyDietTableRow.appendChild(dailyDietTableCol);
			subscribedBox.appendChild(dailyDietTableRow);

			// 오늘의 운동 타이틀
			var dailyExerciseTitleRow = document.createElement("div");
			dailyExerciseTitleRow.setAttribute("class", "row d-flex align-items-baseline");
			var dailyExerciseTitleCol = document.createElement("div");
			dailyExerciseTitleCol.setAttribute("class", "col-7 fs-3 text-black");
			dailyExerciseTitleCol.innerText = "오늘의 운동";
			dailyExerciseTitleRow.appendChild(dailyExerciseTitleCol);
			if(data.dailyExerciseList.length > 0) {
				var dailyExerciseLink = document.createElement("div");
				dailyExerciseLink.setAttribute("class", "col fs-6 light font-darkgray text-end");
				var toDoTodayLink = "../member/toDoTodayPage.do?schedule_no=" + data.scheduleDailyVo.schedule_no;
				dailyExerciseLink.setAttribute("onclick", "location.href='"+toDoTodayLink+"'");
				dailyExerciseLink.innerText = "일지 작성하기";
				dailyExerciseTitleRow.appendChild(dailyExerciseLink);
			}
			
			subscribedBox.appendChild(dailyExerciseTitleRow);
			// 오늘의 운동 리스트
			var dailyExerciseTableRow = document.createElement("div");
			dailyExerciseTableRow.setAttribute("class", "row");
			var dailyExerciseTableCol = document.createElement("div");
			dailyExerciseTableCol.setAttribute("class", "col");
			var dailyExerciseTable = document.createElement("table");
			dailyExerciseTable.setAttribute("class", "table table-bordered");
			var tableHead1 = document.createElement("thead");
			var trHead1 = document.createElement("tr");
			trHead1.setAttribute("style", "text-align:center;font-size:12px");
			var thHeadTitleList1 = ["운동명", "세트", "횟수", "중량", "쉬는시간"];
			for (thHeadTitle of thHeadTitleList1) {
				var thHead = document.createElement("th");
				thHead.innerText = thHeadTitle;
				trHead1.appendChild(thHead);
			}
			tableHead1.appendChild(trHead1);
			var tableBody1 = document.createElement("tbody");
			for (dailyExercise of data.dailyExerciseList) {
				var trBody = document.createElement("tr");
				trBody.setAttribute("class", "text-center");
				var tdBody1 = document.createElement("td");
				tdBody1.innerText = dailyExercise.exerciseCategoryVo.exercise_category_name;
				var tdBody2 = document.createElement("td");
				tdBody2.innerText = dailyExercise.rutineDailyVo.rutine_set;
				var tdBody3 = document.createElement("td");
				tdBody3.innerText = dailyExercise.rutineDailyVo.rutine_number;
				var tdBody4 = document.createElement("td");
				tdBody4.innerText = dailyExercise.rutineDailyVo.rutine_weight + "kg";
				var tdBody5 = document.createElement("td");
				tdBody5.innerText = dailyExercise.rutineDailyVo.rutine_resttime;
				trBody.appendChild(tdBody1);
				trBody.appendChild(tdBody2);
				trBody.appendChild(tdBody3);
				trBody.appendChild(tdBody4);
				trBody.appendChild(tdBody5);
				tableBody1.appendChild(trBody);
			}
			dailyExerciseTable.appendChild(tableHead1);
			dailyExerciseTable.appendChild(tableBody1);
			dailyExerciseTableCol.appendChild(dailyExerciseTable);
			dailyExerciseTableRow.appendChild(dailyExerciseTableCol);
			subscribedBox.appendChild(dailyExerciseTableRow);

			// 강사 주간 한마디 타이틀
			var adviceTitleRow = document.createElement("div");
			adviceTitleRow.setAttribute("class", "row");
			var adviceTitleCol = document.createElement("div");
			adviceTitleCol.setAttribute("class", "col fs-3 text-black");
			adviceTitleCol.innerText = "강사 주간 한마디";
			adviceTitleRow.appendChild(adviceTitleCol);
			subscribedBox.appendChild(adviceTitleRow);
			// 강사 주간 한마디 + 프로필
			var trainerAdviceRow = document.createElement("div");
			trainerAdviceRow.setAttribute("class", "row border-top p-2");
			var trainerProfileBox = document.createElement("div");
			trainerProfileBox.setAttribute("class", "col");
			var trainerProfileImage =  document.createElement("img");
			trainerProfileImage.setAttribute("src", "/upload/trainer/profile/" + data.trainerProfileImageVo.image_link);
			trainerProfileImage.setAttribute("class", "img-thumbnail");
			trainerProfileBox.appendChild(trainerProfileImage);
			var trainerAdvice = document.createElement("div");
			trainerAdvice.setAttribute("class", "col text-black");
			trainerAdvice.innerText = data.scheduleWeekVo.schedule_advice;
			
			trainerAdviceRow.appendChild(trainerProfileBox);
			trainerAdviceRow.appendChild(trainerAdvice);
			subscribedBox.appendChild(trainerAdviceRow);
    }
  };

  xmlhttp.open("post", "../member/getToDoToday.do");
  xmlhttp.setRequestHeader(
    "Content-type",
    "application/x-www-form-urlencoded"
  );
  xmlhttp.send();

}


function getSessionUserInfo(callback) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      var data = JSON.parse(xmlhttp.responseText);
      logined = data.isLogined 
			if (logined == true) {
				memberNo = data.memberNo;
				memberName = data.memberName;
				memberPoint = data.memberPoint;
				if(data.profileImageVo != null)
        	profileImageLink = data.profileImageVo.image_link;
				subscribed = data.isSubscribed;
				if(subscribed == true) {
					trainerName = data.trainerName;
					dueToDate = new Date(data.dueToDate);
				}

				if(callback != undefined){
					callback();
				}
      } else {
        logined = false;
				memberNo = -1;
				memberName = null;
				memberPoint = -1;
        profileImageLink = null;
				trainerName = null;
				dueToDate = null;
      }
			
    }
  };

  xmlhttp.open("get", "../member/getSessionUserInfo.do");
  xmlhttp.send();
}

function init(){
	getSessionUserInfo(refreshSidebar);
}

window.addEventListener("DOMContentLoaded" , init);