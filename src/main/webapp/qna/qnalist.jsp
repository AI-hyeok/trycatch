<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QNA List</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
* {
	box-sizing: border-box;
}

div {
	border: 1px solid black;
}

.container {
	width: 100%;
	margin: auto;
}

.navi {
	width: 100%;
	height: 50px;
	margin-bottom: 50px;
}

.navi>div {
	float: left;
	width: 20%;
	height: 50px;
}

.title {
	width: 100%;
	height: 80px;
	font-size: 35px;
	padding-left: 30px;
	padding-top: 30px;
}

.contents {
	width: 100%;
	height: 700px;
}

.sideList {
	float: left;
	width: 25%;
	margin: 10px;
	height: 300px;
}

.mainContents {
	float: left;
	width: 70%;
	height: 98%;
	margin: 10px;
}

.header, .writeBtn, .pageNavi {
	width: 100%;
	height: 8%;
}

.header>div {
	float: left;
	width: 50%;
	height: 100%;
}

.boardList {
	width: 100%;
	height: 76%;
}

.pageNavi {
	display: flex;
	justify-content: center;
	align-items: center;
}

.pageNavi>div {
	height: 100%;
}

.boardName {
	display: flex;
	justify-content: left;
	align-items: baseline;
}

.searchBox {
	display: flex;
	justify-content: right;
	align-items: center;
}

table {
	width: 100%;
}

td {
	text-align: center;
	vertical-align: middle;
	height: 50px;
}

#inputSearch, #searchBtn {
	height: 80%;
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
			<div>마이페이지</div>
			<div>커뮤니티</div>
			<div>Q&A</div>
		</div>
		<div class="title">커뮤니티</div>
		<hr>
		<div class="contents">
			<div class="sideList">
				<div class="mainBoard">자유게시판</div>
				<div class="qnaBoard">Q&A 게시판</div>
				<div class="writeBtn"></div>
			</div>
			<div class="mainContents">
				<div class="header">
					<div class="boardName">Q&A게시판</div>
					<div class="searchBox">
						<form action="/search.qnaboard">
							<input id="inputSearch" type="text" name="search"
								placeholder="작성자를 입력해주세요">
							<button id="searchBtn">검색</button>
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
							<th>답변 여부</th>
						</tr>

						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.q_seq}</td>
								<td><c:choose>
										<c:when test="${i.secret == 'Y'}">
											<c:if test="${loginID == 'admin' || loginID == '${i.m_id}'}">
												<a href="/qnadetail.qnaboard?q_seq=${i.q_seq}"
													id="secretTitle">비공개 질문입니다.</a>
												<i class="fa-regular fa-eye-slash"></i>
											</c:if>
											<c:if
												test="${loginID == null || loginID != 'admin' || loginID != '${i.m_id}'}">
												<a onclick="alert('권한이 없습니다.')">비공개 질문입니다.</a>
												<i class="fa-regular fa-eye-slash"></i>
											</c:if>
										</c:when>
										<c:otherwise>
											<a href="/qnadetail.qnaboard?q_seq=${i.q_seq}">${i.title}</a>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${i.secret == 'Y'}">비공개</c:when>
										<c:otherwise>${i.m_nickname}</c:otherwise>
									</c:choose></td>
								<td>${i.write_date}</td>
								<td><c:choose>
										<c:when test="${i.hasAnswer}">
											<span style="color: blue;">답변 완료 <i class="fa-solid fa-circle-check"></i></span>
											
										</c:when>
										<c:otherwise>
											<span style="color: red;">답변 대기 <i class="fa-solid fa-circle-xmark"></i></span>
											
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<c:choose>
					<c:when test="${loginID != null || loginID == 'admin'}">
						<div class="writeBtn">
							<a href="/qnawrite.qnaboard"><button>게시물 작성하기</button></a>
						</div>
					</c:when>
					<c:when test="${loginID == null}">
						<div class="writeBtn">
							<button id="nowrite">게시물 작성하기</button>
						</div>
					</c:when>
				</c:choose>
				<div class="pageNavi">
					<div>
						<c:if test="${needPrev}">
							<span class="paging" page="${stratNavi-1}"><</span>
						</c:if>
						<c:forEach var="i" begin="${startNavi}" end="${endNavi}">
							<span class="paging" page="${i}">${i} </span>
						</c:forEach>
						<c:if test="${needNext}">
							<span class="paging" page="${endNavi+1}">></span>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(".paging").on("click", function() {
			let pageNum = $(this).attr("page");
			sessionStorage.setItem("last_cpage", pageNum);
			location.href = "/qnalist.qnaboard?cpage=" + pageNum;
		})
		
		$("#nowrite").on("click",function(){
			alert("로그인을 해주세요.");
		})
	</script>
</body>
</html>
