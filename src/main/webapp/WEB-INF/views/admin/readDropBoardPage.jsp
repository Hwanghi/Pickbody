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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
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
<div style="width:1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row mt-2" style="background-color:#F2F2F2;">
				<div class="col-2">
					<!-- 네비바 -->
					<jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
				</div>
				<div class="col mx-2 border-end">
					<div class="row">
						<div class="col">
							<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
		                    	<div class="carousel-inner text-center">
		                       		 <c:forEach items="${dropdata.boardDropImageVoList }" var="boardDropImageVo" varStatus="i">
		                              	<c:choose>
		                                 	<c:when test="${i.count == 1}">
		                                    	<div class="carousel-item active">
		                                       		<img src="/upload/${boardDropImageVo.image_link }" style="width: 300px; height: 300px;">
		                                   		</div>
		                                 	</c:when>
		                                 	<c:otherwise>
		                                    	<div class="carousel-item">
		                                       		<img src="/upload/${boardDropImageVo.image_link }" style="width: 300px; height: 300px;">
		                                    	</div>
		                                 	</c:otherwise>
		                              </c:choose>
		                           </c:forEach>
		                        </div>
		                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
		                        	<span class="carousel-control-prev-icon btn-dark" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		                        </button>
		                        <button class="carousel-control-next" type="button"	data-bs-target="#carouselExampleFade" data-bs-slide="next">
		                        	<span class="carousel-control-next-icon btn-dark" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		                        </button>
		                	</div>
						</div>
					</div>
					<div class="row">
						<div class="col text-center">
							<a href="./dropBoardPage.do" class="d-grid" style="text-decoration: none">
								<button type="button" class="btn text-white" style="background-color:#F25C19;">다른 드랍 상품 보기</button>
							</a>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<a class="d-grid"href="./updateDropBoardPage.do?drop_no=${dropdata.boardDropVo.drop_no }"><button type="button" class="btn btn-outline-warning">수정</button></a>
						</div>
						<div class="col">
							<a class="d-grid" href="./deleteDropBoardProcess.do?drop_no=${dropdata.boardDropVo.drop_no }"><button type="button" class="btn" style="background-color:#BEBEBE;">삭제</button></a>
						</div>
					</div>
				</div>
				<div class="col mx-3">
					<div class="row mb-2 py-1 border-bottom">
                        <!-- 상품이름 -->
                        <div class="col-1 pe-1"><i class="bi bi-list" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-0">제목</div>
                        <div class="col-1"></div>
                        <div class="col">${dropdata.boardDropVo.drop_title }</div>
                    </div>
					<div class="row mb-3 py-1 border-bottom">
                        <!-- 내용 -->
                        <div class="col-1 pe-1"><i class="bi bi-book"></i></div>
                        <div class="col-4 ps-0">내용</div>
                        <div class="col-1"></div>
                        <div class="col">${dropdata.boardDropVo.drop_content }</div>
                    </div>
                    <div class="row mb-1 py-1 border-bottom">
                    	<!-- 수량 -->
                    	<div class="col-1 pe-1"><i class="bi bi-cart4" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-0">수량
                        </div>
                        <div class="col-1"></div>
                        <div class="col">${dropdata.boardDropVo.drop_amount }</div>
                    </div>
                    <div class="row mb-1 py-1 border-bottom">
                    	<div class="col-1 pe-1"><i class="bi bi-currency-bitcoin" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-0">응모가</div>
                        <div class="col-1"></div>
                        <div class="col">${dropdata.boardDropVo.drop_price }</div>
                    </div>
                    <div class="row mb-1 py-1 ">
                    	<div class="col-1 pe-1"><i class="bi bi-calendar-check" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-0">응모시작</div>
                        <div class="col-1"></div>
                        <div class="col"><fmt:formatDate value="${dropdata.boardDropVo.drop_startdate }" pattern="yy년 MM년dd일"/></div>
                    </div>
                    <div class="row mb-3 border-bottom">
                    	<div class="col-1 pe-1"><i class="bi bi-calendar-x-fill" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-0">응모마감</div>
                        <div class="col-1"></div>
                        <div class="col"><fmt:formatDate value="${dropdata.boardDropVo.drop_enddate }" pattern="yy년 MM년dd일"/></div>
                    </div>
                    <div class="row mb-3 py-1 border-bottom">
                    	<div class="col-1 pe-1"><i class="bi bi-people"></i></div>
                        <div class="col-4 ps-0">응모자 수</div>
                        <div class="col-1"></div>
                        <div class="col">${totalApplicationCount }</div>
                    </div>
                    <div class="row mb-4 py-1 border-bottom">
                    	<div class="col-1 pe-0"><i class="bi bi-award-fill" style="color:#F2CB05;"></i></div>
                        <div class="col-4 ps-1">당첨자</div>
                        <div class="col-1"></div>
                        <div class="col" style="color:#F25C19;">
                        <c:forEach items="${winninglist }" var="winningdata">
                       			${winningdata.memberVo.member_nick }<br>
                        </c:forEach>
                        </div>
                    </div>
                    
                   <div class="row mb-3">
                   		<div class="col px-2 float-center">
                   			<img class="img-fluid" src="../resources/img/event_banner1.png" style="width:100%; height:150px;">
                   		</div>
                   </div>
                   <div class="row mb-1" style="background-color: #F2F2F2">
                   		<div class="col-1 pe-1"><i class="bi bi-person-lines-fill"></i></div>
                   		<div class="col-2 ps-0">응모자</div>
                   		<div class="col-1 pe-1"><i class="bi bi-bookmark"></i></div>
                   		<div class="col-4 ps-0">내용</div>
                   		<div class="col-1 pe-1"><i class="bi bi-calendar4-event"></i></div>
                   		<div class="col-3 ps-0">응모 날짜</div>
                  	</div>
                  	<c:forEach items="${applist }" var="applicationdata">
                  	<div class="row mb-2">
                  		<div class="col-1 pe-1"><i class="bi bi-bookmark-heart" style="color: red;"></i></div>
                  		<div class="col-2 ps-0">
                  			${applicationdata.memberVo.member_nick }
                  		</div>
                  		<div class="col-1 pe-1"></div>
                  		<div class="col-4 ps-0">
                  			${applicationdata.applicationVo.application_comment }
                  		</div>
                  		<div class="col-1 pe-1"></div>
                  		<div class="col-3 ps-0">
                  			<fmt:formatDate value="${applicationdata.applicationVo.application_applydate }" pattern="yy/MM/dd/HH:mm"/>
                  		</div>
                  	</div>
					</c:forEach>
				</div>
					
				<div class="col-2">
					<img class="img-fluid" src="../resources/img/event_banner7.jpg" style="height:100%;">
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