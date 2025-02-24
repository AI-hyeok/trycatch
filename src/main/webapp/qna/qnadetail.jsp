<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardWrite</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	width: 90%;
	margin: auto;
}

.navi {
	width: 100%;
	height: 100px;
	margin-bottom: 50px;
}

.navi>div {
	float: left;
	width: 20%;
	height: 100%;
}

.title {
	width: 100%;
	height: 80px;
	font-size: 35px;
	padding-left: 30px;
	padding-top: 30px;
}

.title>div {
	float: left;
	font-weight: bold;
	width: 50%;
}

.btn {
	width: 30%;
	display: flex;
	justify-content: end;
	align-items: center;
}

.contents {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.boardInfo {
	width: 100%;
	height: 50px;
}

table {
	width: 100%;
}

tr {
	height: 50px;
	width: 100%;
}

.boardContents {
	width: 100%;
	height: 600px;
	padding: 50px;
}

.boardContents>div {
	width: 100%;
	height: 100%;
	border: 1px solid black;
}

.addReply {
	width: 100%;
	padding: 30px;
	height: 180px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgb(224, 224, 224);
}

.addReply>div {
	float: left;
}

.inputReplyText {
	width: 90%;
	height: 80%;
}

.addReplyBtn {
	width: 10%;
	height: 80%;
	padding: 0px;
	margin: 0px;
}

.addBtn {
	width: 100%;
	height: 100%;
	padding: 0px;
	margin: 0px;
}

.replyList {
	width: 100%;
	height: 600px;
	padding: 50px;
}

.replys {
	width: 100%;
	height: 100%;
	background-color: rgb(224, 224, 224);
}

.pageNavi {
	width: 100%;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.footer {
	width: 100%;
	height: 400px;
	background-color: black;
	color: white;
	margin-top: 50px;
}

button {
	margin-left: 10px;
	border-radius: 0px;
	background-color: white;
	font-size: 18px;
	padding: 5px;
	width: 200px;
}

textarea {
	width: 100%;
	height: 100%;
}
</style>
<script>
$(function() {
    $.ajax({
       url : "/answerlist.answer",
       data: {q_parent_seq : "${dto.q_seq}"}
    }).done(function(resp){
       resp = JSON.parse(resp);
       console.log(resp.length);
       for(let i = 0; i < resp.length ; i ++) {
           let tr = $("<tr>");
              let td1 = $("<td>").html(resp[i].contents);
          tr.append(td1);
          $(".answerList").append(tr);
       }
    })

 })
</script>
</head>
<body>
	<div class="container">
		<div class="navi">
			<div>
				<img src="TrycatchLogo.png" style="width: 100%; height: 100%;">
			</div>
			<div>마이페이지</div>
			<div>마이페이지</div>
			<div>커뮤니티</div>
			<div>Q&A</div>
		</div>
		<div class="title">
			<div>Q&A 게시판</div>
			<div class="btn">
				<button id="back" type="button">목록으로 돌아가기</button>
				<script>
	 $("#back").on("click",function(){
		 let last_cpage = sessionStorage.getItem("last_cpage");
		 location.href="/list.board?cpage="+last_cpage;
	 })
	</script>
			</div>
		</div>
		<hr style="border: 5px solid black;">
		<div class="contents">
			<div class="boardInfo">
				<table>
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 40%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 10%;">
					</colgroup>
					<tr>
						<th>${dto.q_seq}</th>
						<th>${dto.title}</th>
						<th>${dto.m_nickname}</th>
						<th>${dto.write_date}</th>
					</tr>
				</table>
			</div>
			<hr style="border: 2px solid black; width: 100%;">
			<div class="boardContents">
				<div>${dto.contents}</div>
			</div>
			<c:choose>
			<c:when test="${loginID == 'admin'}">
				<form action="/add.answer">
					<div style="width: 100%; height: 100%; padding: 50px;">
						<div class="addReply">
							<input type="hidden" name="q_parent_seq" value="${dto.q_seq}">
							<div class="inputReplyText">
								<textarea style="resize: none;" name="answer"
									placeholder="댓글을 입력해주세요"></textarea>
							</div>

							<div class="addReplyBtn">
								<button id="addBtn">등록</button>
							</div>
						</div>
					</div>
				</form>
			</c:when>
			<c:when test="${loginID != 'admin'}">
				<div style="text-align: center; padding: 20px;">
					<p>관리자만 답변을 작성할 수 있습니다.</p>
				</div>
			</c:when>
			</c:choose>
			<table class="answerList" border="1" align="center" width="700"
		cellpadding="10">
				<c:forEach var="answer" items="${lists}">
					<tr>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
	<div class="footer">Footer</div>



</body>
</html>