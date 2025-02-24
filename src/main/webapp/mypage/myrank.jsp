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
	margin-left: 20%;
	margin-top: 70px;
	font-size: 18px;
	font-weight: bold;
}

table {
	width: 60%;
	margin: auto;
	table-layout: fixed; /* 고정 레이아웃 설정 */
}

th {
	width: 20%;
	padding-right: 10%;
	height: 60px;
	font-size: 20px;
}

td {
	width: 40%;
	padding-right: 20%;
	text-align: center;
	font-size: 20px;
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
			<p class="titlemypage">랭킹 보기</p>
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

				<div class="instruct">내 최고 랭킹</div>
				<hr style="width: 60%;">

				<div class="ranklist">
					<table>

						<tr>
							<th>게임이름</th>
							<th>점수</th>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[0].gamename}</td>
							<td>${list[0].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[1].gamename}</td>
							<td>${list[1].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[2].gamename}</td>
							<td>${list[2].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[3].gamename}</td>
							<td>${list[3].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[4].gamename}</td>
							<td>${list[4].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">
					<table>

						<tr>
							<td>${list[5].gamename}</td>
							<td>${list[5].highScore}</td>
						</tr>
					</table>
					<hr style="width: 60%;">


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
					window.location.href = "/mypage/out.jsp";
				})//내 게시물 보기
			</script>
</body>
</html>