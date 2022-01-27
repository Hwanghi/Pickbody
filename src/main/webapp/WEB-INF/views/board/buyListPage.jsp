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
</style>
</head>
<body>
   <div style="width: 1200px; margin: 0 auto;">
      <jsp:include page="../common/global_nav_member.jsp"></jsp:include>
      <jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
      <div class="container">
         <div class="row">
            <div class="col">
               
            </div>
         </div>

         <div class="row">
            <div class="col-1"></div>
            <div class="col">
               <div class="row mt-5">
                  <!-- 게시판로고 -->
                  <div class="col fs-1 fw-bold text-center">
                     <a class="text-dark" href="../board/buyListPage.do"
                        style="text-decoration: none;">${memberUser.member_nick}님의
                        주문리스트</a>
                  </div>
               </div>
               
               <div class="row border border-1 mt-4">
               <div class="col">
               <div class="row border-bottom">
                  <div class="col text-center" style="background-color: #BEBEBE;">
                     My Shopping
                  </div>
                  </div>
                  <div class="row">
                  
                  <div class="col text-center">
                  배송중
                  <div class="row">
                  <div class="col"></div>
                  <div class="col">
                  <img src="../resources/img/delivering.png"
                                          style="width: 150px; height: 150px;">
                  </div>
                  <div class="col align-self-center fs-1">
                  1
                  </div>
                  </div>
                  </div>
                  
                  <div class="col text-center">
                  배송완료
                  <div class="row">
                  <div class="col"></div>
                  <div class="col">
                  <img src="../resources/img/delivery_arrived.png"
                                          style="width: 150px; height: 150px;">
                  </div>
                  <div class="col align-self-center fs-1">
                  2
                  </div>
                  </div>
                  </div>
                  
                  <div class="col text-center">
                  교환/반품/환불
                  <div class="row">
                  <div class="col"></div>
                  <div class="col">
                  <img src="../resources/img/return_product.png"
                                          style="width: 150px; height: 150px;">
                  </div>
                  <div class="col align-self-center fs-1">
                  0
                  </div>
                  </div>
                  </div>
                  
                  </div>
                  </div>
                  </div>
                   <c:forEach items="${buyList}" var="buydata">
                  <div class="row border border-1 mt-5">
                 
                  <div class="col">
                  <div class="row border-bottom">
                  <div class="col text-center" style="background-color: #BEBEBE;">
                     My BuyList
                  </div>
                  </div>
                  
               
                  
                  <div class="row my-3">
                  <div class="col-2"><img src="/upload/${buydata.sellImageVo[0].sellImage_link}" style="width: 100px; height: 100px;"></div>
                  
                  <div class="col">
                  <div class="row">
                  <div class="col">상품명:<a href="./readBuyBoardPage.do?sell_no=${buydata.sellBoardVo.sell_no}">${buydata.sellBoardVo.sell_name}</a></div>
                  </div>
                  
                  <div class="row">
                  <div class="col-4">가격:${buydata.sellBoardVo.sell_price}</div>
                  <div class="col">갯수:${buydata.buyBoardVo.buy_Quantity}</div>
                  </div>
                  
                  <div class="row">
                  <div class="col">주소지:${buydata.buyBoardVo.buy_adress }</div>
                  </div>
                  
                  <div class="row">
                  <div class="col mt-4">상품은 잘받아보셨나요? 확인하시고 구매확정 해주세요!</div>
                  </div>
                  </div>
                  
                  <div class="col-2 text-center align-self-center">
                  <div class="row">
                  <div class="col">Pick Body</div>
                  </div>
                  <div class="row">
                  <div class="col">02-345-6789</div>
                  </div>
                  <div class="row">
                  <div class="col"><a class="btn" style="background: #BEBEBE;" href="">문의하기</a></div>
                  </div>
                  </div>
                  
                  <div class="col-2 text-center align-self-center">
                  <div class="row">
                  <div class="col"><a class="btn" style="background: #BEBEBE;" href="">교환요청</a></div>
                  </div>
                  <div class="row ">
                  <div class="col my-2"><a class="btn" style="background: #BEBEBE;" href="">환불요청</a></div>
                  </div>
                  <div class="row ">
                  <div class="col"><a class="btn" style="background: #F25C19; color: #FFFFFF;" href="">구매확정</a></div>
                  </div>
                  </div>
                  </div>
                  
                  </div>
                  
                  </div>
                  </c:forEach>
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
               
               
               
               
               
               
               
               
               
               
               
               <!--                   <div class="row mt-2">테이블내용 -->
               <!--                      <div class="col"> -->
               <!--                      <table class="table table-striped"> -->
               <!--                         <tr> -->
               <!--                            <td>상품 이름</td> -->
               <!--                            <td>가격</td> -->
               <!--                            <td>수량</td> -->
               <!--                            <td>배송지</td>       -->
               <!--                         </tr> -->
               <%--                   <c:forEach items="${buyList}" var="buydata"> --%>
               <!--                      <tr>  -->

               <%--                               <td><a href="./readBuyBoardPage.do?sell_no=${buydata.sellBoardVo.sell_no}">${buydata.sellBoardVo.sell_name}</a></td> --%>
               <%--                               <td>${buydata.sellBoardVo.sell_price}</td> --%>
               <%--                               <td>${buydata.buyBoardVo.buy_Quantity}</td>                --%>
               <%--                                        <td>${buydata.buyBoardVo.buy_adress }</td>                   --%>

               <!--                      </tr>  -->
               <%--                         </c:forEach>  --%>
               <!--                      </table> -->
               <!--                      </div> -->
               <!--                      </div> -->


            </div>
            <div class="col-1"></div>
         </div>
      </div>
   </div>

   <jsp:include page="../common/global_footer.jsp"></jsp:include>
</body>
</html>