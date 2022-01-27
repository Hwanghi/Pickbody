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
   <div style="width: 1200px; margin: 0 auto;">
      <div class="container">
         <div class="row" style="background-color:#F2F2F2;">
            <div class="col-2 px-0">
               <!-- 왼쪽 -->
                  <!-- 네비바 -->
                  <jsp:include page="../common/global_nav_admin.jsp"></jsp:include>
            </div>
            
            <div class="col mt-2 mb-2" style="font-size: 11px;">
            <div class="row mt-5" >
	            <div class="col-1"></div>
	            <div class="col mt-2" style="background-color: white;">
	               <table class="table table-hover text-center">
	                <thead class="table-dark">
	                   <tr>
	                     <th scope="col">구매자</th>
	                     <th scope="col">상품이름</th>
	                     <th scope="col">수량</th>
	                     <th scope="col">총 가격</th>
	                     <th scope="col">주소</th>
	                     <th scope="col">등록일자</th>
	                     <th scope="col">배송메모</th>
	                     
	                   </tr>
	                 </thead>
	                 <tbody>
	                   <tr>
	                     <th scope="row">이종명</th>
	                     <td>런닝머신</td>
	                     <td>1</td>
	                     <td>500,000원</td>
	                     <td>경기도 남양주시</td>
	                     <td>2021.12.09</td>
	                     <td>빠른 배송 부탁드려요.</td>
	                     
	                   </tr>
	                   <tr>
	                     <th scope="row">정모씨</th>
	                     <td>벤치프레스</td>
	                     <td>1</td>
	                     <td>700,000원</td>
	                     <td>서울특별시 동대문구</td>
	                     <td>2021.12.05</td>
	                     <td>문앞에 놓아주세요.</td>
	                     
	                   </tr>
	                   <tr>
	                     <th scope="row">강모씨</th>
	                     <td>싸이클</td>
	                     <td>1</td>
	                     <td>250,000원</td>
	                     <td>경기도 수원시</td>
	                     <td>2021.11.25</td>
	                     <td>도착시 문자 주세요.</td>
	                   </tr>
	                   <tr>
	                     <th scope="row">김모씨</th>
	                     <td>케틀벨 아령</td>
	                     <td>1</td>
	                     <td>22,900원</td>
	                     <td>서울특별시 강남구</td>
	                     <td>2021.11.11</td>
	                     <td>경비실에 맡겨 주세요.</td>
	                   </tr>
	                   <tr>
	                     <th scope="row">황모씨</th>
	                     <td>12kg 바벨</td>
	                     <td>4</td>
	                     <td>80,000원</td>
	                     <td>서울특별시 압구정로</td>
	                     <td>2021.11.11</td>
	                     <td>문앞에 놓아주세요.</td>
	                   </tr>
	                   <tr>
	                     <th scope="row">서모씨</th>
	                     <td>스마트 전동거꾸리</td>
	                     <td>1</td>
	                     <td>620,000원</td>
	                     <td>인천광역시 부평구</td>
	                     <td>2021.11.11</td>
	                     <td>조심히 다뤄주세요.</td>
	                   </tr>
	                 </tbody>
	               </table>
	               
	               </div> 
	               <div class="col-1"></div>             
            </div>
            </div>
         </div>
      </div>
   </div>
   
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>