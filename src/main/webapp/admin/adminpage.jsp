<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<title>Document</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
}

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

.naviva {
	width: 100%;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: black;
}

.naviva>.mypage, .whole_ranking, .community, .QandA {
	float: left;
	width: 15%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	background: black;
	font-size: 20px;
}

.first {
	margin-top: 20px;
	display: flex;
	height: 800px;
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
}

table {
	margin: 0 auto;
	margin-left: 20px;
	width: 1000px;
	height: 700px;
	border-radius: 10px;
	overflow-y: auto;
	display: block;
}

th, td {
	border: 1px solid black;
	padding: 10px;
	text-align: center;
}

th {
	height: 50px;
}

td {
	height: 40px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="head">
			Try Catch
			<p class="titlemypage">관리자페이지</p>
		</div>
		<div class="naviva">
			<div class="mypage">관리자페이지</div>
			<div class="whole_ranking">전체 랭킹</div>
			<div class="community">커뮤니티</div>
			<div class="QandA">Q&A</div>
		</div>
		<div class="first">
			<div class="list">
				<ul>
					<li><a href="/list.admins">회원 관리</a></li>
					<hr>
					<li>자유게시판 관리</li>
					<hr>
					<li>Q&A게시판 관리</li>
					<hr>
					<li><a href="/blacklist.admins">블랙리스트</a></li>
					<hr>
					<li><a href="/dashboard.admins">대시보드</a></li>
					<hr>
				</ul>
			</div>
			<table align="center">
				<tr>
					<th>회원ID</th>
					<th>회원명</th>
					<th>회원닉네임</th>
					<th>성별</th>
					<th>경고횟수</th>
					<th>가입날짜</th>
					<th>관리</th>
				</tr>
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.m_id}</td>
						<td>${i.name}</td>
						<td>${i.nickname}</td>
						<td>${i.sexual}</td>
						<td>${i.warning_count}</td>
						<td>${i.signup_date}</td>
						<td>
							<button onclick="deleteMember('${i.m_id}')">삭제</button>
							<button onclick="warningMember('${i.m_id}')">경고</button>
							<button onclick="blackMember('${i.m_id}')">BEN</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script>
	function deleteMember(id) {
	    if(confirm("정말로 삭제하시겠습니까?")) {
	        location.href = '/delete.admins?m_id=' + id;
	    }
	}
	function warningMember(id){
		 location.href = "/warning.admins?m_id="+ id;
	}
	function blackMember(id){
		 location.href = "/black.admins?m_id="+ id;
	}
	
</script>
</body>
</html>
