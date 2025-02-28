<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<title>Q&AList</title>
	<style>
		.background-img {
			position: fixed;
			top: 0;
			left: 0;
			width: 100vw;
			height: 100vh;
			z-index: -1;
		}

		* {
			box-sizing: border-box;
			margin: 0px;
			padding: 0px;
		}

		.headerLogoImg {
			width: 200px;
			height: auto;
		}

		.container {
			margin: auto;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.header {
			height: 50px;
		}

		.naviva {
			padding: 0px;
		}

		.naviva div {
			cursor: pointer;
			font-weight: bold;
			font-size: 20px;
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.title {
			height: 80px;
			font-size: 35px;
			background-color: white;
		}

		.titleDetail {
			display: flex;
			justify-content: left;
			align-items: baseline;
		}

		.contents {
			padding: 0px;
			height: 100%;
		}

		.mypage,
		.whole_ranking,
		.community,
		.QandA {
			width: 100%;
			height: 10%;
		}

		.mainContents {
			margin-top: 10px;
			padding: 15px;
			height: 100%;
		}

		.writeBtn {
			margin: 10px;
			display: flex;
			justify-content: right;
			align-items: baseline;
		}

		.header>div {
			height: 100%;
		}

		.pageNavi {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 20px;
		}

		.pageNavi>div {
			height: 100%;
		}

		.boardName {
			display: flex;
			justify-content: left;
			align-items: baseline;
			padding-left: 10px;
			font-size: 25px;
		}

		.searchBox {
			display: flex;
			justify-content: right;
			align-items: center;
			padding: 0px;
		}

		.frm {
			padding: 0px;
		}

		th {
			text-align: center;
			vertical-align: middle;
			height: 50px;
			background-color: #4a46c864;
			width: 85%;
			border: 1px solid rgba(255, 255, 255, 0.861);
			color: #2d2736;
		}

		td {
			text-align: center;
			vertical-align: middle;
			height: 40px;
		}

		.boardList {
			height: 100%;
			padding-right: 30px;
			padding-left: 30px;
			padding-top: 15px;
			padding-bottom: 20px;
			border-radius: 5px;
			background-color: rgba(255, 255, 255, 0.861);
		}

		#inputSearch {
			height: 80%;
			width: 65%;
			background-color: #EEEEEE;
			border-radius: 5px;
			border: 1px solid #EEEEEE;
		}

		#searchBtn, .writebtn {
			height: 80%;
			width: 25%;
			;
			background-color: #4a46c864;
			border-radius: 5px;
			border: 1px solid #EEEEEE;
			margin-left: 5px;
			margin-right: 5px;
		}

		.searchBox,
		.writeBtn {
			padding: 0px;
			margin: 0px;
			height: 40px;
			padding-left: 5px;
		}

		.writeBtn {
			display: flex !important;
			justify-content: right !important;
			align-items: baseline !important;
		}

		#writeBtn {
			width: 100px;
			height: 80%;
			background-color: #4a46c864;
			border-radius: 5px;
			border: 1px solid #EEEEEE;
			padding: 0px;
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
			margin-bottom: 30px;
		}

		.paging {
			cursor: pointer;
			padding: 5px 10px;
			margin: 0 5px;
			border-radius: 3px;
			color: white;
			text-align: middle;
		}

		a {
			text-decoration: none;
			/* 밑줄 제거 */
			color: black;
			/* 원하는 색상으로 변경 (예: 빨간색) */
		}

		a:hover {
			color: #4b46c8;
			font-size: larger;
		}

		.id_login_box {
			width: 100%;
			height: 50%;
			margin: 0px;
		}

		.id_login_button {
			width: 130%;
			display: flex;
			align-items: center;
			justify-content: center;
			border-radius: 10px 10px 0px 0px;
			flex-direction: row;
			/* 수평 배치 */
			gap: 0px;
		}

		#loginBox {
			width: 100%;
			height: 30%;
			margin: 0px;
			padding: 20px;
		}

		#loginBox>div {
			flex: 1;
			/* 각 div 요소의 크기를 동일하게 설정 */
			text-align: center;
			font-size: 20px;
			color: white;
		}

		n {
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
			box-shadow: 0 0 5px #fff700, 0 0 25px #fff700, 0 0 50px #fff700, 0 0 200px #6a00ff;
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
			background: linear-gradient(90deg, transparent, #fff700);
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

		n span:nth-child(2) {
			top: -100%;
			right: 0;
			width: 2px;
			height: 100%;
			background: linear-gradient(180deg, transparent, #fff700);
			animation: animate2 1s linear infinite;
			animation-delay: 0.25s;
		}

		@keyframes animate2 {
			0% {
				top: -100%;
			}50%,100% {
				top:100%;
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

		@keyframes animate3 {
			0% {
				right: -100%;
			}50%,100% {
				right:100%;
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

		@keyframes animate4 {
			0% {
				bottom: -100%;
			}50%,100% {
				bottom:100%;
			}
		}
	</style>
</head>

<body>
	<img class="background-img" src="qna/images/BGI.jpg">
	<div class="row container">
		<header class="d-flex align-items-center p-3">
			<h1 class="h1 flex-grow-1 trycatch ">
				<img class="headerLogoImg" src="qna/images/LogoW.png">
			</h1>
			<span class="fs-4" style="color: white;">Q&A</span>
		</header>
		<div class="id_login_button">
			<n id="loginBox"> 
				<span></span> 
				<span></span> 
				<span></span> 
				<span></span>
			<c:choose>
				<c:when test="${loginID != null}">
					<div class="mypage">마이페이지</div>
				</c:when>
				<c:when test="${loginID == null}">
					<div class="nomypage">마이페이지</div>
				</c:when>
			</c:choose>	
				<div class="whole_ranking">전체 랭킹</div>
				<div class="community">커뮤니티</div>
				<div class="QandA">Q&A</div>
			</n>
		</div>
		<div class="row contents">
			<div class="col-12 col-md-12 mainContents">
				<form action="/search.qnaboard" class="frm" method="post">
					<div class="row header">
						<div class="col-12 col-sm-6 boardName" style="color: white;">Q&A 게시판</div>
					</div>

					<div class="row boardList">
						<div class="col-12 d-none d-sm-block col-sm-4 searchBox">
							<input name="search" id="inputSearch" type="text" placeholder="작성자로 검색해주세요" value="">
							<button id="searchBtn">검색</button>
						</div>
					
				</form>
				<c:choose>
					<c:when test="${loginID != null || loginID == 'admin'}">
						<div class="col-12 d-none d-sm-block col-sm-8 writeBtn">
							<a href="/qnawrite.qnaboard"><button type="button" style="background-color: #4a46c864;border-radius: 5px;border: 1px solid #EEEEEE;">게시물 작성하기</button></a>
						</div>
					</c:when>
					<c:when test="${loginID == null}">
						<div class="col-12 d-none d-sm-block col-sm-8 writeBtn">
							<button type="button" id="nowrite" style="background-color: #4a46c864;border-radius: 5px;border: 1px solid #EEEEEE;">게시물 작성하기</button>
							<script>
								$("#nowrite").on("click", function () {
									alert("로그인이 필요합니다.");
								})
							</script>
						</div>
					</c:when>
				</c:choose>
				
				<table>
					<tr class="col-12">
						<th class="col-3 col-md-2">글번호</th>
						<th class="col-6 col-md-4">제목</th>
						<th class="col-3 col-md-2">작성자</th>
						<th class="col-md-2">작성일</th>
						<th class="col-md-2">답변여부</th>
					</tr>
					<c:forEach var="i" items="${list}">
						<tr class="col-12" id="tdcontainer">
							<td>${i.q_seq}</td>
							<td>
								<c:choose>
									<c:when test="${i.secret == 'Y'}">
										<c:if test="${loginID == 'admin' || loginID == i.m_id}">
											<a href="/qnadetail.qnaboard?q_seq=${i.q_seq}">${i.title}</a>
										</c:if>
										<c:if test="${loginID != 'admin' && loginID != i.m_id}">
											<a href="javascript:void(0);" onclick="alert('권한이 없습니다.')">${i.title}</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<a href="/qnadetail.qnaboard?q_seq=${i.q_seq}">${i.title}</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${i.secret == 'Y'}">비공개</c:when>
									<c:otherwise>${i.m_nickname}</c:otherwise>
								</c:choose>
							</td>
							<td>${i.timeLabel}</td>
							<td>
								<c:choose>
									<c:when test="${i.hasAnswer}">
										<span style="color: blue;">답변 완료 <i class="fa-solid fa-circle-check"></i></span>

									</c:when>
									<c:otherwise>
										<span style="color: red;">답변 대기 <i class="fa-solid fa-circle-xmark"></i></span>

									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
			</div>
			<div class="col-12 pageNavi">			
				<c:if test="${needPrev}">
					<span class="paging" page="${stratNavi-1}">
						</span>
				</c:if>
				<c:forEach var="i" begin="${startNavi}" end="${endNavi}">
					<span class="paging" page="${i}">${i} </span>
				</c:forEach>
				<c:if test="${needNext}">
					<span class="paging" page="${endNavi+1}">></span>
				</c:if>	
			</div>	
			<script>
				$(".paging").on("click", function () {
				let pageNum = $(this).attr("page");
				sessionStorage.setItem("last_cpage", pageNum);
				location.href = "/qnalist.qnaboard?cpage=" + pageNum;
			})
			</script>
		</div>

	<div class="row footer">
		<div class="col-12 footerContents">
			<div class="col-12 footerTexts">
				이메일:trycatch@gmail.com|채팅 : 카카오톡 채널(아이디 트라이캐치)<br> <br>충청남도
				천안시 서북구 두정중10길|전화번호 : 1633-122001<br> <br>© Try catch
				Korea Corporation All Rights Reserved.
			</div>
			<div class="col-12 logoText">
				<img class="logoImg" src="qna/images/LogoW.png">
			</div>
		</div>
	</div>

<script>
	$(".trycatch").on("click", function () {
	    window.location.href = "/index.jsp";
	})//index로가기
	
	$(".nomypage").on("click",function(){
		alert("로그인을 해주세요.");
	})//마이페이지로가기
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
</script>
</body>
</html>