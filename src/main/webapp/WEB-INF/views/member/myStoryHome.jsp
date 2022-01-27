<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoryMainPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<!-- side bar 추가 할 것 -->
<link rel="stylesheet" type="text/css" href="../resources/css/basic.css?version=1.0.5">
<link rel="stylesheet" type="text/css" href="../resources/css/sidebar_member.css">
<script src="../resources/js/sidebar_member.js?version=2.1.2"></script>
<style>
   a{
      text-decoration: none;
   }
</style>


<script>

   //그룹추가하기
   function addNewGroup() {
   
      var xmlhttp = new XMLHttpRequest();
   
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            //var data = JSON.parse(xmlhttp.responseText);
            
            //그룹목록가져오기
            getMyGroupAndList();
         }
      };
   
      xmlhttp.open("post", "./addNewGroup.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   //그룹+친구 리스트
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
               
               addFollowBadgeCol.appendChild(addFollowBadge);
               
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
                  
                  var memberIcon = document.createElement("i");
                  memberIcon.setAttribute("class", "bi bi-person-circle");
                  
                  var innerColOne = document.createElement("div");
                  innerColOne.setAttribute("class", "col-1");
                  innerColOne.appendChild(memberIcon);
                  
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
                  
                  var followDeleteBadge = document.createElement("span");
                  followDeleteBadge.setAttribute("class", "fx-6 badge rounded-pill text-dark");
                  followDeleteBadge.setAttribute("onclick", "followDeleteProcess("+memberMap.mVo.member_no+")");
                  followDeleteBadge.innerText = "X";
                  innerColLastButtonCol.appendChild(followDeleteBadge);
                  
                  innerColLast.appendChild(innerColLastButtonRow);
                  innerColLastButtonRow.appendChild(innerColLastButtonCol);
                  
                  innerColTwoMemberNickRow.appendChild(innerColTwoMemberNickCol);
                  memberNickLink.appendChild(innerColTwoMemberNickRow);
                  
                  innerRow.appendChild(innerColOne);
                  innerRow.appendChild(innerColTwo);                  
                  innerRow.appendChild(innerColLast);                  
                  accordionBody.appendChild(innerRow);
                  
                  /*
                  if(groupMap.voList.length <0 ){
                     var nullBoxRow = document.createElement("div");
                     nullBoxRow.setAttribute("class", "row");
                     var nullBoxCol = document.crateElement("div");
                     nullBoxCol.setAttribute("class", "col");
                     nullBoxCol.innerText = "비어있는 그룹";
                     nullBoxRow.appendChild(nullBoxCol);
                     accordionBody.appendChild(nullBoxRow);
                  }
                  */   
               }
            }
            var buttonRow = document.createElement("div");
            buttonRow.setAttribute("class", "row mt-2");
            
            var buttonCol = document.createElement("div");
            buttonCol.setAttribute("class", "col d-grid");
            
            var newGroupButton = document.createElement("button");
            newGroupButton.setAttribute("type", "button");
            newGroupButton.setAttribute("class", "btn btn-light");
            newGroupButton.setAttribute("onclick", "addNewGroup()");
            
            var buttonIcon = document.createElement("i");
            buttonIcon.setAttribute("class", "bi bi-plus-circle-fill");
            
            
            newGroupButton.appendChild(buttonIcon);
            buttonCol.appendChild(newGroupButton);
            buttonRow.appendChild(buttonCol);
            
            accordionOuterCol.appendChild(arccordionRow);            
            accordionOuterCol.appendChild(buttonRow);            
         }
      };
      
      xmlhttp.open("post", "./getMyGroupAndFollow.do", false);
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();      
   }
   //팔로우삭제
   function followDeleteProcess(memberNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            getMyGroupAndList();
            getMyStoryBoard();
         }
      };
   
      xmlhttp.open("post", "./deleteFollowProcess.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("member_no=" + memberNo);
   }
   //팔로우추가 버튼
   function addFollow(e, groupNo){
      
      var addFollowBoxRows = document.getElementsByClassName("addFollowBoxRow");
      for(a of addFollowBoxRows){
         a.innerHTML = "";
      }
            
      var parentClass = e.closest(".editFormParent");
      var addFollowBoxRow = parentClass.getElementsByClassName("addFollowBoxRow");
      
      var writeMemberNickCol = document.createElement("div");
      writeMemberNickCol.setAttribute("class", "col-8 d-grid");
      
      var addFollowButtonCol = document.createElement("div");
      addFollowButtonCol.setAttribute("class", "col-4 d-grid");
      
      var addFollowMemberNickTextBox = document.createElement("input");
      addFollowMemberNickTextBox.setAttribute("type", "text");
      addFollowMemberNickTextBox.setAttribute("class", "fs-6 pe-0");
      addFollowMemberNickTextBox.setAttribute("id", "addFollowMemberNick");
      addFollowMemberNickTextBox.setAttribute("style", "width:100%");
      
      writeMemberNickCol.appendChild(addFollowMemberNickTextBox);
      
      var addFollowmemberButton = document.createElement("button");
      addFollowmemberButton.setAttribute("type", "button");
      addFollowmemberButton.setAttribute("class", "btn btn-light fs-6 p-0");
      addFollowmemberButton.setAttribute("style", "height:20pt");
      addFollowmemberButton.innerText = "추가";
      addFollowmemberButton.setAttribute("onclick", "checkFollowState("+groupNo+")");
      
      addFollowButtonCol.appendChild(addFollowmemberButton);
      
      addFollowBoxRow[0].appendChild(writeMemberNickCol);
      addFollowBoxRow[0].appendChild(addFollowButtonCol);
   }
   //팔로우상태확인
   
   function checkFollowState(groupNo){
      
      var addFollowMemberNickBox = document.getElementById("addFollowMemberNick");
      var addFollowMemberNick = addFollowMemberNickBox.value;
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = JSON.parse(xmlhttp.responseText);

            if(data.error !=null){
               alert('존재하지 않는 회원입니다.');
               return;
            }
            
            
            if(data.fVo == null){
               addFollowProcess(groupNo, data.follow_member_no);
               getMyGroupAndList();
            }else{
               alert('이미 팔로우된 회원입니다.');
            }
         }
      };
   
      xmlhttp.open("post", "./checkFollowState.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("member_nick=" + addFollowMemberNick);
   }
   
   //팔로우
   function addFollowProcess(groupNo, followMemberNo){
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            getMyStoryBoard();                        
         }
      };
   
      xmlhttp.open("post", "./addFollowProcess.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("follow_member_no=" + followMemberNo +"&group_no=" + groupNo);
   }
   
   
   //팔로워리스트
   function getMyFollowerList(){

      var xmlhttp = new XMLHttpRequest();
   
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = JSON.parse(xmlhttp.responseText);

            var accordionOuterCol = document.getElementById("accordionOuterCol");
            
            var followListRow = document.createElement("div");
            followListRow.setAttribute("class", "row mt-3");
            accordionOuterCol.appendChild(followListRow);
            
            var accordionBox = document.createElement("div");
            accordionBox.setAttribute("class", "accordion accordion-flush");
            accordionBox.setAttribute("id", "accordionExample");
            
            followListRow.appendChild(accordionBox);
            
            var accordionItem = document.createElement("div");
            accordionItem.setAttribute("class", "accordion-item");
            
            var accordionButtonRow = document.createElement("div");
            accordionButtonRow.setAttribute("class", "row");
            var accordionButtonColOne = document.createElement("div");
            accordionButtonColOne.setAttribute("class", "col-10 fs-6");
            var accordionButtonColTwo = document.createElement("div");
            accordionButtonColTwo.setAttribute("class", "col-1");
                        
            accordionBox.appendChild(accordionItem);
            
            var h2Tag = document.createElement("h2");
            h2Tag.setAttribute("class", "accordion-header");
            h2Tag.setAttribute("id", "headingOne");
            var strongTag = document.createElement("strong");            
            strongTag.innerText = "Follower List";
            
            accordionItem.appendChild(h2Tag);
            h2Tag.appendChild(accordionButtonRow);
            accordionButtonRow.appendChild(accordionButtonColOne);
            accordionButtonRow.appendChild(accordionButtonColTwo);

            accordionButtonColOne.appendChild(strongTag);
         
            var accordionButton = document.createElement("button");
            accordionButton.setAttribute("class", "p-0 accordion-button collapsed");
            accordionButton.setAttribute("type", "button");
            accordionButton.setAttribute("data-bs-toggle", "collapse");
            accordionButton.setAttribute("data-bs-target", "#collapseOne");
            accordionButton.setAttribute("aria-expanded", "false");
            accordionButton.setAttribute("aria-controls", "collapseOne");

            
            accordionButtonColTwo.appendChild(accordionButton);
            
            var accordionList = document.createElement("div");
            accordionList.setAttribute("class", "accordion-collapse collapse");
            accordionList.setAttribute("id", "collapseOne");
            accordionList.setAttribute("aria-labelledby", "headingOne");
            accordionList.setAttribute("data-bs-parent","#accordionExample");
            
            accordionItem.appendChild(accordionList);
               
            if(data.list.length > 0){
               for(followerList of data.list){
                  
                  var memberNickLink = document.createElement("a");
                  memberNickLink.setAttribute("href", "../member/othersStoryPage.do?member_no=" + followerList.member_no);
                  
                  var memberNickRow = document.createElement("div");
                  memberNickRow.setAttribute("class", "row py-2 border-bottom");
                  var memberNickCol = document.createElement("div");
                  memberNickCol.setAttribute("class", "col");
                  
                  var iconTag = document.createElement("i");
                  iconTag.setAttribute("class", "bi bi-people-fill pe-3");
                  memberNickCol.appendChild(iconTag);
                  
                  memberNickLink.innerText = followerList.member_nick;
                  var followerDeleteCol = document.createElement("div");
                  followerDeleteCol.setAttribute("class", "col-1");
                  var followerDeleteSpan = document.createElement("span");
                  followerDeleteSpan.setAttribute("class", "fx-6 px-0 badge rounded-pill text-dark");
                  followerDeleteSpan.setAttribute("onclick", "followerDeleteProcess("+ followerList.member_no +")")
                  followerDeleteSpan.innerText = "X";
                  followerDeleteCol.appendChild(followerDeleteSpan);
                  
                  memberNickRow.appendChild(memberNickCol);
                  memberNickRow.appendChild(followerDeleteCol);
                  memberNickCol.appendChild(memberNickLink);
                  
                  var accordionBody = document.createElement("div");
                  accordionBody.setAttribute("class", "accordion-body py-1 ps-3");
                                    
                  accordionBody.appendChild(memberNickRow);
                  
                  accordionList.appendChild(accordionBody);
               }
            }else{
               var nullListLine = document.createElement("li");
               nullListLine.setAttribute("class", "list-group-item");
               nullListLine.innerText = "아직 팔로워가 없습니다.";
               
               accordionList.appendChild(nullListLine);
            }
         }
      };
   
      xmlhttp.open("post", "./getMyFollowerList.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   
   //팔로워 삭제
   function followerDeleteProcess(memberNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){   
            /*         
            var  = document.getElementsByClassName("");
            for(x of ){
               x.innerHTML = "";
            }
            */
            
         getMyFollowerList();
         }
      };
      xmlhttp.open("post", "./followerDeleteProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("follower_member_no=" + memberNo);
   }
   
   
   
   //스토리목록
   function getMyStoryBoard(){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = JSON.parse(xmlhttp.responseText);
            
            var storyCardMainCol = document.getElementById("middleMainCol");
            storyCardMainCol.innerHTML="";
            
            var writeStoryBoxForModalRow = document.createElement("div");
            writeStoryBoxForModalRow.setAttribute("class", "row mb-2 mx-1 rounded");
            writeStoryBoxForModalRow.setAttribute("onclick", "writeModal()");
            writeStoryBoxForModalRow.setAttribute("style", "background-color: #F25C19");
            
            storyCardMainCol.appendChild(writeStoryBoxForModalRow);
            
            var writeStoryBoxForModalIconCol = document.createElement("div");
            writeStoryBoxForModalIconCol.setAttribute("class", "col-1 py-3");
            var writeStoryBoxForModalIcon = document.createElement("i");
            writeStoryBoxForModalIcon.setAttribute("class", "bi bi-pencil-fill ms-2 text-light");
            var writeStoryBoxForModalTextCol = document.createElement("div");
            writeStoryBoxForModalTextCol.setAttribute("class", "col text-light pt-3");
            writeStoryBoxForModalTextCol.innerText = "다른 회원들에게 보여줄 내 스토리를 작성해보세요.";
            
            writeStoryBoxForModalRow.appendChild(writeStoryBoxForModalIconCol);
            writeStoryBoxForModalRow.appendChild(writeStoryBoxForModalTextCol);
            writeStoryBoxForModalIconCol.appendChild(writeStoryBoxForModalIcon);
            
            
            for(storyData of data.list){
               
               var storyCardMainRow = document.createElement("div");
               storyCardMainRow.setAttribute("class", "row mb-3");
               
               storyCardMainCol.appendChild(storyCardMainRow);
               
               var storyCardCol = document.createElement("div");
               storyCardCol.setAttribute("class", "col writeCommentBoxParent pt-2 px-4 border border-secondary rounded");
               
               storyCardMainRow.appendChild(storyCardCol);
               
               var storyCardWriterRow = document.createElement("div");
               storyCardWriterRow.setAttribute("class", "row");
               
               storyCardCol.appendChild(storyCardWriterRow);
               
               var storyCardWriterNickCol = document.createElement("div");
               storyCardWriterNickCol.setAttribute("class", "col pt-2 px-0");
               
               if("${memberUser.member_no}" == storyData.sVo.member_no){
                  storyCardWriterNickCol.innerText = storyData.mVo.member_nick;
               }else{
                  var storyCardWriterNickLinkRow = document.createElement("div");
                  storyCardWriterNickLinkRow.setAttribute("class", "row");
                  var storyCardWriterNickLinkCol = document.createElement("div");
                  storyCardWriterNickLinkCol.setAttribute("class", "col");
                  
                  var storyCardWriterNickLink = document.createElement("a");
                  storyCardWriterNickLink.setAttribute("href", "../member/othersStoryPage.do?member_no=" + storyData.mVo.member_no);
                  
                  storyCardWriterNickCol.appendChild(storyCardWriterNickLinkRow);
                  storyCardWriterNickLinkRow.appendChild(storyCardWriterNickLinkCol);
                  storyCardWriterNickLinkCol.appendChild(storyCardWriterNickLink);
                  storyCardWriterNickLink.innerText = storyData.mVo.member_nick;
               }
               
               
               var storyCardWriterIconCol = document.createElement("div");
               storyCardWriterIconCol.setAttribute("class", "col-1 pt-2");
               
               storyCardWriterRow.appendChild(storyCardWriterIconCol);
               storyCardWriterRow.appendChild(storyCardWriterNickCol);
               
               var checkFillIcon = document.createElement("i");
               checkFillIcon.setAttribute("class", "bi bi-person-check-fill me-2 ms-1");            
               var circlePersonIcon = document.createElement("i");
               circlePersonIcon.setAttribute("class", "bi bi-person-circle me-2 ms-1");
               
               if("${memberUser.member_no}" == storyData.sVo.member_no){
                  storyCardWriterIconCol.appendChild(circlePersonIcon);
               }else{
                  storyCardWriterIconCol.appendChild(checkFillIcon);
               }
               
               var storyDeleteCol = document.createElement("div");
               storyDeleteCol.setAttribute("class", "col-1")
               
               if("${memberUser.member_no}" == storyData.sVo.member_no){
                  var storyDeleteButton = document.createElement("button");
                  storyDeleteButton.setAttribute("type", "button");
                  storyDeleteButton.setAttribute("class", "btn-close mt-2");
                  storyDeleteButton.setAttribute("aria-label", "Close");
                  storyDeleteButton.setAttribute("onclick", "deleteStoryProcess("+ storyData.sVo.story_no +")");
                  
                  storyDeleteCol.appendChild(storyDeleteButton);
               }
               storyCardWriterRow.appendChild(storyDeleteCol);
               
               var storyCard = document.createElement("div");
               storyCard.setAttribute("class", "card my-3");
               storyCard.setAttribute("style", "width: max");
               
               storyCardCol.appendChild(storyCard);
               
               if(storyData.sVo.story_img_url != null){
                  var storyImage = document.createElement("img");
                  storyImage.setAttribute("src", "/upload/" + storyData.sVo.story_img_url);
                  storyImage.setAttribute("class", "card-img-top" )
                  
                  storyCard.appendChild(storyImage);
               }
               
               var storyBody = document.createElement("div");
               storyBody.setAttribute("class", "card-body");
               var storyContent = document.createElement("p");
               storyContent.setAttribute("class", "card-text");
               storyContent.innerText = storyData.sVo.story_content;
               
               storyBody.appendChild(storyContent);
               storyCard.appendChild(storyBody);
               
               var countLikeAndCommentRow = document.createElement("div");
               countLikeAndCommentRow.setAttribute("class", "row border-top border-bottom mx-2 my-2");
               
               var countLikeTextCol = document.createElement("div");
               countLikeTextCol.setAttribute("class", "col-2 my-1 ps-2 text-center pe-0");
               countLikeTextCol.innerText = "좋아요";
               var countLikeCol = document.createElement("div");
               countLikeCol.setAttribute("class", "col my-1 ps-0 text-start");
               countLikeCol.innerText = storyData.countLike + "개";
               var countCommentTextCol = document.createElement("div");
               countCommentTextCol.setAttribute("class", "col my-1 pe-3 text-end");
               countCommentTextCol.innerText = "댓글";
               var countCommentCol = document.createElement("div");
               countCommentCol.setAttribute("class", "col-1 my-1 ps-0");
               countCommentCol.setAttribute("onclick", "getCommentList(this, "+ storyData.sVo.story_no +")");
               countCommentCol.innerText = storyData.countComment + "개";
               
               countLikeAndCommentRow.appendChild(countLikeTextCol);
               countLikeAndCommentRow.appendChild(countLikeCol);
               countLikeAndCommentRow.appendChild(countCommentTextCol);
               countLikeAndCommentRow.appendChild(countCommentCol);
               storyCardCol.appendChild(countLikeAndCommentRow);
               
               var addLikeAndCommentButtonRow = document.createElement("div");
               addLikeAndCommentButtonRow.setAttribute("class", "row");
               
               storyCardCol.appendChild(addLikeAndCommentButtonRow);
               
               var addLikeAndCommentButtonCol = document.createElement("div");
               addLikeAndCommentButtonCol.setAttribute("class", "col");
               
               addLikeAndCommentButtonRow.appendChild(addLikeAndCommentButtonCol);
               
               //댓글리스트영역
               var storyCommentListRow = document.createElement("div");
               storyCommentListRow.setAttribute("class", "row commentListRow");
               
               //댓글작성영역
               var writeCommentBoxRow = document.createElement("div");
               writeCommentBoxRow.setAttribute("class", "row writeCommentBox");
               
               
               var iconAndButtonOuterRow = document.createElement("div");
               iconAndButtonOuterRow.setAttribute("class", "row");
               
               addLikeAndCommentButtonCol.appendChild(iconAndButtonOuterRow);
               addLikeAndCommentButtonCol.appendChild(storyCommentListRow);
               addLikeAndCommentButtonCol.appendChild(writeCommentBoxRow);
               
               
               var addLikeIconCol = document.createElement("div");
               addLikeIconCol.setAttribute("class", "col-3 text-end");
               var likeIcon = document.createElement("i");
               
               if(storyData.myLikeCount > 0){
                  likeIcon.setAttribute("class", "bi bi-hand-thumbs-up-fill px-1");   //text-primary  fs-5 가능 아이콘에
               }else{
                  likeIcon.setAttribute("class", "bi bi-hand-thumbs-up px-1");
               }
               
               
               iconAndButtonOuterRow.appendChild(addLikeIconCol);
               addLikeIconCol.appendChild(likeIcon);
               
               var addCommentIconCol = document.createElement("div");
               addCommentIconCol.setAttribute("class", "col-2 text-end");
               var commentIcon = document.createElement("i");
               commentIcon.setAttribute("class", "bi bi-chat-square px-1");
               
               iconAndButtonOuterRow.appendChild(addCommentIconCol);
               addCommentIconCol.appendChild(commentIcon);
               
               var addLikeButtonCol = document.createElement("div");
               addLikeButtonCol.setAttribute("class", "col-3 mb-3 px-0 text-start");
               addLikeButtonCol.setAttribute("onclick", "storyLike(this, "+ storyData.sVo.story_no +")");
               addLikeButtonCol.innerText = "좋아요";
               var addCommentButtonCol = document.createElement("div");
               addCommentButtonCol.setAttribute("class", "col-4 mb-3 px-0 text-start");
               addCommentButtonCol.setAttribute("onclick", "addStoryComment(this,"+ storyData.sVo.story_no +")");
               addCommentButtonCol.innerText = "댓글";
               
               iconAndButtonOuterRow.appendChild(addLikeIconCol);
               iconAndButtonOuterRow.appendChild(addLikeButtonCol);
               iconAndButtonOuterRow.appendChild(addCommentIconCol);
               iconAndButtonOuterRow.appendChild(addCommentButtonCol);
            }   
         }
      };
   
      xmlhttp.open("post", "./getMyStoryBoard.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   //스토리좋아요
   function storyLike(e, story_no){
      
      var xmlhttp = new XMLHttpRequest();
            
         xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState==4 && xmlhttp.status==200){
               getMyStoryBoard();
            }
         };

         xmlhttp.open("get" , "./storyDoLikeProcess.do?story_no=" + story_no); 
         xmlhttp.send();      
   }
   //스토리댓글달기
   function addStoryComment(e, storyNo){
      
      //댓글입력창초기화
      var writeCommentBoxs = document.getElementsByClassName("writeCommentBox");
      for(x of writeCommentBoxs){
         x.innerHTML = "";
      }
      
      var writeCommnetBoxTextCol = document.createElement("div");
      writeCommnetBoxTextCol.setAttribute("class", "col-9 pe-0 mb-3 d-grid")
      var writeCommnetBoxButtonCol = document.createElement("div");
      writeCommnetBoxButtonCol.setAttribute("class", "col-3 mb-3 d-grid");
      
      var writeBox = document.createElement("input");
      writeBox.setAttribute("type", "text");
      writeBox.setAttribute("id", "writeCommentContent");
      
      writeCommnetBoxTextCol.appendChild(writeBox);
      
      var insertCommentButton = document.createElement("button");      
      insertCommentButton.innerText = "등록";
      insertCommentButton.setAttribute("class", "btn text-white");
      insertCommentButton.setAttribute("style", "background-color:#F2B705");
      insertCommentButton.setAttribute("onclick", "insertCommentProcess("+ storyNo +")");
      
      writeCommnetBoxButtonCol.appendChild(insertCommentButton);
      
      var wrapperBox = e.closest(".writeCommentBoxParent");
      var writeCommentNewArea = wrapperBox.getElementsByClassName("writeCommentBox");
      
      writeCommentNewArea[0].appendChild(writeCommnetBoxTextCol);
      writeCommentNewArea[0].appendChild(writeCommnetBoxButtonCol);
   }
   function insertCommentProcess(storyNo){
      
      var commentContentBox = document.getElementById("writeCommentContent");
      var commentContent = writeCommentContent.value;
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){            
            getMyStoryBoard();
            //getCommentList(storyNo);
         }
      };
      xmlhttp.open("post", "./writeStoryCommentProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("story_no=" + storyNo + "&st_comment_content=" + commentContent);
   }
   function getCommentList(e, storyNo){
      
      var commentListRows = document.getElementsByClassName("commentListRow");
      for(x of commentListRows){
         x.innerHTML = "";
      }
      
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data = JSON.parse(xmlhttp.responseText);
            
            var commentListOuterCol = document.createElement("div");
            commentListOuterCol.setAttribute("class", "col");
            
            for(commentData of data.commentList){
               
               var commentListOuterRow = document.createElement("div");
               commentListOuterRow.setAttribute("class", "row border-bottom pb-2 pt-1");
               
               commentListOuterCol.appendChild(commentListOuterRow);
               
               var commentListNickCol = document.createElement("div");
               commentListNickCol.setAttribute("class", "col-2 me-2");
               
               if("${memberUser.member_no}" == commentData.memberVo.member_no){
                  commentListNickCol.innerText = commentData.memberVo.member_nick;                                 
               }else{
                  var commentListNickLinkRow = document.createElement("div");
                  commentListNickLinkRow.setAttribute("class", "row");
                  var commentListNickLinkCol = document.createElement("div");
                  commentListNickLinkCol.setAttribute("class", "col");
                  
                  var commentListNickLink = document.createElement("a");
                  commentListNickLink.setAttribute("href", "../member/othersStoryPage.do?member_no=" + commentData.memberVo.member_no);
                  
                  commentListNickCol.appendChild(commentListNickLinkRow);
                  commentListNickLinkRow.appendChild(commentListNickLinkCol);
                  commentListNickLinkCol.appendChild(commentListNickLink);
                  commentListNickLink.innerText = commentData.memberVo.member_nick;
               }
      
               var commentTextOuterCol = document.createElement("div");
               commentTextOuterCol.setAttribute("class", "col");
               
               var commentTextOuterRow = document.createElement("div");
               commentTextOuterRow.setAttribute("class", "row");
               
               commentTextOuterCol.appendChild(commentTextOuterRow);
               
               var commentListTextCol = document.createElement("div");
               commentListTextCol.setAttribute("class", "col");
               commentListTextCol.innerText = commentData.commentVo.st_comment_content;
               
               commentTextOuterRow.appendChild(commentListTextCol);
               
               if(commentData.memberVo.member_no == "${memberUser.member_no}"){
                  var commentListDeleteCol = document.createElement("div");
                  commentListDeleteCol.setAttribute("class", "col-2 text-white");
                  
                  var commentDeleteButton = document.createElement("button");
                  commentDeleteButton.setAttribute("type", "button");
                  commentDeleteButton.setAttribute("class", "btn-close p-0 mt-1");
                  commentDeleteButton.setAttribute("onclick", "deleteCommentProcess("+ commentData.commentVo.st_comment_no +")");
                  commentListDeleteCol.appendChild(commentDeleteButton);
                  commentTextOuterRow.appendChild(commentListDeleteCol);
               }

               //날짜부분!!!!
               var commentWriteDate = new Date(commentData.commentVo.st_comment_date);
               
               var commentListDateCol = document.createElement("div");
               commentListDateCol.setAttribute("class", "col-3 ms-2 pe-4 text-end");
               commentListDateCol.innerText 
                  = commentWriteDate.getFullYear() + "/" 
                  + commentWriteDate.getMonth() + "/"
                  + commentWriteDate.getDate();
               
               commentListOuterRow.appendChild(commentListNickCol);
               commentListOuterRow.appendChild(commentTextOuterCol);
               commentListOuterRow.appendChild(commentListDateCol);
               
               var wrapperBox = e.closest(".writeCommentBoxParent");
               var commentListArea = wrapperBox.getElementsByClassName("commentListRow");
               
               commentListArea[0].appendChild(commentListOuterCol);                  
            }
         }
      };
      xmlhttp.open("post", "./getStoryComments.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("story_no=" + storyNo);
   }
   function deleteCommentProcess(commentNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getMyStoryBoard();
            
         }
      };
      xmlhttp.open("post", "./deleteStoryCommentProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("st_comment_no=" + commentNo );
   }
   function deleteStoryProcess(storyNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getMyStoryBoard();
            
         }
      };
      xmlhttp.open("post", "./deleteStoryProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("story_no=" + storyNo);
   }
   
   function editGroupName(param, groupNo){
      
      //수정폼 초기화 한다는 전제하에 수정박스(newGroupNameBox)에 id주는것;;;
      var editFormCols = document.getElementsByClassName("editFormCol");
      for(a of editFormCols){
         a.innerHTML = "";
      }
      
      var editTextBoxRow = document.createElement("div");
      editTextBoxRow.setAttribute("class", "row");
      var editTextBoxColOne = document.createElement("div");
      editTextBoxColOne.setAttribute("class", "col-8 p-1 d-grid");
      var editTextBoxColTwo = document.createElement("div");
      editTextBoxColTwo.setAttribute("class", "col-4 d-grid p-1");
      
      var newGroupNameBox = document.createElement("input");
      newGroupNameBox.setAttribute("type", "text");
      newGroupNameBox.setAttribute("id", "newGroupNameBox");
      newGroupNameBox.setAttribute("style", "width:100%");
      newGroupNameBox.setAttribute("class", "fs-6");
      
      var editGroupNameSubmitButton = document.createElement("input");
      editGroupNameSubmitButton.setAttribute("type", "button");
      editGroupNameSubmitButton.setAttribute("class", "btn btn-primary p-0");
      editGroupNameSubmitButton.setAttribute("style", "height:20pt");
      editGroupNameSubmitButton.value = "수정";
      editGroupNameSubmitButton.setAttribute("onclick", "editGroupNameProcess("+groupNo+")")
      
      var h2TagBox = param.closest(".editFormParent");
      var editNewGroupNameBox = h2TagBox.getElementsByClassName("editFormCol");
      
      editNewGroupNameBox[0].appendChild(editTextBoxRow);
      editTextBoxRow.appendChild(editTextBoxColOne);
      editTextBoxRow.appendChild(editTextBoxColTwo);
      
      editTextBoxColOne.appendChild(newGroupNameBox);
      editTextBoxColTwo.appendChild(editGroupNameSubmitButton);
      
   }
   
   function editGroupNameProcess(groupNo){
      
      var newGroupNameBox = document.getElementById("newGroupNameBox");
      var newGroupName = newGroupNameBox.value;
         
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getMyGroupAndList();
         }
      };
      xmlhttp.open("post", "./editGroupNameProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("group_no=" + groupNo + "&group_name=" + newGroupName);
   }
   
   function deleteGroupProcess(groupNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getMyGroupAndList();
         }
      };
      xmlhttp.open("post", "./deleteGroupProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("group_no=" + groupNo);
   }
   
   var writeStoryModal = null;
   //스토리작성
   function writeModal(){
      //writeStoryModal.innerHTML="";
      
      document.getElementById('storyContent').value="";
      document.getElementById('storyImage').value="";
      
      writeStoryModal.show();
   }   
   function writeStory(){
      var storyContentBox = document.getElementById("storyContent");
      var storyContent = storyContentBox.value;
      

      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            //var data = JSON.parse(xmlhttp.responseText);
            
            writeStoryModal.hide();
            
            getMyStoryBoard();
         }
      };
      
      xmlhttp.open("post" , "./writeStoryProcess.do");
      //xmlhttp.setRequestHeader("Content-type","application/x-www.form-urlencoded");
      //xmlhttp.setRequestHeader("Content-type","multipart/form-data");
      
      var formData = new FormData();      
      var inputFileBox = document.getElementById("storyImage");
      
      formData.append("storyFile" , inputFileBox.files[0]);
      formData.append("story_content" , storyContent);
      
      xmlhttp.send(formData);
   }
   function getFollowsLikeLogs(){
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getOtherMemberStoryBoard();
            
         }
      };
      xmlhttp.open("post", "./deleteStoryCommentProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("st_comment_no=" + commentNo );
   }
   function getADImage(){
      
      var accordionOuterCol = document.getElementById("accordionOuterCol");
      var imageRow = document.createElement("div");
      imageRow.setAttribute("class", "row mt-3");
      
      accordionOuterCol.appendChild(imageRow);
            
      var imagTag = document.createElement("img");
      imagTag.setAttribute("src", "../resources/img/이너콜라겐.JPG");
      
      imageRow.appendChild(imagTag);
      
   }
   function getADImage2(){
      
      var rightMainCol = document.getElementById("rightMainCol");
      var imageRow = document.createElement("div");
      imageRow.setAttribute("class", "row mt-3");
      
      rightMainCol.appendChild(imageRow);
            
      var imagTag = document.createElement("img");
      imagTag.setAttribute("src", "../resources/img/조거팬츠.JPG");
      imagTag.setAttribute("class", "px-0");
      
      imageRow.appendChild(imagTag);
      
   }
   function getMyFollowsLikeLogsProcess(){
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data = JSON.parse(xmlhttp.responseText);
            
            var rightMainCol = document.getElementById("rightMainCol");            
            var rightLikeOuterRow = document.createElement("div");
            rightLikeOuterRow.setAttribute("class", "row mb-3");
            rightLikeOuterRow.setAttribute("style", "background-color:#F2F2F2");
            var rightLikeOuterCol = document.createElement("div");
            rightLikeOuterCol.setAttribute("class", "col py-2");
            
            rightMainCol.appendChild(rightLikeOuterRow);
            rightLikeOuterRow.appendChild(rightLikeOuterCol);
            
            var strongTag = document.createElement("strong");
            var likeLogTittleRow = document.createElement("div");
            likeLogTittleRow.setAttribute("class", "row mb-2");
            var likeLogTittleCol = document.createElement("div");
            likeLogTittleCol.setAttribute("class", "col-4 text-end pe-0");
            var likeLogTittleCol2 = document.createElement("div");
            likeLogTittleCol2.setAttribute("class", "col text-start ps-0");
            var tittleIcon = document.createElement("i");
            tittleIcon.setAttribute("class", "bi bi-justify-left pe-3");
            likeLogTittleCol.appendChild(tittleIcon);
            strongTag.innerText = "FollowsLikeLog";

            likeLogTittleCol.appendChild(tittleIcon);
            likeLogTittleCol2.appendChild(strongTag);
            likeLogTittleRow.appendChild(likeLogTittleCol);
            likeLogTittleRow.appendChild(likeLogTittleCol2);
            rightLikeOuterCol.appendChild(likeLogTittleRow);
            
            for(likeLogData of data.list){
               var innerRow = document.createElement("div");
               innerRow.setAttribute("class", "row my-1 text-center");
               var innerColOne = document.createElement("div");
               innerColOne.setAttribute("class", "col");
               
               var iconTag = document.createElement("i");
               iconTag.setAttribute("class", "bi bi-people-fill pe-3");
               
               innerColOne.appendChild(iconTag);
               innerColOne.innerText = likeLogData.mVo.member_nick + "  님이  " + likeLogData.writerMemberVo.member_nick + "의 스토리를";
               
               var thumbIcon = document.createElement("i");
               thumbIcon.setAttribute("class", "bi bi-hand-thumbs-up-fill ms-1");
               thumbIcon.setAttribute("style", "color:#F2B705");
               
               innerRow.appendChild(innerColOne);
               innerColOne.appendChild(thumbIcon);
               rightLikeOuterCol.appendChild(innerRow);
            }
            
         }
      };
      xmlhttp.open("post", "./getMyFollowsLikeLogsProcess.do", false);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   function getMyFollowsCommentLogsProcess(){
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data = JSON.parse(xmlhttp.responseText);
            
            var rightMainCol = document.getElementById("rightMainCol");            
            var rightCommentOuterRow = document.createElement("div");
            rightCommentOuterRow.setAttribute("class", "row mb-3");
            rightCommentOuterRow.setAttribute("style", "background-color:#F2F2F2");
            var rightCommentOuterCol = document.createElement("div");
            rightCommentOuterCol.setAttribute("class", "col py-2");
            
            rightMainCol.appendChild(rightCommentOuterRow);
            rightCommentOuterRow.appendChild(rightCommentOuterCol);
            
            var strongTag = document.createElement("strong");
            var CommentLogTittleRow = document.createElement("div");
            CommentLogTittleRow.setAttribute("class", "row mb-2");
            var CommentLogTittleCol = document.createElement("div");
            CommentLogTittleCol.setAttribute("class", "col-3 text-end pe-0");
            var CommentLogTittleCol2 = document.createElement("div");
            CommentLogTittleCol2.setAttribute("class", "col text-start ps-0");
            strongTag.innerText = "FollowsCommentLog";
            var tittleIcon = document.createElement("i");
            tittleIcon.setAttribute("class", "bi bi-justify-left pe-3");
            
            CommentLogTittleCol.appendChild(tittleIcon);
            CommentLogTittleCol2.appendChild(strongTag);
            CommentLogTittleRow.appendChild(CommentLogTittleCol);
            CommentLogTittleRow.appendChild(CommentLogTittleCol2);
            rightCommentOuterCol.appendChild(CommentLogTittleRow);
            
            for(CommentLogData of data.list){
               var innerRow = document.createElement("div");
               innerRow.setAttribute("class", "row my-1 text-center");
               var innerColOne = document.createElement("div");
               innerColOne.setAttribute("class", "col");
               
               var iconTag = document.createElement("i");
               iconTag.setAttribute("class", "bi bi-people-fill pe-3");
               
               innerColOne.appendChild(iconTag);
               innerColOne.innerText = CommentLogData.mVo.member_nick + "  님이" + CommentLogData.writerMemberVo.member_nick + "의 스토리에";
               
               var commentIcon = document.createElement("i");
               commentIcon.setAttribute("class", "bi bi-chat-left-fill ms-1");
               commentIcon.setAttribute("style", "color:#F2CB05");
               
               innerRow.appendChild(innerColOne);
               innerColOne.appendChild(commentIcon);
               rightCommentOuterCol.appendChild(innerRow);
            }
            
         }
      };
      xmlhttp.open("post", "./getMyFollowsCommentLogsProcess.do", false);
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   
   //페이지로드 후 실행
   window.addEventListener("DOMContentLoaded" , function(){
      getMyGroupAndList();
      getMyFollowerList();
      getMyStoryBoard();
      getADImage();
      getMyFollowsLikeLogsProcess();
      getMyFollowsCommentLogsProcess();
      getADImage2();
      writeStoryModal = new bootstrap.Modal(document.getElementById('writeStoryModal'))
   });
   
</script>


</head>
<body>
   <div style="width:1200px; margin:0 auto;">
   <jsp:include page="../common/global_nav_member.jsp"></jsp:include>
         <jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
      <div class="container">
         
         <div class="row mt-3"> <%--전체 row--%>            
            <div class="col-3 me-3" id="accordionOuterCol"><%-- 좌측영역 --%>
            </div>
            <div class="col" id="middleMainCol"><%--글쓰기부분 --%>                           
            </div>
            <div class="col-3 ms-3" id="rightMainCol"><%--우측 --%>
            </div>
         </div>                  
      </div>
   </div>
   
   

   <!-- Modal -->
   <div class="modal fade" id="writeStoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="writeStoryModalTitle">스토리 작성</h5>
           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <div class="row">
               <div class="col">
                  <textarea id="storyContent" style="width:100%"></textarea>   
               </div>
            </div>
              <div class="row mt-2">
                 <div class="col">
                    <input id="storyImage" type="file" accept="image/*">
                 </div>
              </div> 
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
           <button type="button" class="btn text-white" style="background-color:#F25C19" onclick="writeStory()">작성</button>
         </div>
       </div>
     </div>
   </div>
    <jsp:include page="../common/global_footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>