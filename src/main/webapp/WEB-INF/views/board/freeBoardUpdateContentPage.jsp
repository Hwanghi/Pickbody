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
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>

</head>
<style>

/* 폰트 */
* {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 페이지네이션 */
.my.pagination>.active>a, .my.pagination>.active>span, .my.pagination>.active>a:hover,
	.my.pagination>.active>span:hover, .my.pagination>.active>a:focus, .my.pagination>.active>span:focus
	{
	background: #F25C19;
	border-color: #F25C19;
}
</style>
<body>
<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
				<div class="col-1"></div>
				<div class="col-9 mt-3 mx-2">

				<form action="./freeBoardUpdateContentProcess.do" method="post" enctype="multipart/form-data">
					<div class="row">
					<div class="col-3"></div>
					<div class="col">
					<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">제목</span>
					<input type="text" name="free_title" class="form-control" value="${data.FreeBoardVo.free_title }" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					 
					 <div class="form-floating d-grid my-3" >
					  <textarea class="form-control" name="free_content" placeholder="내용을 작성해주세요." id="floatingTextarea" style="height: 500px">${data.FreeBoardVo.free_content }</textarea>
					  <label for="floatingTextarea"></label>
					</div>  
                                        
                    <div class="input-group mb-3">
					  <input type="file" multiple accept="image/*" name="files" class="form-control" id="inputGroupFile02">
					</div>                    
					
					<div class="row">
									<div class="col d-grid">
										<input class="btn text-center" type="submit" value="수정 " style="background: #F25C19; color: #FFFFFF;">
									    
									</div>
								</div>
					</div>
					</div>
					<input type="hidden" name="free_no" value="${data.FreeBoardVo.free_no }">
					
				</form>
			</div>
			<div class="col"></div>
	</div>

</div>
<jsp:include page="../common/global_footer.jsp"></jsp:include>


	
	




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>