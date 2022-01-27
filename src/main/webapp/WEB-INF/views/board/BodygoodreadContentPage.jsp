<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<style>
a{
	text-decoration: none;


}
</style>
<body>

	<div style="width: 1200px; margin: 0 auto;">
		<div class="container">
			<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
			<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>

	<div class="row mt-5">
		<div class="col-2"></div>
		<div class="col">
			<!-- 테두리 -->
			<div class="row border border-dark mb-2">
				<div class="col">


					<!-- 제목 -->
					<div class="row">
						<div class="col fs-3">${data.bodygoodVo.bodygood_title }</div>
						<span class="border-bottom"></span>
					</div>

					<!-- 작성자, 조회수, 등록날짜-->
					<div class="row">
						<div class="col">
							<!-- 작성자 -->
							<i class="bi bi-person-circle">${data.memberVo.member_nick }</i>
						</div>
						
						 <!-- 조회수, 등록날짜 -->
						<div class="col-1 text-end">
	                     	<i class="text-danger ptn bi bi-eye-fill"></i>
	                    </div>
	                     <div class="col-1">
	                     	${data.bodygoodVo.bodygood_view }
	                  	</div>
							
						
						<div class="col-2 text-end">
							<fmt:formatDate pattern="yyyy/MM/dd"
								value="${data.bodygoodVo.bodygood_date }" />
						</div>
					</div>

					<!-- 이미지 -->
					<div class="row">
						<div class="col">
							<c:forEach items="${data.imageVoList }" var="imageVo">
								<img src="/upload/${imageVo.image_link }" style="width:400px; margin: 0">
							</c:forEach>
						</div>
					</div>


					<!-- 내용 -->
					<div class="row">
						<div class="col">${data.bodygoodVo.bodygood_content }</div>
					</div>
				</div>
			</div>

					<!-- 좋아요 -->
            <div class="row">
               	<div class="col">
	               <c:if test="${!empty memberUser }">   
	                  <c:choose>
	                     <c:when test="${myLikeCount > 0 }">
	                        <a href="./doLike.do?bodygood_no=${data.bodygoodVo.bodygood_no }" style="color: black"><i class="bi bi-suit-heart-fill text-danger"></i>${totalLikeCount }</a>
	                     </c:when>
	                     <c:otherwise>
	                        <a href="./doLike.do?bodygood_no=${data.bodygoodVo.bodygood_no }" style="color: black"><i class="bi bi-suit-heart-fill text-danger"></i>${totalLikeCount }</a>
	                     </c:otherwise>
	                  </c:choose>
	               </c:if>
               	</div>
            </div>
			<div class="row mt-3">
				<div class="col fs-3">
					<!-- 댓글  출력 부분 -->
					댓글
				</div>
			</div>
			
			<c:forEach items="${commentList}" var="commentdata">
			<div class="row">
				<!-- 닉네임 -->
				<div class="col fw-bold">
					<i class="bi bi-person-circle">${commentdata.memberVo.member_nick }</i>
				</div>
				<div class="col text-end">
					<fmt:formatDate pattern="yyyy/MM/dd"
							value="${commentdata.bodygoodCommentVo.comment_date }"/>
					</div>
			</div>
				
				<div class="row">
					<div class="col">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col">
					${commentdata.bodygoodCommentVo.comment_content }
					</div>	
				</div>
			</c:forEach>
			

			<!-- 댓글  입력  부분 -->
			<div class="row mt-3">
				<div class="col fs-5">
					댓글을 입력해보세요.
				</div>
			</div>
			<form action="./BodygoodWriteCommentProcess.do" method="post">
				<div class="row">
					<div class="col d-grid">
					<input type="hidden" name="bodygood_no" value="${data.bodygoodVo.bodygood_no }">${session.member_nick }
					<textarea rows="2" cols="80" name="comment_content"></textarea>
					</div>
					<div class="col-2 d-grid">
							<input class="btn btn-primary" type="submit" value="댓글등록">
					</div>	
				
				</div>			
			</form>
			


			<!-- 목록 삭제 수정 -->
			<div class="row text-end mt-3">
				<div class="col">
				<a class="btn btn-outline-warning" href="./Bodygood.do" role="button">목록</a>
					<c:if test="${!empty memberUser && memberUser.member_no == data.bodygoodVo.member_no}">
						<a class="btn text-white" href="./updateBodygoodContentPage.do?bodygood_no=${data.bodygoodVo.bodygood_no }" role="button" style="background-color: #F25C19">수정</a>
						<a class="btn" href="./deleteBodygoodContentProcess.do?bodygood_no=${data.bodygoodVo.bodygood_no }" role="button" style="background-color: #BEBEBE;">삭제</a>
					</c:if>
				</div>
			</div>


		</div>
		<!-- 가운데 -->
		<div class="col-2"></div>
	</div>
	<!-- 전체로우 -->
	</div>
</div>
<jsp:include page="../common/global_footer.jsp"></jsp:include>








	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>