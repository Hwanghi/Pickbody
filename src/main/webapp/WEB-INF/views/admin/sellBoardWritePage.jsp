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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
</head>
<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col-9 mx-2">

					<div class="row bolder">
						<div class="col fs-1 fw-bold text-center">
							<a class="text-dark" href="../admin/sellPage.do" style="text-decoration: none;">상품 등록</a>
						</div>
					</div>


				<form action="./writeSellBoardProcess.do" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="col">
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">상품명</span>
							<input type="text" name="sell_name" class="form-control" placeholder="상품명을 적어주세요." aria-label="Username" aria-describedby="basic-addon1">
							</div>
						 
							 <div class="form-floating d-grid my-3">
							  	<textarea class="form-control" name="sell_content" placeholder="내용을 작성해주세요." id="floatingTextarea" style="height: 500px"></textarea>
							  	<label for="floatingTextarea"></label>
							</div>  
	                                        
		                    <div class="input-group mb-3">
							  	<input type="file" multiple accept="image/*" name="files" class="form-control" id="inputGroupFile02">
							  	<label class="input-group-text" for="inputGroupFile02">Upload</label>
							</div>                    
						
							<div class="input-group mb-3">
								<span class="input-group-text" id="basic-addon1">가격</span>
								<input type="text" name="sell_price" class="form-control" placeholder="가격을 적어주세요." aria-label="Username" aria-describedby="basic-addon1">
							</div>
						
							<div class="input-group my-3">
								<span class="input-group-text" id="basic-addon1">수량</span>
								<input type="text" name="sell_Quantity" class="form-control" placeholder="가격을 적어주세요." aria-label="Username" aria-describedby="basic-addon1">
							</div>
						
							<div class="row">
								<div class="col text-end ">
									<input class="btn text-center" type="submit" value="등록하기 " style="background: #F25C19; color: #FFFFFF;">
								</div>
							</div>
						</div>
					</div>
				</form>
				</div>
				<div class="col"></div>
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