<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Index</title>
    <style>
 
        .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -1;

        }
        
           * {
            box-sizing: border-box;
        }
        
        .row,
        .row>* {
            padding: 0px;
            margin: 0px;
        }

        .container {
            padding: 0px;
            border: 1px solid black;
            margin: auto;
        }

        .header {
            min-height: 100px;
            background-color: rgba(255, 255, 255, 0);
            margin-bottom:2rem;
        }

        .header>div {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            color: white;
        }

       #guest:hover,#mypageNavi:hover,#adminNavi:hover,#ranklist:hover,#comboardNavi:hover,#qnaboardNavi:hover {
	
            padding:0px;
     
			}

        .game_image {
            height: 800px;
        }

        #imageContainer {
        	margin:auto;
            background-color: rgba(255, 255, 255, 0.671);
            width: 80%;
            height:80%;
		}
		

        .mainContents>div {
            float: left;
            border: none;
        }

        .mainContents {
            margin-bottom: 200px;
            border: none;
            background-color: rgba(255, 255, 255, 0);
        }

        .title {
            height: 35px;
            font-size: 25px;
            padding-left: 20px;
            border: none;
        }

        .game {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
            /* 오버플로우되는 부분은 숨김 */
            border-radius: 5px;
        }

        .game>img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* 이미지 비율 유지  */
            transition: opacity 0.3s ease;
            /* 이미지 투명도 변화 부드럽게  */
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(135, 207, 235, 0.653);
            opacity: 0;
            transition: opacity 0.3s ease;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .overlay p {
		    text-align: center; /* 텍스트가 중간에 정렬되도록 */
		}
	

		
        .game:hover .overlay {
            opacity: 1;
        }

        .caresel:hover .image {
            opacity: 0.7;
            transform: scale(1.1);
        }


        .game:hover {
            cursor: pointer;
            transform: scale(1.1);
            transition: transform 0.3s ease;
        }

        .games {
            border: none;
        }

        .games1,
        .games2 {
            border: none;
        }

        .games1>div,
        .games2>div {
            height: 400px;
            padding: 15px;
        }

        .id_login_button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding-top: 30px;
            padding-bottom: 30px;
            border: none;
        }


        .carousel,
        #carouselExampleIndicators {
            width: 100%;
            height: 100%;
        }

        .carousel-inner,
        .carousel-item {
            width: 100%;
            height: 100%;
            position: relative;
        }

        .carousel-item>img {
            width: 100%;
            height: 100%;
            /* object-fit: cover;*/
        }


        b {
            position: relative;
            display: inline-block;
            padding: 70px;
            padding-left:110px;
            padding-right:110px;
            color: #03e4f4;
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.5s;
            letter-spacing: 4px;
            overflow: hidden;
            font-size: 40px;
            font-weight: bold;
            margin-top: 70px;
            
        }

        b:hover {
            background: #03e4f4;
            color: #ffffff;
            box-shadow: 0 0 5px #03e4f4,
                0 0 25px #03e4f4,
                0 0 50px #03e4f4,
                0 0 200px #03e4f4;
            -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
        }

        b:nth-child(1) {
            filter: hue-rotate(270deg);
        }

        b:nth-child(2) {
            filter: hue-rotate(110deg);
        }

        b span {
            position: absolute;
            display: block;
            animation: rainbowText 5s linear infinite;
        }
        
   

        b span:nth-child(1) {
            top: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #03e4f4);
            animation: animate1 1s linear infinite;
        }

        @keyframes animate1 {
            0% {
                left: -100%;
            }

            50%,
            100% {
                left: 100%;
            }
        }

        b span:nth-child(2) {
            top: -100%;
            right: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(180deg, transparent, #03e4f4);
            animation: animate2 1s linear infinite;
            animation-delay: 0.25s;
        }

        @keyframes animate2 {
            0% {
                top: 100%;
            }

            50%,
            100% {
                top: -100%;
            }
        }

        b span:nth-child(3) {
            bottom: 0;
            right: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(270deg, transparent, #03e4f4);
            animation: animate3 1s linear infinite;
            animation-delay: 0.50s;
        }

        @keyframes animate3 {
            0% {
                right: -100%;
            }

            50%,
            100% {
                right: 100%;
            }
        }


        b span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #03e4f4);
            animation: animate4 1s linear infinite;
            animation-delay: 0.75s;
        }

        @keyframes animate4 {
            0% {
                bottom: 100%;
            }

            50%,
            100% {
                bottom: -100%;
            }
        }

        .infoList {
            height: 40px;
            border: none;
            color: white;
        }

        .infoList>div {
            text-align: center;
            border: none;
        }

        .infoList:hover {
            cursor: pointer;
        }

        .cotents {
            width: 100%;
            margin-top: 200px;
            border: none;
        }

        .imgForDesign {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 200px;
            margin-bottom: 200px;
            border: none;
        }

        .commonBoardTitle {
            /* text-align: center; */
            font-size: 30px;
            font-weight: bold;
            border: none;
            padding-bottom: 10px;
        }

        .commonBoard {
            padding: 50px;
            background-color: white;
            border-radius: 10px 10px 10px 10px;
        }

        td {
            border-top: 1px dashed black;
        }

        .footer {
            background-color: rgba(0, 0, 0, 0);
            margin-top: 200px;
            height: 400px;
            padding: 50px;
        }

        .footer>div {
            border: none;
        }

        .logoImg {
            
            border: none;
            color: white;
            font-size: 70px;
            font-weight: bold;
        }

        .footerTexts {
            height: 70%;
            border: none;
            color: gray;
            padding-bottom: 0px;
            padding-top: 30px;
            line-height: 18px;
        }
        .smallbox{
        	height:50px;

        }
        .smallbox:hover{
        cursor:pointer;
        background:white;
        border-radius:8px;
        color:black;
        display: flex;
            align-items: center;
            justify-content: center;
            padding:10px;
        }
        #postTitle {
	     text-decoration: none; /* 밑줄 제거 */
	     color: black; /* 원하는 색상으로 변경 (예: 빨간색) */
	   }
   
   		#postTitle:hover{
			font-weigt:bold;
         }
    </style>
    
    <script>
   $(function() {
      $.ajax({
         url:"/indexBoard.comboard",
         data:{cpage:1}
      }).done(function(resp) {
    	  resp = JSON.parse(resp);
    	  let contentHTML = '<tr><th>번호</th><th>작성자</th><th>제목</th><th>작성일</th></tr>';
                    
               
               resp.forEach(function(list) {
                 
                     contentHTML += "<tr>" +
                                     "<td>" + list.c_seq + "</td>" +
                                     "<td>" + list.m_nickname + "</td>" +
                                     "<td><a href='/detail.comboard?c_seq=" + list.c_seq + "' id='postTitle'>" + list.title + "</a></td>" +
                                     "<td>" + list.timeLabel + "</td>" +
                                     "</tr>";
               })

               $("#indexboard").html(contentHTML); 
        
            });
         });
</script>
    
</head>

<body>
    <div class="container-fluid">
       <img src="/image/배경화면2.jpg" class="background-img">
        <div class="row header text-center">
            <div class="col-12 col-md-2">
                <img src="/image/title2.png" class="img-fluid" alt="..." style="cursor:pointer; width:80%; height:80%;">
            </div>
            <c:choose>
                <c:when test="${loginID == null}">
                    <div id="guest" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
                    <div class="smallbox">
                        마이페이지
                        </div>
                    </div>
                </c:when>
                <c:when test="${loginID != null && loginID != 'admin'}">
                    <div id="mypageNavi" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
                    <div class="smallbox">
                        마이페이지
                        </div>
                    </div>
                </c:when>
                <c:when test="${loginID == 'admin'}">
                    <div id="adminNavi" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
                        <div class="smallbox">
                        관리자페이지
                        </div>
                    </div>
                </c:when>
            </c:choose>
            <div id="ranklist" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
            <div class="smallbox">
                전체 랭킹
                </div>
            </div>
            <div id="comboardNavi" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
                <div class="smallbox">
                커뮤니티
                </div>
            </div>
            <div id="qnaboardNavi" class="col-12 col-sm-6 col-md-2" style="padding: 10px;">
                <div class="smallbox">
                Q&A
                </div>
            </div>
            <c:choose>
                <c:when test="${loginID == null}">
                    <div class="col-12 d-md-block col-md-2">
                        <button id="signupBtn"
                            style=" background: rgba(0, 0, 0, 0); color:white; border:1px solid white; padding:10px; margin-top: 30px;   border-radius: 5px; font-weight:bold; font-size:18px;">SignUp</button>
                        <button id="loginBtn"
                            style=" background: rgba(0, 0, 0, 0); color:white; border:1px solid white; padding:10px; margin-top: 30px;   border-radius: 5px; font-weight:bold; font-size:18px;">LogIn</button>
                    </div>
                </c:when>
                <c:when test="${loginID != null}">
                    <div class="col-12 d-md-block col-md-2">
                        <button id="logoutBtn"
                            style="background-color: rgba(0, 0, 0, 0); color:white; float:left; border:1px solid white; padding:10px; margin-top: 30px;   border-radius: 5px; font-weight:bold; font-size:18px;">LogOut</button>
                        <div class="welcomeId" style="float:left; padding-top:40px; padding-left:5px; font-size:20px;">${loginID}님</div>
                    </div>
                </c:when>
            </c:choose>
        </div>
        <div class="row game_image">
            <div id="imageContainer" class="col-12 d-none d-sm-block col-sm-12">
                <div id="carouselExampleIndicators" class="row carousel slide" data-bs-ride="carousel">
                    <div class="col-12 carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                            aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
                            aria-label="Slide 5"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"
                            aria-label="Slide 6"></button>
                    </div>
                    <div class="col-12 carousel-inner">
                        <div class="carousel-item active">
                            <img src="/image/jeongmin.gif" class="d-block w-100" alt="...">

                        </div>
                        <div class="carousel-item">
                            <img src="/image/근한.gif" class="d-block w-100" alt="...">

                        </div>
                        <div class="carousel-item">
                            <img src="/image/주혁.gif" class="d-block w-100" alt="...">

                        </div>
                        <div class="carousel-item">
                            <img src="/image/태웅.gif" class="d-block w-100" alt="...">

                        </div>
                        <div class="carousel-item">
                            <img src="/image/내꺼최종.gif" class="d-block w-100" alt="...">

                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="cotents">
                <div class="row mainContents">
                
                
                
                 <!-- 로그인 했을 때 -->  
                 <c:choose>
                 <c:when test="${loginID != null && loginID != 'admin'}">
                    <div class="col-12 col-md-9 order-2 order-sm-1 mx-auto games">
                     <div class="col-12 d-none d-sm-block title" style="color:white;">전체게임</div>
                        <div class="row games1">
                            <div class="col-12 col-md-4 games">
							<a href ="/mazegame/main.jsp">
                                <div class="game">
                                    <img src="/image/정민.png" class="img-fluid" alt="...">
                                      <div class="overlay">캐릭터를 굴려서 벽들을 피해 <br> 골인지점에 도달하는 게임 <br> 60초 안에 도착해야됩니당</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
		 					<a href ="/numberbaseballgame/main.jsp">
                                <div class="game">
                                    <img src="/image/inho.jpg" class="img-fluid" alt="...">
                                    <div class="overlay">0부터 9까지의 숫자를 넣어서 맞추는 게임 <br> 숫자랑 야구를 접목시켜 만든 게임</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
							<a href ="/2048game/main.jsp">
                                <div class="game">
                                    <img src="/image/주혁.jpg" class="img-fluid" alt="...">
                                   <div class="overlay">2048까지 숫자를 키우는 게임 <br> 방향키로 조작합니다</div>
                                </div>
							</a>
                            </div>
                        </div>
                        <div class="row games2">
                            <div class="col-12 col-md-4 games">
							<a href ="/airplanegame/main.jsp">
                                <div class="game">
                                    <img src="/image/근한.png" class="img-fluid" alt="...">
                                    <div class="overlay">내려오는 장애물들을 쏴서 맞추는 게임 <br> 공격은 당연히 피해야겠죠?</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
							<a href ="/reactionspeedgame/game.jsp">
                                <div class="game">
                                    <img src="/image/태웅.jpg" class="img-fluid" alt="...">
                                    <div class="overlay">색이 바귈때 순발력을 발휘해서 <br> 얼른 버튼을 누르는 게임입니다</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
		 					<a href ="/wordlegame/game.jsp">
                                <div class="game">
                                    <img src="/image/채영.png" class="img-fluid" alt="...">
                                    <div class="overlay">6번의 기회 안에 주어진 다섯 글자 <br> 영어 단어를 맞추는 게임입니다 </div>
                                </div>
							</a>
                            </div>
                        </div>
                    </div>
                    </c:when>
                	<c:otherwise>

					 <div class="col-12 d-none d-sm-block title" style="color:white;">전체게임</div>
                    <div class="col-12 col-md-9 order-2 order-sm-1 games">
                        <div class="row games1">
                            <div class="col-12 col-md-4 games">
                            <a href ="/mazegame/main.jsp">
                                <div class="game">
                                    <img src="/image/정민.png" class="img-fluid" alt="...">
                                    <div class="overlay">캐릭터를 굴려서 벽들을 피해 <br> 골인지점에 도달하는 게임 <br> 60초 안에 도착해야됩니당</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
		 					<a href ="/numberbaseballgame/main.jsp">
                                <div class="game">
                                    <img src="/image/inho.jpg" class="img-fluid" alt="...">
                                    <div class="overlay">0부터 9까지의 숫자를 넣어서 맞추는 게임 <br> 숫자랑 야구를 접목시켜 만든 게임</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
							<a href ="/2048game/main.jsp">
                                <div class="game">
                                    <img src="/image/주혁.jpg" class="img-fluid" alt="...">
                                    <div class="overlay">2048까지 숫자를 키우는 게임 <br> 방향키로 조작합니다</div>
                                </div>
							</a>
                            </div>
                        </div>
                        <div class="row games2">
                            <div class="col-12 col-md-4 games">
							<a href ="/airplanegame/main.jsp">
                                <div class="game">
                                    <img src="/image/근한.png" class="img-fluid" alt="...">
                                    <div class="overlay">내려오는 장애물들을 쏴서 맞추는 게임 <br> 공격은 당연히 피해야겠죠?</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
							<a href ="/reactionspeedgame/game.jsp">
                                <div class="game">
                                    <img src="/image/태웅.jpg" class="img-fluid" alt="...">
                                    <div class="overlay">색이 바귈때 순발력을 발휘해서 <br> 얼른 버튼을 누르는 게임입니다</div>
                                </div>
							</a>
                            </div>
                            <div class="col-12 col-md-4 games">
		 					<a href ="/wordlegame/game.jsp">
                                <div class="game">
                                    <img src="/image/채영.png" class="img-fluid" alt="...">
                                    <div class="overlay">6번의 기회 안에 주어진 다섯 글자 <br> 영어 단어를 맞추는 게임입니다 </div>
                                </div>
							</a>
                            </div>
                        </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${loginID == null }">
                            <div class="col-12 d-none d-sm-block col-md-3 order-1 order-sm-2 loginCOntainer">
                                <div class="id_login_button">
                                    <b id="loginBox">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                        Login
                                    </b>
                                </div>
                     
                                <div class="row mx-auto infoList">
                                    <div id="findId" class="col-12 d-none d-sm-block col-sm-4">FindID</div>
                                    <div id="findPw" class="col-12 d-none d-sm-block col-sm-4">FindPW</div>
                                    <div id="signupBtn1" class="col-12 d-none d-sm-block col-sm-4">SignUp</div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                    
                    
                    
                    
                </div>
                <div class="col-12 imgForDesign">
                    <img src="/image/배너.png" class="img-fluid" alt="..." style="width:95%; height:600px; border-radius: 20px; border: 1px solid pink;"">
                </div>
                <div class="col-12 col-md-8 mx-auto commonBoard" style="align:center; background: linear-gradient(90deg, gray,lightgray,white,white,white,white, white,white,lightgray, gray);">
                    <div class="commonBoardTitle"> 
                        <i class="fa-duotone fa-solid fa-user-pen fa-sm"></i> 자유게시판
                    </div>
                    <table id="indexboard"class="col-12" style="border-top: 2px solid black;">
                       
                    </table>
                </div>
            </div>
            <div class="row footer">
                <div class="col-12 footerContents">
                    <div class="col-12 col-sm-6 col-md-2 logoImg">
                          <img src="/image/title2.png" class="img-fluid" alt="...">
                    </div>
                    <div class="col-12 footerTexts">
                        이메일:trycatch@gmail.com|채팅 : 카카오톡 채널(아이디 트라이캐치)<br>
                        <br>충청남도 천안시 서북구 두정중10길|전화번호 : 1633-122001<br>
                        <br>© Try catch Korea Corporation All Rights Reserved.
                    </div>
                </div>
            </div>
        </div>
        <script>

            $("#signupBtn").on("click", function () {
                location.href = "/members/signup.jsp"
            });
            $("#loginBtn").on("click", function () {
                location.href = "/members/login.jsp"
            });
            $("#loginBox").on("click", function () {
                location.href = "/members/login.jsp"
            });
            $("#findId").on("click", function () {
                location.href = "/members/findoutId.jsp"
            });
            $("#findPw").on("click", function () {
                location.href = "/members/findoutPw.jsp"
            });
            $("#signupBtn1").on("click", function () {
                location.href = "/members/signup.jsp"
            });

            $("#welcomeBox").on("click", function () {
                location.href = "/mypage.mypages"
            });
            $("#logoutBtn1").on("click", function () {
                location.href = "/logout.members"
            });

            $("#mypageNavi").on("click", function () {
                location.href = "/mypage.mypages";
            });
            $("#adminNavi").on("click", function () {
                location.href = "/list.admins";
            });

            $("#guest").on("click", function () {
                alert("로그인을 해주세요.");
            });

            $("#ranklist").on("click", function () {
                location.href = "/ranklist.games";
            });



            $("#comboardNavi").on("click", function () {
                location.href = "/list.comboard";
            });

            $("#qnaboardNavi").on("click", function () {
                location.href = "/qnalist.qnaboard";
            });

            $("#logoutBtn").on("click", function () {
                location.href = "/logout.members";
            });
        </script>
</body>

</html>