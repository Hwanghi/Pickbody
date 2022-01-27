<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>
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
</head>
<body>

	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			<div class="row">
            <div class="col-1"></div>
            <div class="col">
               <!-- BEST 조회수 높은순 -->
               <div class="row my-3" style="font-size: 12px" >
                  <!-- 테이블내용 -->
                  <div class="col">
                     <c:forEach items="${bestList }" var="best">
                     
                        <!-- 이미지내용들 -->
                        <div class="card" style="margin-left: 15px; margin-bottom: 15px; float: left;">
                           <a class="card" style="color: #000000; text-decoration: none; text-align: center;" href="./BodygoodreadContentPage.do?bodygood_no=${best.bodygoodVo.bodygood_no }">
                              <img src="/upload/${best.bodygoodImageVo.image_link }" style="width: 180px; height: 150px;" class="card-img-top">
                              <div class="card-body">
                              <div class="row">
                                 <div class="col">
                                 ${best.bodygoodVo.bodygood_title }[${best.getbodygoodtotalComment}]
                                 </div>
                                 </div>
                              <div class="row">
                              <div class="col-1"><i class="bi bi-suit-heart-fill text-danger"></i></div>
                              <div class="col-2">
                              ${best.getbodygoodtotalLikeCount }
                              </div>
                              <div class="col"></div>
                              <div class="col-1"><i class="text-danger ptn bi bi-eye-fill"></i></div>
                              <div class="col">
                              ${best.bodygoodVo.bodygood_view }
                              </div>
                              </div>
                              
                              </div>
                              </a>
                              </div>
                              
                           
                           </c:forEach>
                           </div>
                        </div>
                     
                     
                  



               <div class="row mt-3 mb-5">
                  <!-- 검색 -->
                  <div class="col">
                     <input class="form-control type=" text" placeholder="검색어를 입력하세요">
                  </div>
                  <div class="col-2 d-grid">
                     <input class="btn" type="submit" value="검색"
                        style="background-color: #F25C19; color: #FFFFFF;">
                  </div>
               </div>


               <div class="row mt-2">
                  <!-- 테이블내용 -->

                  <div class="col">
                     <c:forEach items="${list }" var="data">
                     
                        <!-- 이미지내용들 -->
                        <div class="card" style="margin-left: 15px; margin-bottom: 15px; float: left;">
                           <a class="card" style="color: #000000;  text-decoration: none;"
                              href="./BodygoodreadContentPage.do?bodygood_no=${data.bodygoodVo.bodygood_no }">${data.bodygoodVo.bodygood_title }
                              <img src="/upload/${data.bodygoodImageVo.image_link }" style="width: 175px; height: 200px;"
                              class="card-img-top">
                              <div class="card-body">
                              <h5 class="card-title">
                                 <div class="row">
                                 <div class="col-1"><i class="bi bi-person-circle"></i></div>
                                 <div class="col">${data.memberVo.member_nick }<c:if test="${!empty data.writedate}">
                                 <img src="../resources/img/new.png">
                                 </c:if></div>
                                 
                                 </div>
                                 </h5>
                                 <p class="card-text"></p>
                              </div>
                              <ul class="list-group list-group-flush">
                                 <li class="list-group-item">
                                    <!-- 날짜 포멧 변환 :kst 2021safasf => 2021/00/00로 뜸   --> <fmt:formatDate
                                       pattern="yyyy/MM/dd"
                                       value="${data.bodygoodVo.bodygood_date }" />
                                 </li>
                              </ul>
                              <div class="card-body px-1">
                                 <div class="row">
                                    <div class="col-1">
                                       <i class="bi bi-suit-heart-fill text-danger"></i>
                                       </div>
                                       <div class="col">
                                       ${data.getbodygoodtotalLikeCount }
                                       </div>
                                    
                                    <div class="col-1">
                                       <i class="bi bi-chat-dots"></i>
                                       </div>
                                       <div class="col">
                                       ${data.getbodygoodtotalComment}
                                       </div>
                                    
                                    <div class="col-1">
                                       <i class="bi bi-eye-fill text-danger"></i>
                                       </div>
                                    <div class="col">
                                       ${data.bodygoodVo.bodygood_view }
                                    </div>
                                 </div>

                              </div>
                           </a>
                        </div>

                     </c:forEach>
                  </div>
               </div>
               
               <div class="row mt-2 ">
                  <!-- 버튼들 -->
                  <div class="col-2"></div>
                  <div class="col">
                     <!-- 페이지넘기는거 -->
                     <nav>
                        <ul class="pagination my mb-0 justify-content-center">
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;">Previous</a></li>
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;" href="#">1</a></li>
                           <li class="page-item active" aria-current="page"><a
                              class="page-link" style="color: #000000;" href="#">2</a></li>
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;" href="#">3</a></li>
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;" href="#">4</a></li>
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;" href="#">5</a></li>
                           <li class="page-item"><a class="page-link"
                              style="color: #000000;" href="#">Next</a></li>
                        </ul>
                     </nav>
                  </div>
                  <div class="col-2 text-end mt-0">
                     <c:if test="${!empty memberUser }">
                        <a class="btn"
                           style="background-color: #F25C19; color: #FFFFFF;"
                           href="./BodygoodWriteContentPage.do">글쓰기</a>
                     </c:if>
                  </div>

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