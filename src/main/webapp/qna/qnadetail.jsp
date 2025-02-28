<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>BoardDetail</title>
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
		}

		.container {
			width: 90%;
			margin: auto;
		}

		.navi {
			width: 100%;
			height: 80px;
			margin-bottom: 50px;
		}

		.navi>div {
			height: 100%;
		}

		.title {
			height: 80px;
			font-size: 30px;
			margin-bottom: 10px;
			margin-top: 20px;
		}

		.title>div {
			font-weight: bold;

		}


		#answerList {
			width: 100%;
			border-collapse: collapse;
			table-layout: fixed;
			background-color: rgba(255, 255, 255, 0.9);
			/* 투명한 하얀색 배경 */
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			/* 부드러운 그림자 효과 */
		}

		#answerList th,
		#answerList td {
			padding: 15px;
			text-align: center;
			font-family: 'Arial', sans-serif;
			font-size: 14px;
		}

		#answerList th {
			background-color: rgba(78, 51, 128, 0.7);
			/* 어두운 보라색 */
			color: white;
			border-bottom: 2px solid #ddd;
		}

		#answerList td {
			background-color: rgba(245, 245, 245, 0.7);
			/* 연한 회색 배경 */
			border-bottom: 1px solid #ddd;
			color: #333;
			/* 어두운 회색 텍스트 */
		}

		#answerList tr:hover {
			background-color: rgba(0, 0, 0, 0.05);
			/* 마우스 오버 시 배경색 변경 */
		}

		#answerList .rEditable {
			background-color: rgba(255, 255, 255, 0.7);
			/* 댓글 수정시 배경 */
			border-radius: 5px;
			padding: 10px;
			font-size: 13px;
			color: #555;
			/* 어두운 회색 글씨 */
		}



		#updateBtnArea {
			height: 100%;
		}

		#frm {
			height: 100%;
		}

		.btn {
			height: 100%;
			width: 100%;
			display: flex;
			justify-content: end;
			align-items: center;
		}

		#deleteBtn,
		#updateBtn {
			background-color: rgba(78, 51, 128, 0.6);
			color: white;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			font-size: 13px;
			height: 50%;
			width: 10%;
			margin: 5px;
		}


		.updateCancleBtn,
		.updateDoneBtn,
		#backToListBtn {
			background-color: rgba(78, 51, 128, 0.6);
			/* 버튼 배경색 */
			color: white;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			font-size: 13px;
			height: 80%;
			width: 33%;
		}


		#addReplyBtn,
		#addBtnNull {
			background-color: rgba(78, 51, 128, 0.6);
			/* 버튼 배경색 */
			color: white;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			font-size: 13px;
			width: 10%;
		}



		.editAnswerBtn,
		.deleteAnswerBtn,
		.upCancel,
		.upDone {
			background-color: rgba(78, 51, 128, 0.6);
			/* 버튼 배경색 */
			color: white;
			padding: 5px 10px;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			font-size: 13px;
			width: 40%;
			margin: 5px;
		}

		#updateBtn:hover,
		.updateCancleBtn:hover,
		.updateDoneBtn:hover,
		#backToListBtn:hover,
		#addReplyBtn:hover,
		#addBtnNull:hover,
		.editAnswerBtn:hover,
		.deleteAnswerBtn:hover,
		.upCancel:hover,
		.upDone:hover {
			background-color: rgba(78, 51, 128, 0.8);
			/* 버튼 호버 효과 */
			transition: background-color 0.3s ease;
		}

		.addReply textarea {
			border-radius: 10px;
			border: 1px solid #ddd;
			padding: 10px;
			font-size: 14px;
			resize: none;
			background-color: rgba(255, 255, 255, 0.9);
			/* 댓글 입력창 투명한 하얀색 */
			width: 100%;
		}

		.addReply button {
			background-color: rgba(78, 51, 128, 0.6);
			color: white;
			padding: 10px 15px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 14px;
		}

		.addReply button:hover {
			background-color: rgba(78, 51, 128, 0.8);
			transition: background-color 0.3s ease;
		}

		.pageNavi .paging {
			cursor: pointer;
			padding: 5px 10px;
			margin: 0 5px;
			border: 1px solid #ddd;
			border-radius: 5px;
			background-color: rgba(255, 255, 255, 0.7);
			/* 페이지 네비 버튼 */
		}

		.pageNavi .paging:hover {
			background-color: rgba(0, 0, 0, 0.05);
		}

		.contents {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-bottom: 50px;
			margin-top: 60px;
			background-color: rgba(255, 255, 255, 0.861);
			border-top: 20px solid rgba(78, 51, 128, 0.621);
			padding-bottom: 0px;
			border-bottom: 5px solid rgba(109, 77, 168, 0.621);
		}

		.titleDetail {
			display: flex;
			justify-content: center;
			align-items: center;
			color: white;
			font-size: 50px;
		}

		table {
			width: 100%;
			border-collapse: collapse;
			table-layout: fixed;
		}

		#comboardC_seq {
			height: 100%;
		}

		.files {
			margin: 10px;
			height: 50px;
			padding-right: 30px;
			padding-left: 30px;
		}

		.addFileTitle {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.boardContents {
			padding: 20px;
			padding-bottom: 0px;
		}

		.downloadFile {
			display: flex;
			justify-content: start;
			align-items: center;
		}

		#contentDiv {
			border: 1px solid black;
			padding: 20px;
			background-color: rgba(255, 255, 255, 0.861);
			min-height: 500px;
			margin-top: 5px;
			border: none;
		}



		.addReply {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 0px;
			margin-bottom: 15px;
			padding: 15px;
			padding-top: 0px;
			width:100%;
		}
		




		.replyBtnCon {
			display: flex;
			justify-content: end;
			align-items: center;
			margin-top: 5px;
			padding-right: 30px;
		}

		.addBtn {
			padding: 10px 20px;
			margin-top: 10px;
		}

		.replyList {
			padding: 20px;
			padding-bottom: 0px;
			padding-top: 0px;
			border-top: 5px solid rgba(109, 77, 168, 0.621);
			background-color: rgba(255, 255, 255, 0.861);
			border-bottom: 20px solid rgba(78, 51, 128, 0.621);
		}



		.pageNavi {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 30px;
		}


		hr {
			margin: 0px;
		}


		textarea {
			height: 100%;
			width: 100%;
			padding: 10px;
			border: 1px solid #ccc;
			border-radius: 10px;
		}

		.replyList {
			padding: 50px;
		}



		.boardInfo {
			height: 60px;
			text-align: center;
			padding-left: 20px;
			padding-right: 20px;
			border-bottom: 3px solid rgba(109, 77, 168, 0.621);
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
			border: none;

		}



		.backBtn {
			padding-right: 20px;
			display: flex;
			justify-content: end;
			align-items: center;
		}

		.paging:hover {
			background-color: rgba(255, 255, 255, 0.761);
			border: 1px solid black;
			border-radius: 3px;
		}

		input[type="button"] {
			cursor: pointer;
		}


		.headerLogoImg {
			width: 200px;
			height: auto;
		}

		.listBtn {
			display: flex;
			justify-content: end;
			align-items: center;
		}

		#btn {
			display: flex;
			justify-content: end;
			align-items: center;
			padding-right: 30px;
		}

		#comboardTitle {
			text-align: left;
		}



		.inputReplyText {
			width:90%;
			padding-left: 30px;
			padding-right: 30px;
			margin-top: 10px;
			margin-bottom: 5px;
		}



		.boardTitle>th {
			height: 100%;
			display: flex;
			align-items: center;
			/* 세로 중앙 정렬 */
			text-align: center;
		}


		.r_seq {
			vertical-align: middle !important;
		}






		#updateBtnArea {
			height: 100%;
		}

		.rEditable {
			height: 50px;
			margin-top: 5px;
			margin-bottom: 5px;
			display: flex;
			align-items: start;
			/* 세로 중앙 정렬 */
			text-align: center;
		}

		.replyContents>div {
			display: flex;
			align-items: start;
			text-align: center;
		}

		.replyContents {
			width: 70%;
		}
	</style>

	<script>
		$(function () {
			$.ajax({
				url: "/answerlist.answer",
				data: { q_parent_seq: "${dto.q_seq}" }
			}).done(function (resp) {
				resp = JSON.parse(resp);
				let contentHTML = '';

				resp.forEach(function (dtoList) {
					contentHTML += "<tr class='answerTr'>" +
						"<td class='rEditable' name='contents'>" + dtoList.contents + "</td>";

					if ("${loginID}" == "admin") {
						contentHTML += "<td id='updateBtnArea'>" +
							"<button type='button' class='editAnswerBtn' data-aseq='" + dtoList.a_seq + "' data-parentseq='" + ${ dto.q_seq } + "'>수정</button></td>" +
								"<td><button type='button' class='deleteAnswerBtn' data-aseq='" + dtoList.a_seq + "' data-parentseq='" + ${ dto.q_seq } + "'>삭제</button></td></tr>";
					} else {
						contentHTML += "<td></td><td></td></tr>";
					}
				});

				$("#answerList").html(contentHTML);
			});


			// 이벤트 위임을 사용하여 동적 요소에 이벤트 적용
			$(document).on("click", ".editAnswerBtn", function () {
				let a_seq = $(this).data("aseq"); // 해당 답변의 ID
				let q_seq = $(this).data("parentseq");
				let currentContent = $(this).closest("tr").find(".rEditable").text().trim(); // 해당 답변 내용

				let newContent = prompt("수정할 답변을 입력하세요:", currentContent);

				if (newContent === null || newContent.trim() === "") {
					alert("수정이 취소되었습니다.");
					return; // 여기서 함수 종료
				}

				if (newContent.trim() === "") {
					alert("내용을 입력하세요.");
					return;
				}



				$.ajax({
					url: "/update.answer",
					type: "POST",
					data: { a_seq: a_seq, contents: newContent.trim(), q_seq: q_seq },
					success: function () {

						alert("답변이 수정되었습니다.");
						location.reload();
					},
					error: function () {
						alert("수정에 실패했습니다.");
					}
				});
			});

			$(document).on("click", ".deleteAnswerBtn", function () {
				let a_seq = $(this).data("aseq");
				let q_seq = $(this).data("parentseq");
				let confirmDelete = confirm("정말로 이 답변을 삭제하시겠습니까?");
				if (confirmDelete) {
					$.ajax({
						url: "/delete.answer",
						type: "POST",
						data: { a_seq: a_seq, q_seq: q_seq },
						success: function (response) {
							alert("답변이 삭제되었습니다.");
							location.reload();
						},
						error: function () {
							alert("삭제에 실패했습니다.");
						}
					});
				}
			});
		});
	</script>
</head>

<body>
	<img class="background-img" src="qna/images/BGI.jpg">
	<div class="row container">
		<header class="d-flex align-items-center p-3">
			<h1 class="h1 flex-grow-1 trycatch ">
				<img class="headerLogoImg" src="qna/images/LogoW.png">
			</h1>
		</header>
		<div class="row title">
			<div class="col-12 titleDetail">Q&A게시판</div>
			<div class="title">
				<div class="btn">
					<button id="back" type="button">목록으로 돌아가기</button>
					<script>
						$("#back").on("click", function () {
							let last_cpage = sessionStorage.getItem("last_cpage");
							if(last_cpage == null){
		                           last_cpage = 1;
		                        }
							location.href = "/qnalist.qnaboard?cpage=" + last_cpage;
						})
					</script>
				</div>
			</div>
			
		</div>
		<div class="row contents">
			<div class="row boardInfo">
				<table class="col-12 ">
					
					<tr class="row boardTitle" style="margin-bottom:5px;">
						<th class="col-2 d-none d-md-block col-md-2" id="comboardC_seq">글번호:${dto.q_seq}</th>
						<th class="col-5 col-md-5" id="comboardTitle" class="editable">제목:${dto.title}</th>
						<th class="col-2 col-md-2">작성자:${dto.m_nickname}</th>
						<th class="col-3 col-md-3">작성일:${dto.timeLabel}</th>
					</tr>
				</table>
			</div>
			
			<div class="row boardContents">
				<div class="col-12" >
					<div id="contentDiv">${dto.contents}</div>
				<textarea id="contentEdit" style="display: none; width: 100%; height: 100%;">${dto.contents}</textarea>
			</div>
			<c:choose>
				<c:when test="${loginID == 'admin' || loginID == writerID}">
					<button id="deleteBtn">삭제</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${loginID == writerID}">
					<button id="updateBtn">수정</button>
					<button id="saveBtn" style="display: none;">저장</button>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${loginID == 'admin'}">
					<form action="/add.answer">
						<div style="width: 100%; height: 100%; padding: 50px;">
							<div class="addReply">
								<input type="hidden" name="q_parent_seq" value="${dto.q_seq}">
								<div class="inputReplyText">
									<textarea style="resize: none;" name="answer" placeholder="댓글을 입력해주세요"></textarea>
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
			<table id="answerList" border="1" align="center" width="700" cellpadding="10">



			</table>
		</div>
	</div>
	<script>

		$("#deleteBtn").on("click", function () {
			let confirmDelete = confirm("정말로 이 게시글을 삭제하시겠습니까?");
			if (confirmDelete) {
				location.href = "/delete.qnaboard?q_seq=${dto.q_seq}";
			}
		});

		$(document).ready(function () {
			$("#updateBtn").on("click", function () {
				// 내용 div 숨기고 textarea 보이게 하기
				$("#contentDiv").hide();
				$("#contentEdit").show();

				// 수정 버튼 숨기고 저장 버튼 보이게 하기
				$("#updateBtn").hide();
				$("#saveBtn").show();
			});

			$("#saveBtn").on("click", function () {
				let updatedContent = $("#contentEdit").val(); // 수정된 내용 가져오기
				let q_seq = "${dto.q_seq}";

				$.ajax({
					url: "/update.qnaboard",
					type: "POST",
					data: { q_seq: q_seq, contents: updatedContent },
					success: function (response) {
						alert("게시글이 수정되었습니다.");
						location.reload(); // 페이지 새로고침
					},
					error: function () {
						alert("수정에 실패했습니다.");
					}
				});
			});

		});

	</script>
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
	</div>
</body>

</html>