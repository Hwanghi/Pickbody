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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>

<script>
function needLogin(){
	
	alert('로그인이 필요합니다.');
}
</script>
</head>
<body>						
<div style="width:1200px; margin:0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			
			<div class="col mx-1 mt-3">
				<div class="row" style="background-color:#F2F2F2;">
					<div class="col-1 pe-0"><i class="bi bi-person-circle"></i></div>
					<div class="col-2 ps-1">${data.MemberVo.member_nick }</div>
					<div class="col text-center"><fmt:formatDate pattern = "yyyy/MM/dd" value="${data.FreeBoardVo.free_date}"/></div>
					<div class="col-1 pe-0"><i class="bi bi-eye-fill"></i></div>
					<div class="col-1 ps-1">${data.FreeBoardVo.free_view }</div>
					<div class="col-1 pe-0"><i class="bi bi-hand-thumbs-up-fill"></i></div>
					<div class="col-1 ps-1 pe-0">${totalFreeLikeCount}</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<div class="row mb-3">
							<div class="col">
								<h1>${data.FreeBoardVo.free_title }</h1>
							</div>
						</div>
						<div class="row  mb-3">
							<div class="col mx-3">
								<c:forEach items="${data.imageVoList}" var="imageVo" >
									<img src="/upload/${imageVo.image_link}" style="width:100%;">
								</c:forEach>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col mx-3">
								${data.FreeBoardVo.free_content }
							</div>
						</div>
						<div class="row my-3">
							<div class="col-4"></div>
							<div class="col text-center  d-grid fs-2">
								<c:if test="${!empty memberUser }">
									<c:choose>
										<c:when test="${myFreeLikeCount>0 }">
											<a class="d-grid" href="./freeLike.do?free_no=${data.FreeBoardVo.free_no }"><button type="button" class="btn btn-outline-secondary"><i class="bi bi-hand-thumbs-down-fill"></i></button></a>
										</c:when>
										<c:otherwise>
									    	<a class="d-grid" href="./freeLike.do?free_no=${data.FreeBoardVo.free_no }"><button type="button" class="btn btn-outline-danger	"><i class="bi bi-hand-thumbs-up-fill"></i></button></a>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${empty memberUser }">
									<button type="button" class="btn btn-outline-secondary"><i class="bi bi-hand-thumbs-up-fill" onclick="needLogin()"></i></button>
								</c:if>
							</div>
							<div class="col-1"></div>
							<c:if test="${!empty memberUser && memberUser.member_no == data.FreeBoardVo.member_no}">
							<div class="col-1 ps-0"><a class="d-grid" href="./freeBoardUpdateContentPage.do?free_no=${data.FreeBoardVo.free_no  }"><button type="button" class="btn btn-outline-primary">수정</button></a></div>
							<div class="col-1 ps-0"><a class="d-grid"  href="./freeBoardDeleteContentProcess.do?free_no=${data.FreeBoardVo.free_no }"><button type="button" class="btn btn-outline-secondary">삭제</button></a></div>
							</c:if>
							<div class="col-1 ps-0"><a class="d-grid"  href="./boardFree.do"><button type="button" class="btn text-white" style="background-color:#F25C19">목록</button></a></div>
						</div>
						<form action ="./rippleWriteContentProcess.do" method ="post">
						<div class="row my-1">
							
							<input type ="hidden" name ="member_no" value="${memberUser.member_no }">
							<input type ="hidden" name ="free_no" value="${data.FreeBoardVo.free_no }">
							<div class="col-1 pe-0"><i class="bi bi-person-circle"></i></div>
							<div class="col-2 ps-1">${memberUser.member_nick }</div>
							<div class="col-7 d-grid ps-0"><input type="text" name="ripple_content"></div>
							<div class="col-2 d-grid ps-0"><input type="submit" class="btn btn-primary" value="작성 완료"></div>
							
						</div>
						</form>
						<c:forEach items="${list}" var="data">
						<div class="row my-1">
							<div class="col-1 pe-0"><i class="bi bi-person"></i></div>
							<div class="col-2 ps-1">${data.MemberVo.member_nick }</div>
							<div class="col-7  ps-0">${data.RippleVo.ripple_content }</div>
							<div class="col-2 d-grid ps-0"></div>
						</div>
						</c:forEach>
					</div>
				</div>	
			</div>
			<div class="col-3 mt-2">
				<img src="../resources/img/세로배너1.jpg" style="height:80%;">
			</div>
		</div>
		
	</div>
</div>
<jsp:include page="../common/global_footer.jsp"></jsp:include>
	
</body>
</html>