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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}


</style>
<!-- 그래프 관련 -->
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
	

  function drawChart1(datas) {
	  
	  var ttt = [];
	  ttt.push(['Date', 'JoinMemberCount']);
	  
	  for(x of datas.joinMemberCountList){
		  
		  var date = new Date(x.date);

		  var timeString = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.joinMemberCount]);
	  }


    var data = google.visualization.arrayToDataTable(ttt);

    var options = {
      title: '최근 일주일 회원가입자 수 추이',
      curveType: 'function',
      legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart_joinMemberCount'));

    chart.draw(data, options);
  }
  
  
</script>

<script>
google.charts.load('current', {packages: ['corechart', 'bar']});
function drawChart2(datas) {

	var ttt = [];
	  ttt.push(['Date', 'PointSum']);
	  
	  for(x of datas.pointSumList){
		  
		  var date = new Date(x.date);

		  var timeString = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();
		  
		  ttt.push([timeString , x.pointSum]);
	  }
	  var data = google.visualization.arrayToDataTable(ttt);
	  
    var options = {
      title: '최근 일주일 일별 소모 포인트',
      hAxis: {
        title: '날짜',
  
      },
      vAxis: {
        title: '포인트'
      }
    };

    var chart = new google.visualization.ColumnChart(
      document.getElementById('curve_chart_pointSum'));

    chart.draw(data, options);
  }


</script>
	
<script>

var logined = false;
var adminNo = null;

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



function refreshJoinMemberCountList(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			
			var data = JSON.parse(xmlhttp.responseText);
			
			drawChart1(data);
			
			var joinMemberCountAWeekBox = document.getElementById("joinMemberCountAWeekBox");
			joinMemberCountAWeekBox.innerHTML="";
			
			for(joinMemberCountData of data.joinMemberCountList){
				
				var outerCol = document.createElement("div");
				outerCol.setAttribute("class" , "col border");

				
				var firstInnerRaw = document.createElement("div");
				firstInnerRaw.setAttribute("class" , "raw border-bottom");
				outerCol.appendChild(firstInnerRaw);
				
				var dateBox = document.createElement("div");
				dateBox.setAttribute("class" , "col");
					var x = new Date(joinMemberCountData.date);
	    			var dateString = x.getFullYear() + "/" + (x.getMonth() + 1) + "/" + x.getDate();
	    		dateBox.innerText = dateString;
	    		firstInnerRaw.appendChild(dateBox);
	    		
	    		var secondInnerRaw = document.createElement("div");
	    		secondInnerRaw.setAttribute("class" , "raw");
				outerCol.appendChild(secondInnerRaw);
	    		
	    		var joinMemberCountBox = document.createElement("div");
	    		joinMemberCountBox.setAttribute("class" , "col");
	    		joinMemberCountBox.setAttribute("style" , "font-family: 'Noto Sans KR', sans-serif; font-weight: 700;");
	    		joinMemberCountBox.innerText = joinMemberCountData.joinMemberCount + "명";
	    		secondInnerRaw.appendChild(joinMemberCountBox);
				
				
				joinMemberCountAWeekBox.appendChild(outerCol);
			}
		}
	};
	
	xmlhttp.open("post" , "./getJoinMemberCountList.do"); 
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();
}

function refreshPointSumList(){
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			
			var data = JSON.parse(xmlhttp.responseText);
			
			drawChart2(data);
			
			var pointSumAWeekBox = document.getElementById("pointSumAWeekBox");
			pointSumAWeekBox.innerHTML="";
			
			for(pointSumData of data.pointSumList){
				
				var outerCol = document.createElement("div");
				outerCol.setAttribute("class" , "col border");

				
				var firstInnerRaw = document.createElement("div");
				firstInnerRaw.setAttribute("class" , "raw border-bottom");
				outerCol.appendChild(firstInnerRaw);
				
				var dateBox = document.createElement("div");
				dateBox.setAttribute("class" , "col");
					var x = new Date(pointSumData.date);
	    			var dateString = x.getFullYear() + "/" + (x.getMonth() + 1) + "/" + x.getDate();
	    		dateBox.innerText = dateString;
	    		firstInnerRaw.appendChild(dateBox);
	    		
	    		var secondInnerRaw = document.createElement("div");
	    		secondInnerRaw.setAttribute("class" , "raw");
				outerCol.appendChild(secondInnerRaw);
	    		
	    		var pointSumBox = document.createElement("div");
	    		pointSumBox.setAttribute("class" , "col");
	    		pointSumBox.setAttribute("style" , "font-family: 'Noto Sans KR', sans-serif; font-weight: 700;");
	    		pointSumBox.innerText = pointSumData.pointSum + "포인트";
	    		secondInnerRaw.appendChild(pointSumBox);
				
				
	    		pointSumAWeekBox.appendChild(outerCol);
			}
		}
	};
	
	xmlhttp.open("post" , "./getPointSumList.do"); 
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send();
}

function init(){
	getSessionAdminInfo();
	//refreshJoinMemberCountList();
	//refreshPointSumList();
	google.charts.setOnLoadCallback(tttt);
	//setInterval(refreshMemberList , 10000);
	
}

function tttt(){
	refreshJoinMemberCountList();
	refreshPointSumList();
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
				<div class="col-9 my-2">
					<div class="row mx-1 text-center border-top" style="background-color: white;">
						<div class="col">
							<div  id="curve_chart_joinMemberCount" style="width: 800px; height: 300px"></div>
						</div>
					</div>
					<div id="joinMemberCountAWeekBox" class="row my-1 mx-1 px-2 text-center border-bottom" style="background-color: white;">
						
					</div>
					<div class="row mt-4 mx-1 text-center border-top" style="background-color: white;">
						<div class="col">
							<div  id="curve_chart_pointSum" style="width: 800px; height: 300px"></div>
						</div>
					</div>
					<div id="pointSumAWeekBox" class="row my-1 mx-1 text-center border-bottom" style="background-color: white;">
						
					</div>
					<div class="row mt-4 mx-1 text-center border-top" style="background-color: white;">
						<div class="col">
							<h1><i class="bi bi-award-fill" style="color: #F2B705;"></i> PT 매칭 TOP3</h1>
						</div>
					<div class="row  my-2 mx-1 px-0 text-center" >
						<c:forEach items="${trainerDataList }" var="data">
							<div class="col  border" style="background-color: white;">
                        <div class="row mt-1 border-bottom">
                           <div class="col-6">번호</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_no }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-fingerprint"></i>ID</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_id }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-person-fill"></i>이름</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_name }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-telephone"></i>전화</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_phone }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-envelope"></i>매일</div>
                           <div class="col-6 overflow-hidden" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_email }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-currency-dollar"></i>가격</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerVo.trainer_price }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-file-earmark-text"></i>자격증</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerCertificationVo.trainer_certification_name }</div>
                        </div>
                        <div class="row mt-1 border-bottom">
                           <div class="col-6"><i class="bi bi-bookmark-heart"></i>수상</div>
                           <div class="col-6" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">${data.trainerPrizeVo.trainer_prize_name }</div>
                        </div>
                     </div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col px-0">
				<jsp:include page="../common/global_footer.jsp"></jsp:include>
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