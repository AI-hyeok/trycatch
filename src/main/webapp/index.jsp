<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script> -->

<title>Document</title>
<style>
* {
	box-sizing: border-box;
}
/* div{
            border:1px solid black;
        } */
.container {
	width: 1880px;
	height: 4000px;
	margin: auto;
	background-image: url('/image/mainback2.gif');
	background-size: cover;
	background-position: center;
}

/* 메인,네비바 */
.main {
	width: 100%;
	height: 2.2%;
}

.main>.title {
	float: left;
	width: 20%;
	height: 100%;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 40px;
}

.main>.title>:hover {
	cursor: pointer;
}

.naviva {
	float: left;
	width: 35%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0);
}

.naviva>.mypage, .whole_ranking, .community, .QandA {
	float: left;
	width: 20%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	background: rgba(0, 0, 0, 0);
	font-size: 20px;
}

.naviva>.mypage, .whole_ranking, .community, .QandA:hover {
	cursor: pointer;
}

.blank {
	float: left;
	width: 32%;
	height: 100%;
	background: rgba(0, 0, 0, 0);
}

.main>.sign_up {
	float: left;
	width: 5%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 15px;
	color: white;
	background: rgba(0, 0, 0, 0);
}


.main>.sign_up:hover {
	cursor: pointer;
}

.main>.log_in {
	float: left;
	width: 6%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-left: 0px;
}

.main>.log_in>button {
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 15px;
	background: rgba(255, 255, 255, 0);
	border: 3px solid white;
	font-weight: bold;
	border-radius: 10px 10px 10px 10px;
	color: white;
}

.main>.log_in>button:hover {
	cursor: pointer;
}

.main>.logoutBox {
	float: left;
	width: 5%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0);
}

.main>.log_out {
	float: left;
	width: 6%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-left: 0px;
}

.main>.log_out>button {
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: 15px;
	background: rgba(255, 255, 255, 0);
	border: 3px solid white;
	font-weight: bold;
	border-radius: 10px 10px 10px 10px;
	color: white;
}

.main>.log_out>button:hover {
	cursor: pointer;
}

/* 게임 이미지 */
.game_image {
	width: 100%;
	height: 18%;
}

/* 전체 게임, 로그인 */
.whole_game_letter {
	padding-left: 120px;
	width: 100%;
	height: 3%;
	display: flex;
	align-items: center;
	justify-content: left;
	font-weight: 800;
	font-size: 25px;
	padding-top: 70px;
	color: white;
}

.whole_game_and_id_login {
	width: 100%;
	height: 40%;
}

.whole_game_and_id_login>.whole_game {
	float: left;
	width: 60%;
	height: 100%;
	padding-left: 100px;
}

.whole_game_and_id_login>.id_login {
	float: left;
	width: 40%;
	height: 100%;
	padding-right: 100px;
}

/* 전체게임 */
.whole_game>.games {
	width: 100%;
	height: 100%;
}

.whole_game>.games>.game_one, .game_two, .game_three, .game_four,
	.game_five, .game_six {
	float: left;
	width: 50%;
	height: 33.3%;
}

.whole_game>.games>.game_one, .game_two, .game_three, .game_four,
	.game_five, .game_six>:hover {
	cursor: pointer;
}

.first2048_picture, .block_picture, .super_mario_picture,
	.number_baseball_picture, .another_writer_picture, .six_picture {
	width: 95%;
	height: 63%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 30px;
	margin-bottom: 0px;
	border-radius: 10px 10px 0px 0px;
}

.first2048_section, .block_section, .super_mario_section,
	.number_baseball_section, .another_writer_section, .six_section {
	width: 95%;
	height: 32%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 30px;
	margin-top: 0px;
	border-radius: 0px 0px 10px 10px;
	flex-direction: column;
	background: rgba(255, 255, 255, 0.954);
}

.update {
	width: 95%;
	height: 15%;
	margin-top: 10px;
	color: green;
	font-size: 20px;
}

#update_box {
	width: 15%;
	height: 95%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: red;
	color: white;
}

#title {
	width: 95%;
	height: 65%;
	font-size: 20px;
	font-weight: 700;
}

#genre {
	width: 95%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: end;
}

/* 아이디 로그인 박스 */
.id_login_box {
	width: 100%;
	height: 25%;
}

.id_login_button {
	width: 100%;
	height: 80%;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 10px 10px 0px 0px;
}

a{
	position: relative;
	display: inline-block;
	padding: 90px;
	margin: 40px 0;
	color: #f403c4;
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

a:hover {
	background: #f403c4;
	color: #050801;
	box-shadow: 0 0 5px #f403c4, 0 0 25px #f403c4, 0 0 50px #f403c4, 0 0
		200px #f403c4;
	-webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

a:nth-child(1) {
	filter: hue-rotate(270deg);
}

a:nth-child(2) {
	filter: hue-rotate(110deg);
}

a span {
	position: absolute;
	display: block;
}

a span:nth-child(1) {
	top: 0;
	left: 0;
	width: 100%;
	height: 2px;
	background: linear-gradient(90deg, transparent, #f403c4);
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
a span:nth-child(2) {
	top: -100%;
	right: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(180deg, transparent, #f403c4);
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
a span:nth-child(3) {
	bottom: 0;
	right: 0;
	width: 100%;
	height: 2px;
	background: linear-gradient(270deg, transparent, #f403c4);
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
a span:nth-child(4) {
	bottom: -100%;
	left: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(360deg, transparent, #f403c4);
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
.id_login_info {
	width: 100%;
	height: 30%;
	border-radius: 0px 0px 10px 10px;
}

.id_login_info>:hover {
	cursor: pointer;
}

.login_id {
	float: left;
	width: 38.3%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: end;
	color: white;
	padding-bottom: 50px;
}

.login_pw {
	float: left;
	width: 20%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	padding-bottom: 50px;
}

.login_signup {
	float: left;
	width: 33.3%;
	height: 20%;
	display: flex;
	align-items: center;
	justify-content: start;
	color: white;
	padding-bottom: 50px;
}

/* 하단 trycatch img */
.trycatch_image {
	width: 100%;
	height: 7%;
}

/* 게시판 */
.free_board_letter {
	width: 90%;
	height: 7%;
	margin: auto;
}

#blank2 {
	width: 100%;
	height: 70%;
}

#free {
	width: 100%;
	height: 30%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	font-weight: 700;
	color: white;
}

.navi {
	width: 90%;
	height: 1%;
	margin: auto;
}

.navigator {
	width: 100%;
	height: 100%;
}

.navigator {
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
}

.write>button {
	padding: 5px;
	padding-left: 50px;
	padding-right: 50px;
	font-size: 15px;
	background: white;
	font-weight: 900;
	border-radius: 10px 10px 10px 10px;
}

.blank4 {
	width: 100%;
	height: 3%;
}

td {
	padding: 10px;
	background: rgba(255, 255, 255, 0.209);
	color: white;
	border-top: 1px dashed rgba(211, 211, 211, 0.744);
}

/* footer */
.footer {
	width: 100%;
	height: 400px;
	position: absolute;
}

.blank5 {
	width: 100%;
	height: 20%;
}

.footer_title {
	width: 100%;
	height: 30%;
	color: white;
	font-size: 40px;
	display: flex;
	align-items: center;
	font-weight: 800;
	padding-left: 100px;
}

.email_n_chat {
	width: 100%;
	height: 10%;
	color: white;
	padding-left: 100px;
}

.address_n_phone {
	width: 100%;
	height: 10%;
	color: white;
	padding-left: 100px;
}

.end {
	width: 100%;
	height: 10%;
	color: white;
	padding-left: 100px;
}

.blank6 {
	width: 100%;
	height: 20%;
}

.carousel-item img {
	object-fit: cover;
	height: 500px;
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row main">
			<div class="col-12 d-none d-md-block title">
				<img src="/image/title2.png" style="width: 375px; height: 87px;">
			</div>
			<div class="col-12 d-block d-md-none"></div>
			<div class="col-12 d-none d-md-block naviva">
			
			<c:choose>
			
				<c:when test="${loginID == null}">
						<div id="guest" class="d-none d-md-block mypage">마이페이지</div>
				</c:when>
			
				<c:when test="${loginID != null && loginID != 'admin'}">
					<div id="mypageNavi" class="d-none d-md-block mypage">마이페이지</div>
				</c:when>
			
				<c:when test="${loginID == 'admin'}">
					<div id="adminNavi" class="d-none d-md-block mypage">관리자페이지</div>
				</c:when>
			
			</c:choose>
				<div id="ranklist" class="d-none d-md-block whole_ranking">전체 랭킹</div>
				<div id="comboardNavi" class="d-none d-md-block community">자유게시판</div>
				<div id="qnaboardNavi" class="d-none d-md-block QandA">Q&A게시판</div>
			</div>
			<div class="col-12 d-none d-md-block blank"></div>
	
			<c:choose>
			<c:when test="${loginID == null}">
			<div id="signupBtn" class="col-12 d-none d-md-block sign_up">회원가입</div>
			<div class="col-12 d-none d-md-block log_in">
				<button id="loginBtn">로그인</button>
			</div>
			</c:when>
			<c:when test="${loginID != null}">
			<div class="col-12 d-none d-md-block log_outBox"></div>
			<div class="col-12 d-none d-md-block log_out">
				<button id="logoutBtn">로그아웃</button>
			</div>
			</c:when>
			</c:choose>
		</div>
		<div class="game_image">

			<!--  <div id="carouselExampleFade" class="carousel slide carousel-fade">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="http://picsum.photos/1880/720?random=1" class="d-block w-100" alt="...">
                  </div>
                   <div class="carousel-item">
                    <img src="http://picsum.photos/3600/720?random=2" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="http://picsum.photos/3600/720?random=3" class="d-block w-100" alt="...">
                  </div> 
                </div>
                 <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button> 
              </div> -->
		</div>
		<div class="whole_game_letter">전체 게임</div>
		<div class="whole_game_and_id_login">
			<div class="whole_game">
				<div class="games">
					<div class="game_one">
						<div class="first2048_picture">
							<img src="/image/2048.jpg"
								style="width: 488px; height: 332px; border-radius: 10px 10px 0px 0px;">
						</div>
						<div class="first2048_section">
							<div class="update">
								<div id="update_box">Hot</div>
							</div>
							<div id="title">2048</div>
							<div id="genre">퍼즐</div>
						</div>
					</div>
					<div class="game_two">
						<div class="block_picture">
							<img src="/image/rock.jpg"
								style="width: 488px; height: 332px; border-radius: 10px 10px 0px 0px;">
						</div>
						<div class="block_section">
							<div class="update">
								<div id="update_box">Hot</div>
							</div>
							<div id="title">블럭 피하기</div>
							<div id="genre">액션</div>
						</div>
					</div>
					<div class="game_three">
						<div class="super_mario_picture">
							<img src="/image/mario.jpg"
								style="width: 488px; height: 332px; border-radius: 10px 10px 0px 0px;">
						</div>
						<div class="super_mario_section">
							<div class="update">new</div>
							<div id="title">슈퍼 마리오</div>
							<div id="genre">플랫폼 게임</div>
						</div>
					</div>
					<div class="game_four">
						<div class="number_baseball_picture">
							<img src="/image/baseball.jpg"
								style="width: 488px; height: 332px; border-radius: 10px 10px 0px 0px;">
						</div>
						<div class="number_baseball_section">
							<div class="update">new</div>
							<div id="title">숫자 야구</div>
							<div id="genre">액션</div>
						</div>
					</div>
					<div class="game_five">
						<div class="another_writer_picture">
							<img src="/image/anotherwrite.png"
								style="width: 488px; height: 332px; border-radius: 10px 10px 0px 0px;">
						</div>
						<div class="another_writer_section">
							<div class="update">new</div>
							<div id="title">글자 찾기</div>
							<div id="genre">퍼즐</div>
						</div>
					</div>
					<div class="game_six">
						<div class="six_picture">6사진</div>
						<div class="six_section">
							<div class="update">new</div>
							<div id="title">6번째 게임</div>
							<div id="genre">장르</div>
						</div>
					</div>
				</div>
			</div>
			<div class="id_login">
			<c:choose>
			<c:when test="${loginID == null }">
				<div class="id_login_box">
					<div class="id_login_button">
						<a id="loginBox"> 
						<span></span> 
						<span></span> 
						<span></span> 
						<span></span>
							ID로그인
						</a>
					</div>
					<div class="id_login_info">
						<div class="login_id" id="findId">아이디찾기 |</div>
						<div class="login_pw" id="findPw">비밀번호 찾기 |</div>
						<div class="login_signup" id="signupBtn1">회원가입</div>
					</div>

				</div>
			</c:when>	
			<c:when test="${loginID != null }">
				<div class="id_login_box">
					<div class="id_login_button">
						<a id="welcomeBox"> 
						<span></span> 
						<span></span> 
						<span></span> 
						<span></span>
							${loginID}님 환영합니다.
						</a>
					</div>
					<div class="id_login_info">
						<div class="login_id" id="logoutBtn1">로그아웃</div>
						
					</div>

				</div>
			</c:when>	
			</c:choose>	
			</div>
		</div>
		<div class="trycatch_image">
			<img src="/image/trycatch.png"
				style="width: 1878px; height: 350px; border-radius: 10px 10px 0px 0px;">
		</div>
		<div class="free_board_letter">
			<div id="blank2"></div>
			<div id="free"
				style="background: rgba(255, 255, 255, 0); border-radius: 10px 10px 0px 0px; font-size: 25px;">자유게시판</div>
		</div>
		<div class="boardList">
			<!-- ajax로 받아온 데이터가 들어갈 부분 -->
			<table style="width: 90%; border-collapse: collapse; margin: auto;">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 40%;">
					<col style="width: 20%;">
					<col style="width: 20%;">
					<col style="width: 10%;">
				</colgroup>
				<tr style="background: rgba(255, 255, 255, 0.209); color: black;">
					<th style="padding: 10px;">글번호</th>
					<th style="padding: 10px;">제목</th>
					<th style="padding: 10px;">작성자</th>
					<th style="padding: 10px;">작성일</th>
					<th style="padding: 10px;">조회수</th>
				</tr>
				<tr>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">확성기</td>
					<td
						style="text-align: left; background: rgba(211, 211, 211, 0.149)">공지1</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">OOO</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">2025.02.17</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">0</td>
				</tr>
				<tr>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">확성기</td>
					<td
						style="text-align: left; background: rgba(211, 211, 211, 0.149)">공지2</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">OOO</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">2025.02.17</td>
					<td
						style="text-align: center; background: rgba(211, 211, 211, 0.149)">0</td>
				</tr>
				<tr>
					<td style="text-align: center;">01</td>
					<td style="text-align: left;">title1</td>
					<td style="text-align: center;">OOO</td>
					<td style="text-align: center;">2025.02.17</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;">01</td>
					<td style="text-align: left;">title1</td>
					<td style="text-align: center;">OOO</td>
					<td style="text-align: center;">2025.02.17</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;">01</td>
					<td style="text-align: left">title1</td>
					<td style="text-align: center;">OOO</td>
					<td style="text-align: center;">2025.02.17</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;">01</td>
					<td style="text-align: left;">title1</td>
					<td style="text-align: center;">OOO</td>
					<td style="text-align: center;">2025.02.17</td>
					<td style="text-align: center;">0</td>
				</tr>
				<tr>
					<td style="text-align: center;">01</td>
					<td style="text-align: left;">title1</td>
					<td style="text-align: center;">OOO</td>
					<td style="text-align: center;">2025.02.17</td>
					<td style="text-align: center;">0</td>
				</tr>
			</table>
		</div>
		<div class="navi">
			<div class="navigator"
				style="background: rgba(211, 211, 211, 0); color: darkgray; border-radius: 0px 0px 10px 10px;"><
				1 2 3 4 5 6 7 ></div>
		</div>
		<div class="blank4"></div>

		<div class="footer">

			<div class="blank5"></div>
			<div class="footer_title" style="font-weight: bold;">Try Catch</div>
			<div class="email_n_chat">이메일:trycatch@gmail.com|채팅 : 카카오톡
				채널(아이디 트라이캐치)</div>
			<div class="address_n_phone">충청남도 천안시 서북구 두정중10길|전화번호 :
				1633-122001</div>
			<div class="end">© Try catch Korea Corporation All Rights
				Reserved.</div>
			<div class="blank6"></div>


		</div>
	</div>
	<script>
		
		$("#signupBtn").on("click",function(){
			location.href="/members/signup.jsp"
		});
		$("#loginBtn").on("click",function(){
			location.href="/members/login.jsp"
		});
		$("#loginBox").on("click",function(){
			location.href="/members/login.jsp"
		});
		$("#findId").on("click",function(){
			location.href="/members/findoutId.jsp"
		});
		$("#findPw").on("click",function(){
			location.href="/members/findoutPw.jsp"
		});
		$("#signupBtn1").on("click",function(){
			location.href="/members/signup.jsp"
		});
		
		$("#welcomeBox").on("click",function(){
			location.href="/mypage.mypages"
		});
		$("#logoutBtn1").on("click",function(){
			location.href="/logout.members"
		});
		
		$("#mypageNavi").on("click",function(){
			 location.href = "/mypage.mypages";
		});
		$("#adminNavi").on("click",function(){
			 location.href = "/list.admins";
		});

		$("#guest").on("click",function(){
			 alert("로그인을 해주세요.");
		});

		$("#ranklist").on("click",function(){
			location.href = "/ranklist.games";
		});
		
		

		$("#comboardNavi").on("click",function(){
			location.href = "/list.comboard";
		});
		
		$("#qnaboardNavi").on("click",function(){
			location.href = "/qnalist.qnaboard";
		});
		
		$("#logoutBtn").on("click",function(){
			location.href = "/logout.members";
		});
	</script>
</body>
</html>