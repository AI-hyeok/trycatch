<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>ComList</title>
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


        .mainBoard{
            
        }

        .header, .writeBtn, .pageNavi{
            width:100%;
            height:8%;
        }
        .header>div{
            float:left;
            width:50%;
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
        <div class="title">커뮤니티</div>
        <hr>
        <div class="contents">
            <div class="sideList">
            	<ul>
	                <li class="mainBoard">자유게시판</li>
	                <li class="qnaBoard">Q&A 게시판</li>
               </ul>
               <div class="writeBtn"><a href="/write.comboard"><button type="button">게시물 작성하기</button></a></div>
            </div>
            
            <div class="mainContents">
                <div class="header">
                    <div class="boardName">자유게시판</div>
                    <form action="/searchBoard.comboard" method="post">
                    	<div class="searchBox"><input name="inputSearch" id="inputSearch" type="text" placeholder="검색어를 입력해주세요"><button id="searchBtn">검색</button></div>
                	</form>
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
                        <c:forEach var="i" items="${notice}">
							<tr>
								<td>공지</td>
								<td>
									<a href="/detail.comboard?c_seq=${i.c_seq}">${i.title}</a>
								</td>
								<td>${i.m_id}</td>
								<td>${i.write_date}</td>
								<td>${i.view_count}</td>
							</tr>
						</c:forEach>
                        <c:forEach var="i" items="${list}">
							<tr id="tdcontainer">
								<td>${i.c_seq}</td>
								<td>
									<a href="/detail.comboard?c_seq=${i.c_seq}" id='postTitle'>${i.title}</a>
								</td>
								<td>${i.m_nickname}</td>
								<td>${i.write_date}</td>
								<td>${i.view_count}</td>
							</tr>
						</c:forEach>
                    </table>
                    
                </div>
                <c:choose>
                <c:when test="${not empty sessionScope.loginID}" >
                <div class="writeBtn">
                    <a href="/write.comboard"><button type="button">게시물 작성하기</button></a>
                </div>
                </c:when>
               <c:otherwise>
                <div class="writeBtn">
                   <button id="writeBtn" type="button">게시물 작성하기</button>
                    <script>
                    $("#writeBtn").on("click", function(){
                       alert("로그인이 필요합니다.");
                       
                    })
                    </script>
                </div>
                </c:otherwise>
                </c:choose>
                <div class="pageNavi">
                    <c:if test="${needPrev}">
						<span class="paging" page="${startNavi-1}">< </span>
					</c:if>
					<c:forEach var="i" begin="${startNavi}" end="${endNavi}">
						<span class="paging" page="${i}">${i}&nbsp</span>
					</c:forEach>
					<c:if test="${needNext}">
						<span class="paging" page="${endNavi+1}">&nbsp></span>
					</c:if>
                </div>
                <script>
					$(".paging").on("click", function(){
						let pageNum = $(this).attr("page");
						sessionStorage.setItem("last_cpage", pageNum);
						location.href="/list.comboard?cpage="+pageNum;
					})
					
					$("#postTitle").on("click", function(){
						location.href="/detail.comboard?cpage="+pageNum;
					})
				</script>
            </div>
            
            
        </div>
    </div>
</body>
</html>