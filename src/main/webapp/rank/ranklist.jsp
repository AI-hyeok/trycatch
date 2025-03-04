<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 랭킹</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
         .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
        }
        .background-img:hover{
            cursor:pointer;
        }
        .container {
			margin: auto;
			display: flex;
			justify-content: center;
			align-items: center;
		}
        
		.id_login_box {
			width: 100%;
			height:50%;
			margin:0px;
		}
		.headerLogoImg{
			width: 200px;
		    height: auto;
		}
	
		.id_login_button {
			width: 130%;
			display: flex;
			align-items: center;
			justify-content: center;
			border-radius: 10px 10px 0px 0px;
			flex-direction: row;  /* 수평 배치 */
		  	gap: 0px;
		}

		#loginBox{
			width:100%;
			height:30%;
			margin:0px;
			padding:20px;
		}

		#loginBox>div{
			flex: 1; /* 각 div 요소의 크기를 동일하게 설정 */
			text-align: center;
			font-size: 20px;
			color:white;
		}

		n{
			position: relative;
			display: flex;
			padding: 90px;
			margin: 40px 0;
			color: #6a00ff;
			text-decoration: none;
			text-transform: uppercase;
			transition: 0.5s;
			letter-spacing: 4px;
			overflow: hidden;
			margin-right: 50px;
			font-size: 40px;
			font-weight: bold;
			margin-top: 70px;
		}

		#loginBox>div:hover {
			background: #fff700;
			color: #2d2736;
			box-shadow: 0 0 5px #fff700, 0 0 25px #fff700, 0 0 50px #fff700, 0 0
				200px #6a00ff;
			-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
		}
		
		n:nth-child(1) {
			filter: hue-rotate(270deg);
		}
		
		n:nth-child(2) {
			filter: hue-rotate(110deg);
		}
		
		n span {
			position: absolute;
			display: block;
		}
		
		n span:nth-child(1) {
			top: 0;
			left: 0;
			width: 100%;
			height: 2px;
			background: linear-gradient(90deg, transparent,#fff700);
			animation: animate1 1s linear infinite;
		}
		
		@keyframes animate1{
		    0%{
		        left: -100%;
		    }
		    50%,100%{
		        left: 100%;
		    }
		}
		n span:nth-child(2) {
			top: -100%;
			right: 0;
			width: 2px;
			height: 100%;
			background: linear-gradient(180deg, transparent, #fff700);
			animation: animate2 1s linear infinite;
			animation-delay: 0.25s;
		}
		
		@keyframes animate2{
		    0%{
		        top: -100%;
		    }
		    50%,100%{
		        top: 100%;
		    }
		}
		n span:nth-child(3) {
			bottom: 0;
			right: 0;
			width: 100%;
			height: 2px;
			background: linear-gradient(270deg, transparent, #fff700);
			animation: animate3 1s linear infinite;
			animation-delay: 0.50s;
		}
		
		@keyframes animate3{
		    0%{
		        right: -100%;
		    }
		    50%,100%{
		        right: 100%;
		    }
		}
		n span:nth-child(4) {
			bottom: -100%;
			left: 0;
			width: 2px;
			height: 100%;
			background: linear-gradient(360deg, transparent, #fff700);
			animation: animate4 1s linear infinite;
			animation-delay: 0.75s;
		}
		
		@keyframes animate4{
		    0%{
		        bottom: -100%;
		    }
		    50%,100%{
		        bottom: 100%;
		    }
		}
        
        .title { font-size: 30px; font-weight: bold; flex: 1; text-align: end; padding-right: 10px; }
        .mypage { flex: 1; text-align: start; font-size: 18px; }
        .naviva { flex: 3; display: flex; justify-content: space-around; font-size: 20px; }
        
        /* 제목 */
        .wholerank_letter { 
            font-size: 30px; 
            font-weight: bold; 
            text-align: center; 
            margin: 30px 0; 
            border-bottom: 5px solid white; 
            padding-bottom: 10px; 
            color: #000000;
        }
        
        /* 랭킹 테이블 */
        .ranking_table_box { 
            width: 95%; 
            margin: auto; 
            display: flex; 
            flex-wrap: wrap; 
            justify-content: center; 
        }
        .ranking_table { 
	        width: 45%; 
	        margin: 20px; 
        }
        
        .game_name_box { 
        	color:#FFFFFF;
	        font-size: 25px; 
	        font-weight: bold; 
	        text-align: center; 
	        margin-bottom: 10px; 
        }
        
        table { 
	        width: 100%; 
	        border-collapse: collapse; 
        }
        
        tr {
        	background-color: rgba(255,255,255,0.861);
        }
        
        th, td {
        	color:black;
	        padding: 10px; 
	        border: 3px solid white; 
	        text-align: center; 
        }
        
        th {
        	color:black;
        	background: #4a46c864; 
        }
        
        .footer {
            margin-top: 100px;
            height: 300px;
        }

        .footer>div {
            border: none;
        }

        .logoImg {
            width: 150px;
    		height: auto;
        }

       .footerTexts {
           border: none;
           color: lightgray;
           padding-bottom: 0px;
           padding-top: 30px;
           line-height: 18px;
          margin-bottom:30px;
       }
    </style>
</head>
<body>
	<img class="background-img" src="/image/BGI.jpg">
    <div class="row container">
	<header class="d-flex align-items-center p-3">
            <h1 class="h1 flex-grow-1 trycatch ">
            <img class="headerLogoImg" src="/image/LogoW.png">
            </h1>

        </header>

		 <div class="id_login_button">
			<n id="loginBox"> 
				<span></span> 
				<span></span> 
				<span></span> 
				<span></span>
				<c:choose>
				<c:when test="${loginID != null}">
				<div class="mypage" id="mypage">마이페이지</div>
				</c:when>
				<c:when test="${loginID == null}">
				<div class="mypage" id="nullmypage">마이페이지</div>
				</c:when>
				</c:choose>
	            <div class="whole_ranking">전체 랭킹</div>
	            <div class="community">커뮤니티</div>
	            <div class="QandA">Q&A</div>
			</n>
		</div>
        

        <div class="wholerank_letter">전체 랭킹</div>

        <div class="ranking_table_box">
            <c:forEach var="entry" items="${groupedRanks}">
                <div class="ranking_table">
                    <div class="game_name_box">${entry.key}</div>
                    <table>
                        <thead>
                            <tr>
                                <th>Rank</th>
                                <th>Nickname</th>
                                <th>Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rank" items="${entry.value}" begin="0" end="9">
                                <tr>
                                    <td>${rank.rank}</td>
                                    <td>${rank.nickname}</td>
                                    <td>${rank.score}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:forEach>
        </div>
        		<div class="row footer">
			<div class="col-12 footerContents">
				<div class="col-12 footerTexts">
					이메일:trycatch@gmail.com|채팅 : 카카오톡 채널(아이디 트라이캐치)<br> <br>충청남도
					천안시 서북구 두정중10길|전화번호 : 1633-122001<br> <br>© Try catch
					Korea Corporation All Rights Reserved.
				</div>
				<div class="col-12 logoText">
				<img class="logoImg" src="/image/LogoW.png"> 
				</div>
			</div>
		</div>
    </div>
    
    <script>
    $(".trycatch").on("click",function(){
		window.location.href="/index.jsp";
	})//index로가기	
	//네비바
	$("#mypage").on("click",function(){
		window.location.href="/mypage.mypages";
	})//마이페이지로가기
	$("#nullmypage").on("click",function(){
		alert("로그인을 해주세요.");
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
    </script>
</body>
</html>
