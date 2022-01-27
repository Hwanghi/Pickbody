<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidenav container-fluid text-white">

	<div class="row">
		<div class="col text-end">
			<i class="bi bi-arrow-left-short fs-1"></i>
		</div>
	</div>
	<div class="row firstBox  mx-2">
		<c:if test="${empty trainerUser }">
			로그인이 필요한 서비스 입니다.
		</c:if>
	</div>
	<div class="row secendBox">
	</div>
	<div class="row thirdBox p-1">

	</div>
</div>