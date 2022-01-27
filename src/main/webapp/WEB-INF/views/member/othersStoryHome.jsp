<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>

<script>
   //함께아는친구@@!@
   function getCommonFollowersList(){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data = JSON.parse(xmlhttp.responseText);
         
            var rightOuterCol = document.getElementById("rightOuterCol");
            
            var commonFollowMainRow = document.createElement("div");
            commonFollowMainRow.setAttribute("class", "row rounded pb-2");
            commonFollowMainRow.setAttribute("style", "background-color:#F2F2F2");
            var commonFollowMainCol = document.createElement("div");
            commonFollowMainCol.setAttribute("class", "col");
            
            rightOuterCol.appendChild(commonFollowMainRow);
            commonFollowMainRow.appendChild(commonFollowMainCol);
            
            var tittleRow = document.createElement("div");
            tittleRow.setAttribute("class", "row my-2 text-center");
            var strongTag = document.createElement("strong");
            var tittleCol = document.createElement("div");
            tittleCol.setAttribute("class", "col");
            tittleCol.innerText = "함께아는친구";
            
            commonFollowMainCol.appendChild(tittleRow);
            tittleRow.appendChild(strongTag);
            strongTag.appendChild(tittleCol);
            
                        
            for(commonFollow of data.list){
               var nickRow = document.createElement("div");
               nickRow.setAttribute("class", "row my-1");
               
               var nickCol = document.createElement("div");
               nickCol.setAttribute("class", "col text-center");
               var buttonCol = document.createElement("div");
               buttonCol.setAttribute("class", "col-5");
               var sendMessageButton = document.createElement("span");
               sendMessageButton.setAttribute("class", "fx-6 ms-3 badge rounded-pill");
               sendMessageButton.setAttribute("style", "background-color:#F2B705");
               //sendMessageButton.innerText = "쪽지";
               buttonCol.appendChild(sendMessageButton);
               var aTag = document.createElement("a");
               aTag.setAttribute("href", "../member/answerMessagePage.do?receive_no=" + commonFollow.mVo.member_no);
               aTag.setAttribute("class", "text-white");
               aTag.innerText = "쪽지";
               sendMessageButton.appendChild(aTag);
               
               var iconTag = document.createElement("i");
               iconTag.setAttribute("class", "bi bi-people-fill pe-3");
               nickCol.appendChild(iconTag);            
               
               var nickLink = document.createElement("a");
               nickLink.setAttribute("href", "../member/othersStoryPage.do?member_no=" + commonFollow.mVo.member_no);
               nickLink.innerText = commonFollow.mVo.member_nick;
               
               nickRow.appendChild(nickCol);
               nickRow.appendChild(buttonCol);
               nickCol.appendChild(nickLink);
               commonFollowMainCol.appendChild(nickRow);
            }
            
         }
      };

      xmlhttp.open("post", "./getCommonFollowersProcess.do", false);
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("follow_member_no=" + "${member_no}");   
   }


   //좋아요 많이 받으신분~!
   function getMostLikesStoryWriters(){
      
      var dds = document.getElementsByClassName("dd");
      for(a of dds){
         a.innerHTML = "";
      }
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            var data = JSON.parse(xmlhttp.responseText);
            
            var leftOuterCol = document.getElementById("leftOuterCol");
            
            var listGroupRow = document.createElement("div");
            listGroupRow.setAttribute("class", "row dd");
            leftOuterCol.appendChild(listGroupRow);
            var listGroupCol = document.createElement("div");
            listGroupCol.setAttribute("class", "col");
            listGroupRow.appendChild(listGroupCol);
            
            
            var listGroup = document.createElement("div");
            listGroup.setAttribute("class", "list-group pb-2");            
            listGroup.setAttribute("style", "background-color:#F2F2F2");            
            listGroupCol.appendChild(listGroup);
            
            var listTittleRow = document.createElement("div");
            listTittleRow.setAttribute("class", "row text-center my-2");
            var strongTag = document.createElement("strong");
            var listTittleNickCol = document.createElement("div");
            listTittleNickCol.setAttribute("class", "col");
            listTittleNickCol.innerText = "Lising Stars"
            
            listGroup.appendChild(listTittleRow);
            listTittleRow.appendChild(strongTag);
            strongTag.appendChild(listTittleNickCol);
            
                     
            for(mostLikeStory of data.list){
               
               var listGroupItem = document.createElement("div");
               listGroupItem.setAttribute("class", "row my-1");
               
               var memberNickCol = document.createElement("div");
               memberNickCol.setAttribute("class", "col ms-3 text-center");            
               var countLikesCol = document.createElement("div");
               countLikesCol.setAttribute("class", "col-5");
               
               var countLikesRow = document.createElement("div");
               countLikesRow.setAttribute("class", "row");
               countLikesCol.appendChild(countLikesRow);
               var countLikesIconCol = document.createElement("div");
               countLikesIconCol.setAttribute("class", "col-1");
               var countLikesNumberCol = document.createElement("div");
               countLikesNumberCol.setAttribute("class", "col");
               countLikesNumberCol.innerText = mostLikeStory.rowVo.like_cnt;
               countLikesRow.appendChild(countLikesIconCol);
               countLikesRow.appendChild(countLikesNumberCol);
                              
               var memberStarIcon = document.createElement("i");
               memberStarIcon.setAttribute("class", "bi bi-star-fill me-2");
               memberStarIcon.setAttribute("style", "color:#F2CB05");
               memberNickCol.appendChild(memberStarIcon);
               
               var likesIcon = document.createElement("i");
               likesIcon.setAttribute("class", "bi bi-hand-thumbs-up-fill me-2");
               likesIcon.setAttribute("style", "color:#DB3607");
               countLikesIconCol.appendChild(likesIcon);
               
               var memberLinkTag = document.createElement("a");
               memberLinkTag.setAttribute("href", "../member/othersStoryPage.do?member_no=" + mostLikeStory.sVo.member_no);
               memberLinkTag.innerText = mostLikeStory.mVo.member_nick;
               
               listGroup.appendChild(listGroupItem);
               listGroupItem.appendChild(memberNickCol);
               memberNickCol.appendChild(memberLinkTag);
               listGroupItem.appendChild(countLikesCol);
               
            }                        
         }
      };
      
      xmlhttp.open("post", "./getMostLikesStories.do", false);
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send();
   }
   function getADImage(){
      var leftOuterCol = document.getElementById("leftOuterCol");
      var imageRow = document.createElement("div");
      imageRow.setAttribute("class", "row mt-3");
      
      leftOuterCol.appendChild(imageRow);
            
      var imagTag = document.createElement("img");
      imagTag.setAttribute("src", "../resources/img/압박스타킹.JPG");
      
      imageRow.appendChild(imagTag);
   }


   function getOtherMemberStoryBoard(){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function() {
         if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = JSON.parse(xmlhttp.responseText);
            
            var middleOuterCol = document.getElementById("middleOuterCol");
            middleOuterCol.innerHTML="";            
            
            var nameTagOuterRow = document.createElement("div");
            nameTagOuterRow.setAttribute("class", "row mb-2 mx-1 rounded");
            nameTagOuterRow.setAttribute("style", "background-color:#F25C19");
            
            var nameTagColOne = document.createElement("div");
            nameTagColOne.setAttribute("class", "col-1 py-3");
            
            var nameTagIcon = document.createElement("i");
            nameTagIcon.setAttribute("class", "bi bi-person-circle text-light");
            
            var nameTagColTwo = document.createElement("div");
            nameTagColTwo.setAttribute("class", "col text-light pt-3 ps-0");
            
            nameTagColTwo.innerText = "${mVo.member_nick}" + "님의 페이지";
            
            middleOuterCol.appendChild(nameTagOuterRow);
            nameTagOuterRow.appendChild(nameTagColOne);
            nameTagColOne.appendChild(nameTagIcon);
            nameTagOuterRow.appendChild(nameTagColTwo);   
            
            for(storyData of data.list){
               
               var storyCardMainRow = document.createElement("div");
               storyCardMainRow.setAttribute("class", "row mb-3");
               
               middleOuterCol.appendChild(storyCardMainRow);
               
               var storyCardCol = document.createElement("div");
               storyCardCol.setAttribute("class", "col writeCommentBoxParent pt-2 px-4 border border-secondary rounded");
               
               storyCardMainRow.appendChild(storyCardCol);
               
               var storyCardWriterRow = document.createElement("div");
               storyCardWriterRow.setAttribute("class", "row");
               
               storyCardCol.appendChild(storyCardWriterRow);
               
               var storyCardWriterNickCol = document.createElement("div");
               storyCardWriterNickCol.setAttribute("class", "col pt-2 px-0");
               
               if("${memberUser.member_no}" == storyData.sVo.member_no || "${mVo.member_no}" == storyData.sVo.member_no){
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
               
               if(storyData.followState != null){
                  checkFillIcon.setAttribute("class", "bi bi-person-plus-fill me-2 ms-1");
            
                  var addFollowIntoBasicGroupButton = document.createElement("span");
                  addFollowIntoBasicGroupButton.setAttribute("class", "fx-6 ms-3 badge rounded-pill");
                  addFollowIntoBasicGroupButton.setAttribute("style", "background-color:#F2B705");
                  addFollowIntoBasicGroupButton.setAttribute("onclick","addFollowInBasicGroup("+storyData.mVo.member_no+")");
                  addFollowIntoBasicGroupButton.innerText = "팔로우";
                  if("${memberUser.member_no}" == storyData.sVo.member_no || "${mVo.member_no}" == storyData.sVo.member_no){
                     if(${memberUser.member_no} != storyData.sVo.member_no){
                        storyCardWriterNickCol.appendChild(addFollowIntoBasicGroupButton);   
                     }                     
                     
                  }else{
                     storyCardWriterNickLinkCol.appendChild(addFollowIntoBasicGroupButton);
                  }
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
   
      xmlhttp.open("post", "./getOthersStoryBoard.do");
      xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
      xmlhttp.send("member_no=${mVo.member_no}");
   }
   //기본그룹에 팔로우추가
   function addFollowInBasicGroup(memberNo){

      var xmlhttp = new XMLHttpRequest();
            
         xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState==4 && xmlhttp.status==200){
               getOtherMemberStoryBoard();
            }
         };

         xmlhttp.open("post", "./addFollowInBasicGroup.do");
         xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
         xmlhttp.send("follow_member_no=" + memberNo);   
   }
   
   //스토리좋아요
   function storyLike(e, story_no){
      
      var xmlhttp = new XMLHttpRequest();
            
         xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState==4 && xmlhttp.status==200){
               getOtherMemberStoryBoard();
               getMostLikesStoryWriters();
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
      insertCommentButton.setAttribute("class", "btn btn-secondary")
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
            getOtherMemberStoryBoard();
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
               commentListOuterRow.setAttribute("class", "row border-bottom pb-2");
               
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
   function getADImage2(){
      var rightOuterCol = document.getElementById("rightOuterCol");
      var imageRow = document.createElement("div");
      imageRow.setAttribute("class", "row mt-3");
      
      rightOuterCol.appendChild(imageRow);
            
      var imagTag = document.createElement("img");
      imagTag.setAttribute("src", "../resources/img/다이어트보조제.JPG");
      imagTag.setAttribute("class", "p-0");
      
      imageRow.appendChild(imagTag);
   }
   
   
   function deleteCommentProcess(commentNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getOtherMemberStoryBoard();
            
         }
      };
      xmlhttp.open("post", "./deleteStoryCommentProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("st_comment_no=" + commentNo);
   }
   function deleteStoryProcess(storyNo){
      
      var xmlhttp = new XMLHttpRequest();
      
      xmlhttp.onreadystatechange = function(){
         if(xmlhttp.readyState==4 && xmlhttp.status==200){
            getOtherMemberStoryBoard();
            
         }
      };
      xmlhttp.open("post", "./deleteStoryProcess.do");
      xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xmlhttp.send("story_no=" + storyNo);
   }

   window.addEventListener("DOMContentLoaded" , function(){
      getOtherMemberStoryBoard();
      getMostLikesStoryWriters();
      getADImage();      
      getCommonFollowersList();
      getADImage2();
   });
   

</script>

<body>

   <div style="width:1200px; margin: 0 auto;">
   		<jsp:include page="../common/global_nav_member.jsp"></jsp:include>
         <jsp:include page="../common/global_sidebar_member.jsp"></jsp:include>
      <div class="container">
         
         <div class="row mt-3"> <%--전체 row--%>            
            <div class="col-3 me-3" id="leftOuterCol"><%-- 좌측영역 --%>
               
            </div>
            <div class="col" id="middleOuterCol"><%--가운데영역 --%>
                                                
            </div>
            <div class="col-3 ms-3" id="rightOuterCol"><%--우측영역 --%>
               
            </div>
         </div>                  
         
      </div>
   </div>
 <jsp:include page="../common/global_footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>