<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<script>
function getMyGroupAndList(){
	
    var xmlhttp = new XMLHttpRequest();
    
    xmlhttp.onreadystatechange = function() {
       if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          var data = JSON.parse(xmlhttp.responseText);
       
          var accordionOuterCol = document.getElementById("accordionOuterCol");      
          accordionOuterCol.innerHTML="";
          
          var arccordionRow = document.createElement("div");
          arccordionRow.setAttribute("class", "row");
                   
          var mainCol = document.createElement("div");
          mainCol.setAttribute("class", "col");

          var accordionMain = document.createElement("div");
          accordionMain.setAttribute("class", "accordion accordion-flush");
          accordionMain.setAttribute("id", "accordionFlushExample");
          
          arccordionRow.appendChild(mainCol);
          mainCol.appendChild(accordionMain);
          
          var index = 0;            
          for(groupMap of data.list){
             
             index++;
             
             var accordionItem = document.createElement("div");
             accordionItem.setAttribute("class", "accordion-item");
             
             accordionMain.appendChild(accordionItem);
             
             var h2Tag = document.createElement("h2");
             h2Tag.setAttribute("class", "accordion-header editFormParent");
             h2Tag.setAttribute("id", "b" + index);
             
             var itemRow = document.createElement("div");
             itemRow.setAttribute("class", "row py-3");
             var itemColOne = document.createElement("div");
             itemColOne.setAttribute("class", "col fs-6");
             var itemColTwo = document.createElement("div");
             itemColTwo.setAttribute("class", "col-2");
             var itemColeDelete = document.createElement("div");
             itemColeDelete.setAttribute("class", "col-2 fs-6")
             var addFollowBadgeCol = document.createElement("div");
             addFollowBadgeCol.setAttribute("class", "col-2 fs-6");
             
             var addFollowBadge = document.createElement("span");
             addFollowBadge.setAttribute("class", "fx-6 badge rounded-pill");
             addFollowBadge.setAttribute("style", "background-color:#F2B705");
             addFollowBadge.setAttribute("onclick", "addFollow(this, "+groupMap.fgVo.group_no+")");
             addFollowBadge.innerText = "add";
             
             //addFollowBadgeCol.appendChild(addFollowBadge);
             
             if(groupMap.fgVo.group_name != "기본그룹"){
                var deleteBadge = document.createElement("span");
                deleteBadge.setAttribute("class", "fx-6 badge rounded-pill");
                deleteBadge.setAttribute("style", "background-color:#BEBEBE");
                deleteBadge.setAttribute("onclick", "deleteGroupProcess("+groupMap.fgVo.group_no+")");
                deleteBadge.innerText = "X";
                itemColeDelete.appendChild(deleteBadge);
             }               
             
             var addFollowRow = document.createElement("div"); //follow추가 붙일 row
             addFollowRow.setAttribute("class", "row addFollowBoxRow mb-1");
             
             
             var editRow = document.createElement("div");
             editRow.setAttribute("class", "row");
             var editCol = document.createElement("div");
             editCol.setAttribute("class", "col editFormCol");
             
             h2Tag.appendChild(itemRow);
             itemRow.appendChild(itemColOne);
             itemRow.appendChild(addFollowBadgeCol);
             itemRow.appendChild(itemColeDelete);
             itemRow.appendChild(itemColTwo);
             
             editRow.appendChild(editCol);
             h2Tag.appendChild(addFollowRow); 
             h2Tag.appendChild(editRow);
             
             var groupNamebutton = document.createElement("button"); //<button class=>
             groupNamebutton.setAttribute("class", "accordion-button p-0 collapsed");
             groupNamebutton.setAttribute("type", "button");
             groupNamebutton.setAttribute("data-bs-toggle", "collapse");
             groupNamebutton.setAttribute("data-bs-target", "#a" + index);
             groupNamebutton.setAttribute("aria-expanded", "false");
             groupNamebutton.setAttribute("aria-expanded", "#a" + index);
             
             accordionItem.appendChild(h2Tag);
             itemColTwo.appendChild(groupNamebutton);
             
             var strongTag = document.createElement("strong");
             strongTag.innerText = groupMap.fgVo.group_name;
             strongTag.setAttribute("class", "me-3 fs-6");
             
             itemColOne.appendChild(strongTag);
             
             if(groupMap.fgVo.group_name != "기본그룹"){
                var editIcon = document.createElement("i");
                editIcon.setAttribute("class","bi bi-pencil-square");
                editIcon.setAttribute("onclick","editGroupName(this, "+groupMap.fgVo.group_no+" )");
                itemColOne.appendChild(editIcon);
             }               
             
             
             var memberNickArea = document.createElement("div");
             memberNickArea.setAttribute("id", "a" + index);
             memberNickArea.setAttribute("class", "accordion-collapse collapse");
             memberNickArea.setAttribute("aria-labelledby", "#b" + index);
             memberNickArea.setAttribute("data-bs-parent", "#accordionFlushExample");

             var accordionBody = document.createElement("div");
             accordionBody.setAttribute("class", "accordion-body");
             
             accordionItem.appendChild(memberNickArea);
             memberNickArea.appendChild(accordionBody);
             
             for(memberMap of groupMap.voList){
                var innerRow = document.createElement("div");
                innerRow.setAttribute("class", "row mb-1");
                
                var memberRadio = document.createElement("input");
                memberRadio.setAttribute("type", "radio");
                
                var innerColOne = document.createElement("div");
                innerColOne.setAttribute("class", "col-1");
                innerColOne.appendChild(memberRadio);
                
                var memberNickLink = document.createElement("a");
                memberNickLink.setAttribute("href", "../member/othersStoryPage.do?member_no=" + memberMap.mVo.member_no);
                
                
                var innerColTwo = document.createElement("div");
                innerColTwo.setAttribute("class", "col");
                var innerColLast = document.createElement("div");
                innerColLast.setAttribute("class", "col-1");
                
                innerColTwo.appendChild(memberNickLink);
                
                var innerColTwoMemberNickRow = document.createElement("div");
                innerColTwoMemberNickRow.setAttribute("class", "row");
                var innerColTwoMemberNickCol = document.createElement("div");
                innerColTwoMemberNickCol.setAttribute("class", "col");
                innerColTwoMemberNickCol.innerText = memberMap.mVo.member_nick;
                
                var innerColLastButtonRow = document.createElement("div");
                innerColLastButtonRow.setAttribute("class", "row");
                var innerColLastButtonCol = document.createElement("div");
                innerColLastButtonCol.setAttribute("class", "col");
                
                /* var followDeleteBadge = document.createElement("span");
                followDeleteBadge.setAttribute("class", "fx-6 badge rounded-pill text-dark");
                followDeleteBadge.setAttribute("onclick", "followDeleteProcess("+memberMap.mVo.member_no+")");
                followDeleteBadge.innerText = "X";
                innerColLastButtonCol.appendChild(followDeleteBadge); */
                
                innerColLast.appendChild(innerColLastButtonRow);
                innerColLastButtonRow.appendChild(innerColLastButtonCol);
                
                innerColTwoMemberNickRow.appendChild(innerColTwoMemberNickCol);
                memberNickLink.appendChild(innerColTwoMemberNickRow);
                
                innerRow.appendChild(innerColOne);
                innerRow.appendChild(innerColTwo);                  
                innerRow.appendChild(innerColLast);                  
                accordionBody.appendChild(innerRow);
                
              
             }
          }
          
          accordionOuterCol.appendChild(arccordionRow);            
      
       }
    };
    
    xmlhttp.open("post", "./getMyGroupAndFollow.do", false);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.send();      
}

  //페이지로드 후 실행
   window.addEventListener("DOMContentLoaded" , function(){
      getMyGroupAndList();
   });

</script>

</head>
<body>

	<div style="width: 1200px; margin: 0 auto;">
		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
		<jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
		<div class="container">
			<div class="row mt-3">
				<div class="col-4" id="accordionOuterCol"></div>
				<div class="col-8">
					<div class="row">
					<form>
						<div class="col d-grid">
							<%--쪽지제목 --%>
							<input type="text" class="p-2 flex-fill bd-highlight" name="message_title" placeholder="제목">
						</div>
					</div>
					<div class="row mt-1">
						<div class="col d-grid">
							<%--쪽지내용 --%>
							<textarea name="message_content" style="height: 300px"></textarea>
							<input type="hidden" name="sender_no"
								value="${memberUser.member_no }"> <input type="hidden"
								name="message_isRead" value="N"> <input type="hidden"
								name="message_senderDelete" value="N"> <input
								type="hidden" name="message_receiveDelete" value="N">
						</div>
					</div>
					<div class="row mt-2">
						<div class="col d-grid">
							<input type="submit" class="btn"
								style="background-color: #F2B705" value="전송하기">
						</div>
					</div>
					</form>
				</div>				
			</div>
		</div>
	</div>
	<jsp:include page="../common/global_footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>