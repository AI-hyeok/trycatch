<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 검색 결과</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
/>
<style>
  *{box-sizing: border-box;}

  div{
      border:1px solid black;
  }

  .container{
      width:100%;
      margin:auto;
  }

  .navi{
      width:100%;
      height:50px;
      margin-bottom:50px;
  }
  .navi>div{
      float:left;
      width:20%;
      height:50px;
  }

  .title{
      width:100%;
      height:80px;
      font-size:35px;
      padding-left: 30px;
      padding-top: 30px;
  }

  .contents{
      width:100%;
      height:700px;
  }

  .sideList{
      float:left;
      width:25%;
      margin:10px;
      height:300px;
  }

  .mainContents{
      float:left;
      width:70%;
      height:98%;
      margin:10px;
  }

  .header, .writeBtn, .pageNavi{
      width:100%;
      height:8%;
  }
  .header>div{
      float:left;
      width:33.33%;
      height:100%;
  }
  .boardList{
      width:100%;
      height:76%;
  }
  .pageNavi{
      display:flex;
      justify-content:center;
      align-items:center;
  }
  .pageNavi>div{
      height:100%;
  }

  .boardName{
      display:flex;
      justify-content:left;
      align-items:baseline;
  }
  .searchBox{
      display:flex;
      justify-content:right;
      align-items:center;
  }

  table{
      width:100%;
  }
  td{
      text-align:center;
      vertical-align:middle;
      height:50px;
  }

  #inputSearch, #searchBtn{
      height:80%;
  }
  .paging {
   border: 1px solid black;
   cursor: pointer;
   display: inline-block;
   width: 20px;
   height: 25px;
}
</style>
</head>
<body>
<div class="container">
        <div class="navi">
            <div>TryCatch</div>
            <div>마이페이지</div>
            <div>전체 랭킹</div>
            <div>커뮤니티</div>
            <div>Q&A</div>
        </div>
        <div class="title">검색 결과</div>
        <hr>
        <div class="contents">
            <div class="sideList">
                <div class="mainBoard">자유게시판</div>
                <div class="qnaBoard">Q&A 게시판</div>
                <div class="writeBtn"><button>게시물 작성하기</button></div>
            </div>
            <div class="mainContents">
                <div class="header">
                    <div class="boardName">자유게시판</div>
                    <div>
                  <button id="backToListBtn" type="button">목록으로 돌아가기</button>
                  <script>
                  $("#backToListBtn").on("click", function(){
                     let last_cpage = sessionStorage.getItem("last_cpage");
                     if(last_cpage == null){
                        last_cpage = 1;
                     }
                     location.href="/list.comboard?cpage="+last_cpage; 
                  })
               </script>
               </div>
                    <div class="searchBox">
                        <form action="/searchBoard.comboard">
                            <input id="inputSearch" type="text" name="inputSearch" placeholder="검색어를 입력해주세요">
                            <button id="searchBtn" type="submit">검색</button>
                        </form>
                    </div>
                </div>
                <div class="boardList">
                    <table>
                        <colgroup>
                            <col style="width: 10%;">
                            <col style="width: 40%;">
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>

                      
                        <c:if test="${not empty resultList}">
                            <c:forEach var="i" items="${resultList}">
                                <tr>
                                    <td>${i.c_seq}</td>
                                    <td><a href="/detail.comboard?c_seq=${i.c_seq}">${i.title}</a></td>
                                    <td>${i.m_nickname}</td>
                                    <td>${i.write_date}</td>
                                    <td>${i.view_count}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty resultList}">
                            <tr>
                                <td colspan="5">검색 결과가 없습니다.</td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <div class="writeBtn">
                   <a href="/write.comboard"><button>게시물 작성하기</button></a>
                </div>
                 <div class="pageNavi">
                    <div>
                    <c:if test="${needPrev}">
                     <span class="paging" page="${stratNavi-1}" search="${search}"><</span>
                  </c:if>
                  <c:forEach var="i" begin="${startNavi}" end="${endNavi}">
                     <span class="paging" page="${i}" search="${search}">${i} </span>
                  </c:forEach>
                  <c:if test="${needNext}">
                     <span class="paging" page="${endNavi+1}" search="${search}">></span>
                  </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
   $(".paging").on("click",function(){
      let pageNum = $(this).attr("page");
      let search = $("#inputSearch").val(); 
       sessionStorage.setItem("last_cpage",pageNum);
       location.href = "/search.qnaboard?search=" + search + "&cpage=" + pageNum;
   })
   </script>
</body>
</html>
