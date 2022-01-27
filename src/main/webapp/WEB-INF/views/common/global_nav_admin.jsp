<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- include 대상이 되는 jsp는...html,head,body 태그 없어야 된다... -->    

<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 200px; height:720px;">
    <a href="../admin/siteStatisticsPage.do" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      <img src="../resources/img/dumbell.png" style="width:40px; height:32px;">
      <span class="fs-4">PICKBODY</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="../admin/siteStatisticsPage.do" class="nav-link text-white">
          	<i class="bi bi-file-bar-graph"></i>
          	사이트 통계
        </a>
      </li>
      <li>
        <a href="../admin/managementMemberPage.do" class="nav-link text-white">
          <i class="bi bi-people-fill"></i>
          	회원 관리
        </a>
      </li>
      <li>
        <a href="../admin/sellPage.do" class="nav-link text-white">
          	<i class="bi bi-cart-fill"></i>
          	쇼핑몰 관리
        </a>
      </li>
      <li>
        <a href="../admin/dropBoardPage.do" class="nav-link text-white">
          	<i class="bi bi-calendar-event-fill"></i>
          	드랍 관리
        </a>
      </li>
      <li>
        <a href="../admin/registExerciseCategoryPage.do" class="nav-link text-white">
          	<i class="bi bi-dribbble"></i>
          	운동 목록 관리
        </a>
      </li>
      <li>
        <a href="../admin/registFoodCategoryPage.do" class="nav-link text-white">
          	<i class="bi bi-egg-fried"></i>
          	음식 목록 관리
        </a>
      </li>
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="bi bi-person-workspace" style="width:32px; height=:32px;"></i>
        <strong>${sessionAdmin.admin_nick }</strong>
      </a>
      <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
        <li><a class="dropdown-item" href="#">New project...</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><a class="dropdown-item" href="#">Profile</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="../admin/logoutProcess.do">Sign out</a>
        </li>
      </ul>
    </div>
  </div>

