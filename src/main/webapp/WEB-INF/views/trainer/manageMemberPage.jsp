<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Member Manage Page</title>
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
<script src="../resources/js/sidebar_trainer.js?version=2.2.0"></script>
<!-- 그래프 관련 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  var memberNo = -1;
  var createWeekScheduleModal = null;
//선택한 노드 다음에 새로운 노드 추가
  function insertAfter(referenceNode, newNode) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
  }
	
  google.charts.load('current', {'packages':['corechart']});

  function drawChart1(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date', 'weight']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);
		  var year = (date.getFullYear()+"").slice(-2);
		  var timeString = year + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_weight]);
	  }


    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '몸무게',
      curveType: 'function',
      legend: {position: 'none'}
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_weight'+ memberNo));

    chart.draw(data, options);
  }
  
  function drawChart2(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date', 'skeletalmusclemass']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);
		  var year = (date.getFullYear()+"").slice(-2);
		  var timeString = year + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_skeletalmusclemass]);
	  }

    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '골격근량',
      curveType: 'function',
      legend: {position: 'none'}
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_skeletalmusclemass' + memberNo));

    chart.draw(data, options);
  }
  
  function drawChart3(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date','bodyfatmass']);
	  
	  for(x of datas.inbodyDataList){
		  
		  var date = new Date(x.memberInbodyVo.inbody_measureddate);

		  var year = (date.getFullYear()+"").slice(-2);
		  var timeString =  year + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.memberInbodyVo.inbody_bodyfatmass]);
	  }

    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '체지방량',
      curveType: 'function',
      legend: {position: 'none'}
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_bodyfatmass'+ memberNo));

    chart.draw(data, options);
  }

function refreshInbodyList(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			drawChart1(data);
			drawChart2(data);
			drawChart3(data);
		}
	};
	
	xmlhttp.open("get" , "../member/getInbodyList.do?member_no=" + memberNo); 
	xmlhttp.send();	
}

function drawInbodyGraph(no){
	memberNo = no;
	refreshInbodyList();
	var carousel = document.getElementById("carouselExampleIndicators" + memberNo);
	carousel.classList.remove("visually-hidden");
}

function addTrainerAdviceProcess(e, programNo, week) {
	// 강사 주간 스케줄 텍스트박스에서 강사조언을 가져온다 
	var scheduleAdviceBox = e.closest(".scheduleAdviceBox");
	var scheduleAdvice = scheduleAdviceBox.getElementsByClassName("schedule_advice")[0];
	var params = "program_no=" +programNo+ "&week="+week+ "&schedule_advice=" + scheduleAdvice.value;
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function () {
	    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	      var data = JSON.parse(xmlhttp.responseText);
	      showWeekSchedule(e, data.program_no, data.how_weeks);
	      scheduleAdviceBox.innerHTML = "";
	    }
	}
	
	xmlhttp.open("post", "../trainer/addTrainerAdviceProcess.do");
	xmlhttp.setRequestHeader(
	    "Content-type",
	    "application/x-www-form-urlencoded"
	);
	xmlhttp.send(params);
}

function showWeekSchedule(e, programNo, howWeeks){
	var xmlhttp = new XMLHttpRequest();
		
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			var data = JSON.parse(xmlhttp.responseText);
			var manageScheduleBox = e.closest(".manageScheduleBox");
			var totalScheduleBox = manageScheduleBox.getElementsByClassName("totalScheduleBox")[0];
			totalScheduleBox.setAttribute("style", "border:1px solid black");
			totalScheduleBox.innerHTML = "";
			for(i=1; i<howWeeks+1; i++) {
				var weekBox = document.createElement("div");
				weekBox.setAttribute("class", "col-1 p-0 text-center d-flex flex-column justify-content-center border-right");
				var weekTitle = document.createElement("div");
				weekTitle.setAttribute("class", "border-bottom");
				weekTitle.innerText = i+"주";
				weekBox.appendChild(weekTitle);
				if(i<data.thisweek) {
					var weekText = document.createElement("div");
					weekText.innerText = "종료";
					weekBox.appendChild(weekText);
				} else if (i==data.thisweek) {
					var weekLink = document.createElement("a");
					weekLink.setAttribute("class", "font-orange");
					if(data.scheduleWeekVo != null){
						weekLink.setAttribute("href", "../trainer/scheduleDailyPage.do?schedule_week_no="+data.scheduleWeekVo.schedule_week_no);
						weekLink.innerText = "작성";
					} else {
						var memberName = manageScheduleBox.getElementsByClassName("memberName")[0];
						weekLink.setAttribute("onclick", "createScheduleWeekBox(this,"+data.thisweek+",'"+memberName.value+"')");
						weekLink.innerText = "신규";
					}
					weekBox.appendChild(weekLink);
				} else {
					var weekText = document.createElement("div");
					weekText.innerText = "...";
					weekBox.appendChild(weekText);
				}
					
				totalScheduleBox.appendChild(weekBox);
			}
			
			
		}
	};
	
	xmlhttp.open("get" , "../trainer/showTotalScheduleProcess.do?program_no=" + programNo); 
	xmlhttp.send();
}

function createScheduleWeekBox(e,thisweek, memberName){
	var manageScheduleBox = e.closest(".manageScheduleBox");
	var totalScheduleBoxInfo = manageScheduleBox.getElementsByClassName("totalScheduleBoxInfo")[0];
	var programNo = totalScheduleBoxInfo.getElementsByClassName("programNo")[0];
	var scheduleAdviceRow = document.createElement("div");
	scheduleAdviceRow.setAttribute("class", "row scheduleAdviceBox m-3");
	var scheduleAdviceBox = document.createElement("div");
	scheduleAdviceBox.setAttribute("class", "col d-flex flex-column d-grid");
	
	var scheduleAdviceTitle = document.createElement("h3");
	scheduleAdviceTitle.innerText = memberName +" 회원님 " +thisweek+"주차 강사 조언";
	var scheduleAdviceContent = document.createElement("textArea");
	scheduleAdviceContent.setAttribute("class", "schedule_advice");
	
	var scheduleAdviceButton = document.createElement("button");
	scheduleAdviceButton.setAttribute("class", "btn background-orange text-white")
	scheduleAdviceButton.setAttribute("onclick", "addTrainerAdviceProcess(this,"+programNo.value+","+thisweek+")");
	scheduleAdviceButton.innerText = "작성완료";
	
	scheduleAdviceRow.appendChild(scheduleAdviceTitle);
	scheduleAdviceRow.appendChild(scheduleAdviceContent);
	scheduleAdviceRow.appendChild(scheduleAdviceButton);
	manageScheduleBox.appendChild(scheduleAdviceRow);
}

google.charts.setOnLoadCallback(
	function () { console.log("구글 차트 로딩 완료"); }
);
</script>

</head>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_trainer.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10 background-gray">
				<c:forEach items="${dataList }" var="data">
					<div class="row mb-3 border-bottom">
						<div class="col-4 p-3">
							<div class="row">
							<div class="col">
								<img class="img-thumbnail" alt="" src="/upload/member/profile/${data.memberProfileImageVo.image_link }">
							</div>
							</div>
							<div class="row">
								<div class="col text-center"><h3>${data.memberVo.member_name } 회원님</h3></div>
							</div>
						</div>
						<div class="col p-3 manageScheduleBox">
							<div class="row"><div class="col-4">회원목표</div><div class="col">${data.memberGoal.goal_category_name }</div></div>
							<div class="row"><div class="col-4">시작날짜</div><div class="col"><fmt:formatDate value="${data.programVo.start_date }" pattern="yy년 MM월 dd일" /></div></div>
							<div class="row"><div class="col-4">구독기간</div><div class="col">${data.programVo.how_weeks }주</div></div>
							<div class="row mt-3"><div class="col mb-3 d-grid"><button type="button" class="btn btn-outline-warning" onclick="drawInbodyGraph(${data.memberVo.member_no})">회원 인바디그래프 보기</button></div></div>
							<div class="row my-0">
								<div class="col">
								  <div id="carouselExampleIndicators${data.memberVo.member_no}" class="carousel carousel-dark slide visually-hidden" data-bs-ride="carousel">
								  <div class="carousel-indicators text-black" style="transform: translateY(15px);">
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
								    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
								  </div>
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <div id="curve_chart_weight${data.memberVo.member_no}" style="width: 400px; margin: 0 auto !important;" align='center'></div>
								    </div>
								    <div class="carousel-item">
								      <div id="curve_chart_skeletalmusclemass${data.memberVo.member_no}" style="width: 400px; margin: 0 auto !important;" align='center'></div>
								    </div>
								    <div class="carousel-item">
								      <div id="curve_chart_bodyfatmass${data.memberVo.member_no}" style="width: 400px; margin: 0 auto !important;" align='center'></div>
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators${data.memberVo.member_no}" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${data.memberVo.member_no}" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
								</div>
							</div>
							<div class="row my-3 totalScheduleBoxInfo">
								<div class="col d-grid">
									<input type="hidden" class="memberName" value="${data.memberVo.member_name }">
									<input type="hidden" class="programNo" value="${data.programVo.program_no }">
									<button type="button" class="btn btn-outline-danger" onclick="showWeekSchedule(this, ${data.programVo.program_no}, ${data.programVo.how_weeks })">주간 스케줄 작성하기</button>
								</div>
							</div>
							<div class="row totalScheduleBox mx-1">
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<jsp:include page="../common/global_footer.jsp"></jsp:include>
	</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</body>
</html>