<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div style="width:1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row"><!-- 네비 바..row -->
				<div class="col">
					<jsp:include page="../common/global_nav_trainer.jsp"></jsp:include>
				</div>			
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col-4">
					<h3>${week } 주차 스케줄 생성</h3>
					<form action="./scheduleWeekProcess.do" method="post">
						<input type="hidden" name="program_no" value="${program_no}">
						<input type="hidden" name="week" value="${week }">
						<label for="schedule_advice">강사 조언:</label><textarea rows="10" cols="60" id="schedule_advice" name="schedule_advice" type="text"></textarea><br>
						<input type="submit" value="주간 스케줄 생성">
					</form>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>