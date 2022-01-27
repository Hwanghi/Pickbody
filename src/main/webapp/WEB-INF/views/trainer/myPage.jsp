<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer My Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_trainer.css">
<script src="../resources/js/sidebar_trainer.js?version=2.2.1"></script>
<script>
var updateTrainerNickModal = null;
var doTrainerProfileImageModal = null;

function refreshMyPageProfileImage(callback){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			// 프로필 이미지 불러오기 -> 사이드바 전역변수에 링크등록 
			if(data.profileImageVo != null)
	        	profileImageLink = data.profileImageVo.image_link;
			else
				profileImageLink = null;
			var trainerProfileImageBox = document.getElementById("trainerProfileImageBox");
			trainerProfileImageBox.innerHTML = "";
			
			var registedtrainerProfileImageImg = document.createElement("img");
			registedtrainerProfileImageImg.setAttribute("id", "registedtrainerProfileImage");
			registedtrainerProfileImageImg.setAttribute("class", "img-fluid");
			var imageLink = "/upload/trainer/profile/";
			if(profileImageLink != null) {
				imageLink += profileImageLink;
			} else {
				imageLink = "../resources/img/logo.png";
			}
			registedtrainerProfileImageImg.setAttribute("src", imageLink);

			trainerProfileImageBox.appendChild(registedtrainerProfileImageImg);
			
			if(callback != undefined){
				callback();
			}
		}
	};
	
	xmlhttp.open("get" , "./getTrainerProfileImageProcess.do?trainer_no="+trainerNo); 
	xmlhttp.send();
	
}

function showTrainerProfileImageModal(){
	
	doTrainerProfileImageModal.show();
}
function hideTrainerProfileImageModal(){
	
	doTrainerProfileImageModal.hide();
}

function doTrainerProfileImage(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			//var data = JSON.parse(xmlhttp.responseText);
			refreshMyPageProfileImage(refreshSidebar);
		}
	};
	
	xmlhttp.open("post" , "./registerTrainerProfileProcess.do");
	//xmlhttp.setRequestHeader("Content-type","multipart/form-data");
	var formData = new FormData();
	var inputFileBox = document.getElementById("trainerProfileImageFile");
	if(inputFileBox.value == ""){
		alert("이미지 파일이 선택되지 않았습니다.");

		return;
	}
	formData.append("trainerProfileImageFile", inputFileBox.files[0]);
	xmlhttp.send(formData);	
	hideTrainerProfileImageModal();
}

function registerModal(){
	doTrainerProfileImageModal = new bootstrap.Modal(document.getElementById('trainerProfileImageModal'));
}

function initTrainerMyPage(){
	getSessionUserInfo(function(){
		if(logined == true){
			refreshMyPageProfileImage();
			registerModal();
		}
	});
}

window.addEventListener("DOMContentLoaded" , initTrainerMyPage);
</script>
</head>
<body>
<div style="width: 1200px; margin: 0 auto">
	<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
	<jsp:include page="../common/global_sidebar_trainer.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row p-3 mb-2 text-white" style="background-color:#303840;">
			<div class="col"></div>
			<div class="col-8">
				<div class="row">
					<div class="col px-0"></div>
					<div id="trainerProfileImageBox" class="col p-0 border text-center" style="height:300px">
					
					</div>
					<div class="col px-0"></div>
				</div>
				<div class="row">
					<div class="col-9 px-0">
						<div class="float-end">
							
							<button id="trainerProfileImageButton" type="button" class="btn btn-secondary btn-sm" onclick="showTrainerProfileImageModal()" style="background-color: #284159;"><i class="bi bi-cloud-upload"></i>등록/수정</button>
							<!-- Modal -->
							<div class="modal fade" id="trainerProfileImageModal" tabindex="-1" aria-labelledby="trainerProfileImageModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header" style="color: black;">
							        <h5 class="modal-title" id="trainerProfileImageModalLabel">프로필 사진</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body" style="color: black;">
							      	<div class="mb-3">
							      		<form>
							            	<input id="trainerProfileImageFile" type="file" multiple accept="image/*" name="file">
							         	 </form>
							         </div>
							        
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" onclick="doTrainerProfileImage()">등록</button>
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					<div class="col px-0">
						<a href="./deleteTrainerProfileImageProcess.do">
							<button type="button" class="btn btn-secondary btn-sm" style="background-color: #284159;">
								<i class="bi bi-x-lg"></i>삭제
							</button>
						</a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
</div>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		

</body>
</html>