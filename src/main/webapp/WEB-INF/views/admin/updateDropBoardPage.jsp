<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link
rel="stylesheet"
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
</head>
<body>
	<div style="width : 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col"></div>
				<div class="col my-2 text-center" style="background-color:white;">
					<form action="./updateDropBoardProcess.do" method="post" enctype="multipart/form-data">
						
					<div class="row mt-3 mb-2">
						<div class="col-1 pe-0"><i class="bi bi-list" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">제목</div>
						<div class="col d-grid">
							<input type="text" name="drop_title" value="${dropdata.boardDropVo.drop_title }">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<textarea rows="10" cols="60" name="drop_content">${dropdata.boardDropVo.drop_content }</textarea>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-cart4" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">드랍 수량</div>
						<div class="col d-grid">
							 <input type="number" name="drop_amount" value="${dropdata.boardDropVo.drop_amount}">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-currency-bitcoin" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">응모 가격 </div>
						<div class="col d-grid">
							<input type="number" name="drop_price" value="${dropdata.boardDropVo.drop_price }">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-calendar-check" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">시작 날짜</div>
						<div class="col d-grid">
							 <fmt:formatDate value="${dropdata.boardDropVo.drop_startdate }" pattern="yy년 MM년dd일"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"></div>
						<div class="col-2 ps-0">변경 날짜</div>
						<div class="col d-grid">
							<input type="date" name="drop_startdate">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-calendar-x-fill" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">종료 날짜</div>
						<div class="col d-grid">
							 <fmt:formatDate value="${dropdata.boardDropVo.drop_enddate }" pattern="yy년 MM년dd일"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"></div>
						<div class="col-2 ps-0">변경 날짜</div>
						<div class="col d-grid">
							 <input type="date" name="drop_enddate">
						</div>
					</div>
					<input type="hidden" name="drop_no" value="${dropdata.boardDropVo.drop_no }">
					<div class="col-2">
					</div>
					<div class="row mt-3">
						<div class="col d-grid">
							<button class="btn text-white" type="submit" style="background-color:#F25C19;">수정</button>
						</div>
					</div>
					</form>
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	<div class="row">
			<div class="col">
				<jsp:include page="../common/global_footer.jsp"></jsp:include>
			</div>
		</div>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
crossorigin="anonymous">
</script>
</body>
</html>