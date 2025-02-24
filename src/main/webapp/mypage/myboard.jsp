<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
   integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
   crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<style>
.head {
   height: 60px;
   display: flex;
   align-items: center;
   font-size: 35px;
   font-weight: bold;
   padding-left: 20px;
}

.titlemypage {
   font-size: 18px;
   height: 60px;
   display: flex;
   align-items: end;
   padding-bottom: 20px;
   margin-left: 15px;
}

.trycatch {
   cursor: pointer;
}

.second {
   display: flex;
}

.first {
   margin-top: 100px;
   display: flex;
   height: 800px;
   border: none;
}

.list {
   width: 300px;
   background-color: #d9d9d9;
   border-top-left-radius: 20px;
   border-top-right-radius: 20px;
}

li {
   list-style: none;
   display: flex;
   align-items: center;
   justify-content: center;
   height: 40px;
   cursor: pointer;
   font-size: 18px;
   font-weight: bold;
}

.instruct {
   width: auto;
   height: 30px;
   margin-left: 12%;
   margin-top: 70px;
   font-size: 18px;
   font-weight: bold;
}

.freeTitle {
   width: auto;
   margin-top: 30px;
   display: flex;
   justify-content: center;
   font-size: 25px;
   font-weight: bold;
}

table {
   display: flex;
   justify-content: center;
}

.qnaTitle {
   height: 60px;
   font-size: 23px;
   display: flex;
   justify-content: center;
   align-items: center;
   margin-left: 300px;
}

tr {
   display: flex;
   width: 1000px;
   height: 60px;
}

th {
   height: 60px;
   font-size: 23px;
   display: flex;
   justify-content: center;
   align-items: center;
}

td {
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 20px;
   font-weight: bold;
}

.num {
   width: 10%;
}

.title {
   width: 50%;
}

.writer {
   width: 20%;
}

.date {
   width: 20%;
   text-align: center;
}

.view {
   width: 10%;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <div class="container">
      <div class="head">
         <p class="trycatch">Try Catch</p>
         <p class="titlemypage">내 게시물 보기</p>
      </div>
      <div class="second">
         <div class="left">
            <div class="first">
               <div class="list">
                  <li class="myupdate">개인정보 수정</li>
                  <hr>
                  <li class="myrank">내 랭킹 보기</li>
                  <hr>
                  <li class="myboard">내 게시물 보기</li>
                  <hr>
                  <li class="out">회원탈퇴</li>
                  <hr>
               </div>
            </div>

         </div>

         <div class="right">

            <div class="instruct">내 게시물</div>

            <div class="freeTitle">자유 게시판</div>
            <hr style="width: 80%">



            <div class="freeBoard">
               <table>
                  <tr>
                     <th class="num">글번호</th>
                     <th class="title">제목</th>
                     <th class="date">작성일</th>
                     <th class="view">조회</th>

                  </tr>
               </table>
               <c:forEach var="comlist" items="${comlist}">
                  <hr style="width: 80%">
                  <table>
                     <tr>
                        <td class="num">${comlist.c_seq}</td>
                        <td class="title">${comlist.title}</td>
                        <td class="date">${comlist.write_date}</td>
                        <td class="view">${comlist.view_count}</td>

                     </tr>
                  </table>
               </c:forEach>

            </div>

            <div class="qnaBoard">
               <table class="qnaTitle">
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <th class="qnaTitle">Q&A 게시판</th>
               </table>
               <hr style="width: 80%">

               <table>

                  <tr>
                     <th class="num">글번호</th>
                     <th class="title">제목</th>
                     <th class="date">등록일</th>

                  </tr>
               </table>
               <c:forEach var="qnalist" items="${qnalist}">
                  <hr style="width: 80%">

                  <table>
                     <tr>
                        <td class="num">${qnalist.q_seq}</td>
                        <td class="title">${qnalist.title}</td>
                        <td class="date">${qnalist.write_date}</td>

                     </tr>
                  </table>
               </c:forEach>
               <br>
            </div>
         </div>


      </div>

      <script>
         $(".trycatch").on("click", function() {
            window.location.href = "/index.jsp";
         })//index로가기

         $(".myupdate").on("click", function() {
            window.location.href = "/myupdate.mypages";
         })//개인정보수정

         $(".myrank").on("click", function() {
            window.location.href = "/myrank.mypages";
         })//내 랭킹보기

         $(".myboard").on("click", function() {
            window.location.href = "/myboard.mypages";
         })//내 게시물 보기

         $(".out").on("click", function() {
            window.location.href = "/members/out.jsp";
         })//내 게시물 보기
      </script>
</body>
</html>