<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드랍게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
</head>
<style>
/* 폰트 */
* {
   font-family: 'Noto Sans KR', sans-serif;
}
a{
	text-decoration:none;
}
/* 페이지네이션 */
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: #F25C19;
  border-color: #F25C19;
}
</style>
<body>
	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fruid">
			<div class="row mt-2">
				<div class="col-2">
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col" style="background-color:#F2F2F2;">
					<div class="row mx-1  mt-2 mb-2">
                     <!-- 검색 -->
	                    <div class="col-10 px-0 d-grid">
	                    	<input class="form-control type=text" placeholder="검색어를 입력하세요">
	                    </div>
                    	<div class="col-2 d-grid">
                        	<input class="btn" type="submit" value="검색" style="background-color: #F25C19; color: #FFFFFF;">
                    	</div>
	                </div>
	                <div class="row mb-2">
						<div class="col mx-2">
							<a class="d-grid" href="./writeDropBoardPage.do"><button type="button" class="btn text-white" style="background-color: #F25C19;">등록하기</button></a>
						</div>
						<div class="col"></div>
					</div>
					<div class="row">
						<div class="col mx-2">
							 <c:forEach items="${droplist }" var="dropdata">
                           <!-- 이미지내용들 --> 
                           <div class="card text-center" style="width: 12rem; margin-right:25px; margin-bottom: 20px; float: left;">
                              <a class="card" style="color: #000000; text-decoration: none;"
                                 href="./readDropBoardPage.do?drop_no=${dropdata.boardDropVo.drop_no }">
                                 <img src="/upload/${dropdata.boardDropImageVo.image_link }" class="card-img-top border" style="height:250px;">
                                 <div class="card-body">
                                    <h5 class="card-title">${dropdata.boardDropVo.drop_title }</h5>
                                    <p class="card-text"></p>
                                 </div>
                                 <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                    	<div class="row">
                                    		<div class="col-1 mx-2"><i class="bi bi-currency-bitcoin"></i></div>
	                                     	<div class="col text-start">응모가</div>
	                                     	<div class="col text-start">${dropdata.boardDropVo.drop_price }</div>
	                                    </div>
                                     </li>
                                    <li class="list-group-item">
                                    	<div class="row">
                                    		<div class="col-1 mx-2"><i class="bi bi-minecart-loaded"></i></div>
	                                     	<div class="col text-start">수량</div>
	                                     	<div class="col text-start">${dropdata.boardDropVo.drop_amount }</div>
	                                     </div> 	
                                    </li>
                                    <!-- 날짜 포멧 변환 :kst 2021safasf => 2021/00/00로 뜸   -->
                                    <li class="list-group-item">
                                    	<div class="row">
                                    		<div class="col-1 mx-2"><i class="bi bi-calendar-check"></i></div>
	                                     	<div class="col text-start">시작</div>
	                                     	<div class="col text-start"><fmt:formatDate value="${dropdata.boardDropVo.drop_startdate }" pattern="MM/dd"/></div>
	                                    </div>
                                    </li>
                                    <li class="list-group-item">
                                    	<div class="row">
                                    		<div class="col-1 mx-2"><i class="bi bi-calendar-x"></i></div>
	                                     	<div class="col text-start">종료</div>
	                                     	<div class="col text-start"><fmt:formatDate value="${dropdata.boardDropVo.drop_enddate }" pattern="MM/dd"/></div>
	                                    </div>
                                    </li>
                                 </ul>    
                              </a>
                           </div>
                        </c:forEach>
						</div>
					</div>
				</div>		
				<div class="col-1">
				</div>
			</div>
			
			<!-- 페이징 -->
			<div class="row mt-2">
				<div class="col">
					<nav>
                        <ul class="pagination my mb-0 justify-content-center">
                           <li class="page-item"><a class="page-link" style="color: #000000;">Previous</a>
                           </li>
                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">1</a></li>
                           <li class="page-item active" aria-current="page"><a class="page-link" style="color: #000000;" href="#">2</a></li>
                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">3</a></li>
                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">4</a></li>
                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">5</a></li>
                           <li class="page-item"><a class="page-link" style="color: #000000;" href="#">Next</a>
                           </li>
                        </ul>
                     </nav>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<jsp:include page="../common/global_footer.jsp"></jsp:include>
		</div>
	</div>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>




