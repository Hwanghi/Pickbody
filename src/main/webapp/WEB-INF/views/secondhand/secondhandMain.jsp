<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- font & color -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.7"></script>

 
    <style>

    
        .boardbigbox1{
             border: 1px solid rgb(180, 180, 180); 

         }
         .boardbigbox2{
             border: 1px solid rgb(180, 180, 180); background-color: rgb(220, 220, 220);

         }
         .boardbigbox3{
             border: 1px solid rgb(180, 180, 180); background-color: rgb(150, 150, 150);

         }
         #cardbox, #cardbox2, #cardbox3, #cardbox4, #cardbox5{
             padding: 10px; 
        
         }

         .image{
             width: 228px;
             height: 256px;
         }

    </style>
    <style type="text/css">
       a.salepage:link {
        color : black;
        text-decoration: none;
      }
      a.salepage:visited {
        color : black;
        text-decoration: none;
      }
      a.salepage:hover {
        color : red;
        text-decoration: none;
      }
      a.salepage:active {
        color : black;
        text-decoration: none;
      }
      
      a.salebox:link {
        color : black;
        text-decoration: none;
      }
      a.salebox:visited {
        color : black;
        text-decoration: none;
      }
      a.salebox:hover {
        color : black;
        text-decoration: none;
      }
      a.salebox:active {
        color : black;
        text-decoration: none;
      }
          .background-gray {
		  background-color: #F2F2F2;
		}
  
      
    </style>

</head>


<body>
    <div style="width: 1200px; margin: 0 auto">
        <jsp:include page="../common/global_nav_member.jsp"></jsp:include>
        <jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
        <div class="container-fluid">
            <div class ="row">
                <div class="col-1"></div> <!-- 로그인 + 네비바-->
                <div class="col-10 background-gray" >
                        <!--중고장터 전용 헤더 시작-->
                        <div class="row" style="border-bottom: black 1px solid; padding-bottom: 15px; padding-top:15px;">

                         <div class="col-2">
                          <a href="./secondhandWritePage.do" class="salepage">
                             <div class="row" >
                            <div class="col-5" style="text-align: right; padding-right: 0;" >
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
                                <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
                              </svg>
                              
                            </div>
                            <div class="col-6">
                                판매하기
                            </div>
        
                        </div>
                        </a>
                        </div>
                            <div class="col-6" style="padding-right: 0; padding-left: 20;">
                                <div class="row">
                                    <div class="col-11">
                                        <input type="search" id="form1" class="form-control" />              
                                     </div>
                                    <div class="col-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                          </svg>
                                    </div>   
                                    
                                                                    
                                </div>
                                 
                            </div>


                            <div class="col-2" style="padding-right: 0;">
                                
                                   <div class="row" >
                                       <div class="col-1"></div>
                                       <div class="col">
                                        <a href="secondhandWishlist.do" class="salepage">
                                       <div class="row">
                                        
                                    <div class="col-6" style="text-align: right; padding-right: 0;" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                                      </svg>
                                  </div>
                                  <div class="col-6">찜목록</div>    
                                </div>
                                </a>
                                </div>        
                              </div>
                             
                              </div>

                              
                                <div class="col-2" style="padding-left:0;">
                                <a href="secondhandMyshop.do" class="salepage">
                                   <div class="row" >
                                  <div class="col-5" style="text-align: right; padding-right: 0;" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" align>
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
                                        </svg>
                                    
                                  </div>
                                  <div class="col-6">내상점 </div>
              
                              </div>
                              </a>
                              </div>                        
                        </div> 
                        <!--중고상품 페이지 헤더 끝-->
                    <div class="row mt-5">
                        <div class="col-4 fs-1 fw-bold ">상품목록</div>
                        <div class="col-4"></div>
                        <div class="col-4">
                           
                            <div class="row mt-1">
                          <!--      <div class="col-3" style="text-align: right;">가격순</div>
                                <div class="col-1">ㅇ</div>
                                <div class="col-3" style="text-align: right;">최신순</div>
                                <div class="col-1">ㅇ</div>
                                <div class="col-3" style="text-align: right;">주변상품</div>
                                <div class="col-1">v</div>-->
                                <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                    <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck1"> 가격순 </label>
                                  
                                    <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck2"> 최신순 </label>
                                  
                                    <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                    <label class="btn btn-outline-primary" for="btncheck3"> 판매순 </label>
                                  </div>
                                  
                            </div>
                        </div>
                    </div>
                 
                    <div class="row mt-3"> <!-- 카드박스-->
						<c:forEach items="${list }" var="data">
						
                        <div class="col-3" id="cardbox">
                         <c:choose>
                                <c:when test="${data.svo.item_status eq '판매중' }">
                       
                            <div class="boardbigbox1" >
                            
                            </c:when>
                            <c:when test="${data.svo.item_status eq '거래중' }">
                       
                            <div class="boardbigbox2" >
                            
                            </c:when>
                            	<c:when test="${data.svo.item_status eq '거래완료' ||data.svo.item_status eq '평가완료' }">
                       
                            <div class="boardbigbox3" >
                            
                            </c:when>
                            	</c:choose>
                            <a href="./secondhandReadPage.do?item_no=${data.svo.item_no }&no=${data.svo.member_no}" class="salebox">
                               
                                <div class="row" ">
                                	<div class="col-1" style="padding-right: 0; padding-left: 0;"></div>
                                    <div class="col" style="padding-left: 0;">
                                    
                                    <c:choose>
                                    <c:when test="${data.svo.item_status eq '평가완료' }">
                                    거래완료
                                    </c:when>
                                    <c:otherwise>
                                    ${data.svo.item_status }
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    
                                    
                                    </div>
                                    <div class="col-1"> </div>
                                    
                                     <div class="col" style="padding-right: 0;">
                                     <fmt:formatDate pattern="yyyy/MM/dd"
                        				value="${data.svo.item_writedate }" />
                                     </div>
                                     <div class="col-1" style="padding-left: 0; padding-right: 0;"> </div>
                                </div>
                                

                                <div class="row mt-1">
                                     <div class="col" style="height: 16rem;"><img class="image" src="/upload/${data.ivo.image_link }" > </div>
                                </div>
                            	
                            	<div class="row mt-1">
                            		<div class="col-1"style="padding-right: 0;"></div>
                            		<div class="col"style="padding-left: 0; padding-right: 0;" ><h5>
                            		
                            		<c:choose>
                            		<c:when test="${fn:length(data.svo.item_title) gt 13 }">
                            		<c:out value="${fn:substring(data.svo.item_title, 0, 12)}..."></c:out>
                            		</c:when>
                            		<c:otherwise>
                            		<c:out value="${data.svo.item_title}">
                            		</c:out>
                            		</c:otherwise>
                            		
                            		
                            		</c:choose>
                            		</h5></div>
                            		<div class="col-1"style="padding-left: 0;"></div>
                            	</div>
                                <div class="row mt-1">
                              		<div class="col-1" style="padding-right: 0;"></div>
                                    <div class="col"style="padding-left: 0;">${data.svo.item_price } 원</div>
                           
                                    <div class="col-5" style="padding-right: 0;">
                                    <c:choose>
                                    	<c:when test="${data.average ne '0'}">
                                    	<div class="row">
                                    	<div class="col-3"></div>
                                    	
                                    
                                    	<div class="col-1">
                                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"></path>
</svg>
                                    	
                                    	
                                    	</div>
                                    	<div class="col" style="text-align: right;">${data.average }</div>
                                    	</div>
                                    	</c:when>
                                    	<c:otherwise>
                                    	<div class="row">
                                    	<div class="col" style="text-align: right;">
                                   		첫거래입니다
                                    	</div>
                                    	</div>
                                    	
                                    	 </c:otherwise>
                                    </c:choose>
                                    </div>
                                    <div class="col-1"style="padding-left: 0;"></div>
                                </div>
                                </a>
                             </div>                   
                        </div>
                         </c:forEach>
                </div>
                <div class="col"></div>
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