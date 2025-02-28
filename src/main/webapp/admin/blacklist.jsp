<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <title>Document</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; }
        .list li {
        cursor: pointer;
        text-align: center;
        padding: 10px 0;
        font-weight: bold;
        font-size: 20px;
    }
    .list li:hover{
            font-size: 25px;
        }

    .naviva div {
        cursor: pointer;
        font-weight: bold;
        font-size: 20px;
    }
	.trycatch{
		cursor:pointer;
	}
        th, td{ border: 1px solid black; padding: 10px; text-align: center; }
        th{ height: 50px; }
        td{ height: 40px; }
        
         span{
       	font-weight: bold;
       	color:white;
       }
       .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
        }
        .listbox{
        	opacity:0.9;
        }
    	.main{
    		opacity:0.9;
    		background-color:white;
    		margin-left:1rem;
    	}
    	.headerLogoImg{
	width: 200px;
    height: auto;
}
    </style>
</head>
<body>
<img src="admin/images/BGI.jpg" class="background-img">
    <div class="container">
        <header class="d-flex align-items-center p-3">
            <h1 class="h1 flex-grow-1 trycatch "><img class="headerLogoImg" src="admin/images/LogoW.png"></h1>
            <span class="fs-4">블랙리스트</span>
        </header>

        <nav class="naviva d-flex justify-content-around bg-dark text-white p-3">
            <div class="mypage">관리자페이지</div>
            <div class="whole_ranking">전체 랭킹</div>
            <div class="community">커뮤니티</div>
            <div class="QandA">Q&A</div>
        </nav>

         <div class="row mt-4">
            <aside class="col-md-3 list bg-light p-3 rounded listbox">
                <ul class="list-unstyled">
					<li class="members">회원 관리</li>
					<hr>
					<li class="blacklist">블랙리스트</li>
					<hr>
					<li class="dashboard">대시보드</li>
					<hr>
				</ul>
			</aside>

            <main class="p-4 col-md-8 rounded main">
                <h3>블랙리스트</h3>
                <hr>
            <table>
                <tr>
                    <th>회원ID</th>
                    <th>회원명</th>
                    <th>회원닉네임</th>
                    <th>회원이메일</th>
                    <th>관리</th>
                </tr>
                <c:forEach var="i" items="${list}">
                    <tr>
                        <td>${i.m_id}</td>
                        <td>${i.name}</td>
                        <td>${i.nickname}</td>
                        <td>${i.email}</td>
                        <td>
                            <button class="btn btn-secondary" onclick="cancelBlack('${i.m_id}')">취소</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
             <hr>
            </main>
         </div>   
        </div>
    <script>
    $(".trycatch").on("click", function () {
        window.location.href = "/index.jsp";
    })//index로가기
    
         $(".mypage").on("click",function(){
      window.location.href="/mypage.mypages";
   })//마이페이지로가기
   
   $(".whole_ranking").on("click",function(){
      window.location.href="/ranklist.games";
   })//전체랭킹가기
   
   $(".community").on("click",function(){
      window.location.href="/list.comboard";
   })//자유게시판가기
   
   $(".QandA").on("click",function(){
      window.location.href="/qnalist.qnaboard";
   })//qna게시판가기   


   $(".members").on("click",function(){
        location.href="/list.admins";
   })//회원관리
   $(".blacklist").on("click",function(){
        location.href="/blacklist.admins";
   })//블랙리스트
   $(".dashboard").on("click",function(){
        location. href="/dashboard.admins";
   })//대시보드

   
		function cancelBlack(id){
			 location.href = "/blackcancel.admins?m_id="+ id;
		}
    </script>
</body>
</html>
