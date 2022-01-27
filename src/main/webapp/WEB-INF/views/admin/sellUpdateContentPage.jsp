<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
</head>
<body>

	<div style="width: 1200px; margin: 0 auto">
		<div class="container">
			
					

			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2 px-0">
					<!-- 네비바 -->
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col-9">
					<div class="row">
						<form action="./sellUpdateProcess.do" method="post">
							<div class="col"></div>
							<div class="col-10">
	
								<!-- 상품이름 수정 -->
								<div class="row mt-5">
									<div class="col d-grid">
										<input type="text" name="sell_name" value="${selldata.sellVo.sell_name }" placeholder="상품을 수정하세요.">
									</div>
								</div>
		
								<!-- 작성자닉네임 -->
								<div class="row">
									<div class="col fs-3">
										<i class="bi bi-person-circle">${sessionAdmin.admin_nick }</i>
									</div>
								</div>
		
									
								<!-- 내용입력칸 -->
								<div class="form-floating">								
									<textarea class="form-control" name="sell_content" style="height: 300px">${selldata.sellVo.sell_content }</textarea>
									<label for="floatingTextarea2">내용을 입력하세요.</label>
									<input type="hidden" name="sell_no" value="${selldata.sellVo.sell_no }">
									<!-- <input type="submit" value="작성완료"> -->
								</div>
								<input type="number" name="sell_price" value="${selldata.sellVo.sell_price }">
									
								<!-- 파일 업로드 선택칸 -->
								<div class="row">
									<div class="col">
										<div class="mb-3">
											<label for="formFile" class="form-label">수정 할 사진 1장 이상을 등록해주세요.</label>
											<input class="form-control" type="file" multiple accept="image/*" name="files">
											<!-- 멀티플다중선택 어셉트하면 
											  디폴트설정 그것만보이게  서버에 서버xml에서 컨택스트설정 호스트조심 서블릿컨택스트에서도 파일 업로드 빈추가확인-->
										</div>
									</div>
									
									<!-- 등록하기 -->
									<div class="row padding-0">
										<div class= "row"></div>
										<div class="col text-end ">
											<input class="btn btn-primary" type="submit" value="수정">
										</div>
									</div>
	
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-1"></div>
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