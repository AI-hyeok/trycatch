<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardDetail</title>
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

#replyList{
width:100%;
height:100%;
}
</style>
<script>
	$(function() {
		$.ajax({
			url:"/replyList.reply",
			data:{c_parent_seq:"${DTO.c_seq}"}
		}).done(function(resp) {
					resp = JSON.parse(resp);
					let contentHTML = '';

					resp.forEach(function(dtoList) {
						contentHTML += "<tr class='replyTr'>" + 
										"<td class='r_seq'>" + dtoList.r_seq + "</td>" +
										"<td>" + dtoList.m_nickname + "</td>" +
										"<td class='rEditable'>" + dtoList.contents + "</td>" + 
										"<td>" + dtoList.write_date + "</td>";
										
						
						if (dtoList.m_id == "${loginID}") {
							contentHTML += "<td id='updateBtnArea'>" + 
											"<button type='button' class='updateReplyBtn'>수정</button></td>" +
											"<td><button type='button' class='deleteReplyBtn' data-rseq='" + dtoList.r_seq + "'>삭제</button></td></tr>";
						}
					});
					
					$("#replyList").html(contentHTML); 
					
					$(".deleteReplyBtn").on("click", function(){
						let result = confirm("댓글을 삭제하시겠습니까?")
						if(result){
							let r_seq = $(this).closest("tr").find(".r_seq").text(); 
							location.href="/deleteReply.reply?c_seq=${DTO.c_seq}&r_seq=" + r_seq;
							
						}else{
							location.back();
						}
					});
					
				});
			});
</script>
</head>
<body>
	<div class="container">
		<div class="navi">
			<div>
				<img src="TrycatchLogo.png" style="width: 100%; height: 100%;">
			</div>
			<div>마이페이지</div>
			<div>전체 랭킹</div>
			<div>커뮤니티</div>
			<div>Q&A</div>
		</div>
		<div class="title">
			<div>자유게시판</div>
			<div class="btn">
				<form action="/update.comboard" method="post" id="frm">
					<input type="hidden" name="c_seq" id="hdC_seq" value="${DTO.c_seq}">
					<input type="hidden" name="title" id="hdTitle"> <input
						type="hidden" name="contents" id="hdContent">
					<c:choose>
						<c:when test="${DTO.m_id == loginID}">
							<button id="updateBtn" type="button">수정</button>
							<script>
				            $("#updateBtn").on("click", function(){
			            		$(".editable").attr("contenteditable", "true");
			            		$("#updateBtn, #delBtn, #backToListBtn").css("display", "none");
			            		
			            		
			            		let updateDoneBtn = $("<button>");
			            		updateDoneBtn.html("수정완료");
			            		
			            		updateDoneBtn.on("click", function(){
			            			let content = $("#comboardContents").summernote('code');
			            	        $("#hdTitle").val($("#comboardTitle").html());
			            	        $("#hdContent").val(content);
			            	        $("#frm").submit();
			            	    });
			            		
			            		let updateCancleBtn = $("<button>");
			            		updateCancleBtn.attr("type","button");
			            		updateCancleBtn.html("수정 취소");
			            		updateCancleBtn.on("click", function(){
								location.reload();
			            		});
			            	
				            	$(".btn").append(updateDoneBtn);
								$(".btn").append(updateCancleBtn);
								
								$('#comboardContents').summernote({
		    	        	        
			     	        	       // 에디터 크기 설정
			     	        	       height: 800,
			     	        	       // 에디터 한글 설정
			     	        	       lang: 'ko-KR',
			     	        	       // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
			     	        	       toolbar: [
			     	        	            // 글자 크기 설정
			     	        	            ['fontsize', ['fontsize']],
			     	        	            // 글자 [굵게, 기울임, 밑줄, 취소 선, 지우기]
			     	        	            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			     	        	            // 글자색 설정
			     	        	            ['color', ['color']],
			     	        	            // 표 만들기
			     	        	            ['table', ['table']],
			     	        	            // 서식 [글머리 기호, 번호매기기, 문단정렬]
			     	        	            ['para', ['ul', 'ol', 'paragraph']],
			     	        	            // 줄간격 설정
			     	        	            ['height', ['height']],
			     	        	            // 이미지 첨부
			     	        	            ['insert',['picture']]
			     	        	          ],
			     	        	          // 추가한 글꼴
			     	        	        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			     	        	         // 추가한 폰트사이즈
			     	        	        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72','96'],
			     	        	          // focus는 작성 페이지 접속시 에디터에 커서를 위치하도록 하려면 설정해주세요.
			     	        	        focus : true,
			     	        	          // callbacks은 이미지 업로드 처리입니다.
			     	        	        callbacks : {                                                    
			     	        	           onImageUpload : function(files, editor, welEditable) {   
			     	        	                  // 다중 이미지 처리를 위해 for문을 사용했습니다.
			     	        	              for (var i = 0; i < files.length; i++) {
			     	        	                 imageUploader(files[i], this);
			     	        	              }
			     	        	           }
			     	        	        }
			     	        	        
			     	        	    });
								
				            });
				            </script>
							<button id="delBtn" type="button">삭제</button>
										<script>
								$("#delBtn").on("click",function(){
									let result = confirm("게시물을 삭제하시겠습니까?")
									if(result){
										location.href="/delete.comboard?c_seq=${DTO.c_seq}";
									}else{
										location.href="/list.comboard?cpage=1";
									}
								})
							</script>
						</c:when>
					</c:choose>
				</form>

				<script>
				$(document).on("click", ".updateReplyBtn", function(){
				let parentTr = $(this).closest("tr");
				parentTr.find(".rEditable").attr("contenteditable", "true");
				parentTr.find(".updateReplyBtn, .deleteReplyBtn").css("display", "none");
								
				if(parentTr.find(".replyDoneBtn").length === 0){
					let replyDoneBtn = $("<button>");
					replyDoneBtn.attr("type", "button");
					replyDoneBtn.html("수정완료");
									
									
					let upCancel = $("<button>");
						upCancel.attr("type", "button");
						upCancel.html("취소");
						upCancel.addClass("upCancel")
						upCancel.on("click", function(){
							location.reload();
						});
										
					replyDoneBtn.on("click", function(){
						let parentTr = $(this).closest("tr");
						$(this).remove();
						parentTr.find(".upCancel").remove();
						parentTr.find(".updateReplyBtn, .deleteReplyBtn").css("display", "inline-block");
						
						let updatedContent = parentTr.find(".rEditable").html();
						let r_seq = parentTr.find(".r_seq").text();
						         
						$.ajax({
							url:"/updateReply.reply",
							type:'post',
							data:{
								seq:r_seq,
							    contents:updatedContent}
						}).done(function(resp){
							            		
							resp = JSON.parse(resp);
							parentTr.find(".rEditable").html(resp);
							            		
						});	            
						
					});
										
					parentTr.find("#updateBtnArea").append(replyDoneBtn);
					parentTr.find("#updateBtnArea").append(upCancel);
				}
			});
				</script>

				<button id="backToListBtn" type="button">목록으로 돌아가기</button>
				<script>
				$("#backToListBtn").on("click", function(){
					let last_cpage = sessionStorage.getItem("last_cpage");
					if(last_cpage == null){
						last_cpage = 1;
					}
					location.href="/list.comboard?cpage="+last_cpage; 
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
						<th id="comboardC_seq">${DTO.c_seq}</th>
						<th id="comboardTitle" class="editable">${DTO.title}</th>
						<th>${DTO.m_nickname}</th>
						<th>${DTO.write_date}</th>
						<th>${DTO.view_count}</th>
					</tr>
				</table>
			</div>
			<hr style="border: 2px solid black; width: 100%;">
			<table>
				<colgroup>
					<col style="width: 30%;">
					<col style="width: 70%;">
				</colgroup>
				<tr style="padding-left: 30px; padding-top: 30px;">
					<th colspan="1">첨부파일</th>
					<th>
					<c:forEach var="i" items="${Files}">
					<a href="/download.files?filename=${i.sysName}&oriname=${i.oriName}">${i.oriName}</a><br>
					</c:forEach>
					</th>
				</tr>
			</table>
			<div class="boardContents">
				<div id="comboardContents" class="editable">${DTO.contents}</div>

			</div>
			<div style="width: 100%; height: 100%; padding: 50px;">
<c:choose>
			<c:when test="${loginID != null}">
				<form action="/insertReply.reply" method="post">
					<input type="hidden" name="c_seq" id="hdC_seq" value="${DTO.c_seq}">
					<input type="hidden" name="m_id" id="hdM_id" value="${loginID}">
					<div class="addReply">
						<div class="inputReplyText">
							<textarea id="replyText" name="contents" style="resize: none;" placeholder="댓글을 입력해주세요"></textarea>
						</div>
						<div class="addReplyBtn">
							<button id="addReplyBtn" class="addBtn">등록</button>
						</div>
					</div>
				</form>
				</c:when>
				<c:otherwise>
				<div class="addReply">
						<div class="inputReplyText">
							<textarea name="contents" style="resize: none;" placeholder="댓글을 입력해주세요"></textarea>
						</div>
						<div class="addReplyBtn">
							<button id="addBtnNull" type="button">등록</button>
						</div>
					</div>
			        <script>
			            $("#addBtnNull").on("click", function(){
			            	alert("로그인 후 댓글을 작성할 수 있습니다.")
			            });
			        </script>
			    </c:otherwise>
				</c:choose>
			</div>
			<div class="replyList">
				<div id="replyListDiv" class="replys">
					<table id="replyList"></table>
				</div>
				<div class="pageNavi">
					<c:if test="${replyneedPrev}">
						<span class="paging" page="${replystartNavi-1}">< </span>
					</c:if>
					<c:forEach var="i" begin="${replystartNavi}" end="${replyendNavi}">
						<span class="paging" page="${i}">${i}&nbsp</span>
					</c:forEach>
					<c:if test="${replyneedNext}">
						<span class="paging" page="${replyendNavi+1}">&nbsp></span>
					</c:if>
				</div>
				<script>
					$(".paging").on("click", function(){
						let pageNum = $(this).attr("page");
						sessionStorage.setItem("last_cpage", pageNum);
						location.href="/replyList.reply?cpage="+pageNum;
					})
				</script>
			</div>
		</div>
		<div class="footer">Footer</div>
	</div>
</body>
</html>