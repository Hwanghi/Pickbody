
var logined = false;
var profileImageLink = null;
var trainerNo = null;
var trainerPoint = -1;
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

function refreshSidebar() {
		firstBox = document.getElementsByClassName("firstBox")[0];
		firstBox.innerHTML = "";

		// 프로필 사진
		var profileBox = document.createElement("div");
		profileBox.setAttribute("class", "col-7 d-flex flex-column text-center position-relative bg-black p-2");
		profileBox.setAttribute("style", "height:200px");
		var logoutBtn = document.createElement("a");
		logoutBtn.setAttribute("class", "logoutBtn position-absolute text-start text-white");
		logoutBtn.setAttribute("href", "../trainer/logoutProcess.do");
		logoutBtn.innerText = "로그아웃";
		var profileImageBox = document.createElement("div");
		profileImageBox.setAttribute("class", "d-flex flex-column justify-content-center overflow-hidden");
		profileImageBox.setAttribute("style", "height:180px")
		var profileImage = document.createElement("img");
		profileImage.setAttribute("class", "img-fluid");
		var imageLink = "/upload/trainer/profile/";
		if(profileImageLink != null) {
			imageLink += profileImageLink;
		} else {
			imageLink = "../resources/img/logo.png";
		}
		profileImage.setAttribute("src", imageLink);
		profileImageBox.appendChild(profileImage);
		var profileNick = document.createElement("a");
		profileNick.setAttribute("class", "fs-5 text-white");
		profileNick.setAttribute("href", "../trainer/myPage.do");
		profileNick.innerText = trainerName + " 강사님";

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
			var titleBox = document.createElement("div");
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

		// 좋아요 
		var likeBox = menuList[1].children;
		var likeIcon = likeBox[0].children;
		likeIcon[0].setAttribute("class", "bi bi-heart-fill");
		likeIcon[0].setAttribute("style", "color:red;")
		likeBox[1].innerText = "좋아요";

		// 알림
		var receiptBox = menuList[2].children;
		var receiptIcon = receiptBox[0].children;
		receiptIcon[0].setAttribute("class", "bi bi-bell");
		receiptBox[1].innerText = "새알림";

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
		pointValue.innerText = trainerPoint;
		secendBox.appendChild(pointTitleBox);
		secendBox.appendChild(pointValue);

		
}

function getSessionUserInfo(callback) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		var data = JSON.parse(xmlhttp.responseText);
		logined = data.isLogined 
		if (logined == true) {
			trainerNo = data.trainerNo;
			trainerName = data.trainerName;
			trainerPoint = data.trainerPoint;
			if(data.profileImageVo != null)
				profileImageLink = data.profileImageVo.image_link;
			if(callback != undefined){
				callback();
			}
		} else {
			logined = false;
			trainerNo = -1;
			trainerName = null;
			trainerPoint = -1;
			profileImageLink = null;
			trainerName = null;
			dueToDate = null;
		}
		
	}
};

  xmlhttp.open("get", "../trainer/getSessionUserInfo.do");
  xmlhttp.send();
}

function init(){
	getSessionUserInfo(refreshSidebar);
}

window.addEventListener("DOMContentLoaded" , init);