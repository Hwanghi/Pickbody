<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div style="width : 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col"></div>
				<div class="col my-2 text-center" style="background-color: white;">
					<form action="./writeDropBoardProcess.do" method="post" enctype="multipart/form-data">
						
					<div class="row mt-3 mb-2">
						<div class="col">
							<input type="text" name="drop_title" style="width:470px;" placeholder="제목을 입력해주세요." required>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<textarea rows="10" cols="60" name="drop_content" placeholder="내용을 입력해주세요." required></textarea>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="number" name="drop_amount" style="width:470px;" placeholder="상품 수량을 입력해주세요." required>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="number" name="drop_price" style="width:470px;" placeholder="응모 가격을 입력해주세요." required>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-calendar-check" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">시작 날짜</div>
						<div class="col d-grid">
							<input type="date" name="drop_startdate" required>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-calendar-x-fill" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">종료 날짜</div>
						<div class="col d-grid">
							<input type="date" name="drop_enddate" required>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-1 pe-0"><i class="bi bi-image" style="color:#F2CB05;"></i></div>
						<div class="col-2 ps-0">이미지</div>
						<div class="col d-grid">
							<input type="file" multiple = "multiple" accept="image/*" name="files" required>
						</div>
					</div>
					<div class="col-2">
					</div>
					<div class="row">
						<div class="col d-grid">
							<input type="submit" class="btn text-white" value="등록" style="background-color:#F25C19;">						
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