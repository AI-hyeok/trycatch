<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
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

.navi > div {
    height: 100%;
}

.title {
    height: 80px;
    font-size: 30px;
    margin-bottom: 10px;
    margin-top: 20px;
}

.title > div {
    font-weight: bold;
}



/* 수정된 replyList 스타일 */
#replyList {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    background-color: rgba(255, 255, 255, 0.9); /* 투명한 하얀색 배경 */
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 효과 */
}

#replyList th,
#replyList td {
    padding: 15px;
    text-align: center;
    font-family: 'Arial', sans-serif;
    font-size: 14px;
}

#replyList th {
    background-color: rgba(78, 51, 128, 0.7); /* 어두운 보라색 */
    color: white;
    border-bottom: 2px solid #ddd;
}

#replyList td {
    background-color: rgba(245, 245, 245, 0.7); /* 연한 회색 배경 */
    border-bottom: 1px solid #ddd;
    color: #333; /* 어두운 회색 텍스트 */
}

#replyList tr:hover {
    background-color: rgba(0, 0, 0, 0.05); /* 마우스 오버 시 배경색 변경 */
}

#replyList .rEditable {
    background-color: rgba(255, 255, 255, 0.7); /* 댓글 수정시 배경 */
    border-radius: 5px;
    padding: 10px;
    font-size: 13px;
    color: #555; /* 어두운 회색 글씨 */
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

#delBtn,
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
.updateDoneBtn{
    background-color: rgba(78, 51, 128, 0.6); /* 버튼 배경색 */
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 13px;
    height: 50%;
    width: 10%;
    margin: 5px;
}


#backToListBtn {
    background-color: rgba(78, 51, 128, 0.6); /* 버튼 배경색 */
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
    background-color: rgba(78, 51, 128, 0.6); /* 버튼 배경색 */
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 13px;
    width: 10%;
}

.updateReplyBtn,
.deleteReplyBtn,
.upCancel{
    background-color: rgba(78, 51, 128, 0.6); /* 버튼 배경색 */
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 13px;
    width: 40%;
    margin: 5px;
}
.upDone {
    background-color: rgba(78, 51, 128, 0.6); /* 버튼 배경색 */
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 13px;
    margin: 5px;
    width:60%;
}
#updateBtn:hover,
.updateCancleBtn:hover,
.updateDoneBtn:hover,
#backToListBtn:hover,
#addReplyBtn:hover,
#addBtnNull:hover,
.updateReplyBtn:hover,
.deleteReplyBtn:hover,
.upCancel:hover,
.upDone:hover {
    background-color: rgba(78, 51, 128, 0.8); /* 버튼 호버 효과 */
    transition: background-color 0.3s ease;
}

.addReply textarea {
    border-radius: 10px;
    border: 1px solid #ddd;
    padding: 10px;
    font-size: 14px;
    resize: none;
    background-color: rgba(255, 255, 255, 0.9); /* 댓글 입력창 투명한 하얀색 */
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
    background-color: rgba(255, 255, 255, 0.7); /* 페이지 네비 버튼 */
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

#comboardContents {
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
}

.addReplyBtn {
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

.footer > div {
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
    padding-left: 30px;
    padding-right: 30px;
    margin-top: 10px;
    margin-bottom: 5px;
}

.boardTitle > th {
    height: 100%;
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
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
    align-items: start; /* 세로 중앙 정렬 */
    text-align: center;
}

.replyContents > div {
    display: flex;
    align-items: start;
    text-align: center;
}

.replyContents {
    width: 70%;
    padding:10px;
}

.replyTr{
background-color:rgba(255, 255, 255, 0.5);
}
.dropdown-toggle::after {
	display:none;
	}
.note-dropdown-menu {
    z-index: 1050 !important;
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
             
             if(resp.length == 0){
                $(".replyList").css("display", "none");
             }else{
                resp.forEach(function(dtoList) {
                contentHTML += "<tr class='replyTr'>" + 
                			"<td><div class='r_seq'>"+dtoList.r_seq +
                            "<td class='replyContents'>"+ dtoList.m_nickname +
                            "</div><div class='col-12 rEditable'>" + dtoList.contents + "</div>" + 
                            "</div><div>&nbsp작성일:"+ dtoList.write_date + "</div>" +
                            "</td>";


                            
                
                if (dtoList.m_id == "${loginID}") {
                   contentHTML += "<td id='updateBtnArea'>" + 
                               "<button type='button' class='updateReplyBtn'>수정</button>" +
                               "<button type='button' class='deleteReplyBtn' data-rseq='" + dtoList.r_seq + "'>삭제</button></td></tr>";
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
			<div class="col-12 titleDetail">자유게시판</div>

			
				<form action="/update.comboard" method="post" id="frm">
					<input type="hidden" name="c_seq" id="hdC_seq" value="${DTO.c_seq}">
					<input type="hidden" name="title" id="hdTitle"> 
					<input type="hidden" name="contents" id="hdContent">
					<div class="row btn">
					<c:choose>
						<c:when test="${DTO.m_id == loginID}">
							<button id="updateBtn" type="button">수정</button>
							<script>
				            $("#updateBtn").on("click", function(){
			            		$(".editable").attr("contenteditable", "true");
			            		$("#updateBtn, #delBtn, #backToListBtn").css("display", "none");
			            		
			            		
			            		let updateDoneBtn = $("<button>");
						updateDoneBtn.addClass("updateDoneBtn");
			            		updateDoneBtn.html("수정완료");
			            		
			            		updateDoneBtn.on("click", function(){
			            			let content = $("#comboardContents").summernote('code');
			            	        $("#hdTitle").val($("#comboardTitle").html());
			            	        $("#hdContent").val(content);
			            	        $("#frm").submit();
			            	    });
			            		
			            		let updateCancleBtn = $("<button>");
						updateCancleBtn.addClass("updateCancleBtn");
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
			     	        	            ['height', ['height']]
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
				</div>
				</form>

				<script>
				$(document).on("click", ".updateReplyBtn", function(){
				let parentTr = $(this).closest("tr");
				parentTr.find(".rEditable").attr("contenteditable", "true");
				parentTr.find(".updateReplyBtn, .deleteReplyBtn").css("display", "none");
								
				if(parentTr.find(".replyDoneBtn").length === 0){
					let replyDoneBtn = $("<button>");
					replyDoneBtn.attr("type", "button");
					replyDoneBtn.addClass("upDone")
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
				</div>

				
		
		<div class="row contents">
			<div class="row boardInfo">
				<table class="col-12">
					<tr class="row boardTitle" style="margin-bottom:5px;">
						<th class="col-2 d-none d-md-block col-md-2" id="comboardC_seq">${DTO.c_seq}</th>
						<th class="col-7 col-md-7" id="comboardTitle" class="editable">${DTO.title}</th>
						<th class="col-3 col-md-3">${DTO.m_nickname}</th>
					</tr>
				</table>
			</div>
			






			<div class="row boardContents">
				<div class="col-12">
					<div class="col-6" style="float:left; font-size:13px;">작성일:${DTO.write_date}</div>
					<div class="col-6" style="float:left;  font-size:13px; text-align:right;">조회수:${DTO.view_count}</div>
				</div>

				<div id="comboardContents" class="editable">${DTO.contents}</div>

			</div>


			<div class="row files">
				<div class="row fileList">
					<div class="col-2 addFileTitle">첨부파일</div>
					<div class="col-7 downloadFile">
					<c:forEach var="i" items="${Files}">
					<a href="/download.files?filename=${i.sysName}&oriname=${i.oriName}">${i.oriName}</a><br>
					</c:forEach>
					</div>
					<div class="col-3 listBtn">
						<button id="backToListBtn" type="button">목록</button>
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
			</div>

			<c:choose>
			<c:when test="${loginID != null}">
				<form action="/insertReply.reply" method="post">
					<input type="hidden" name="c_seq" id="hdC_seq" value="${DTO.c_seq}">
					<input type="hidden" name="m_id" id="hdM_id" value="${loginID}">
					<div class="row addReply">
						<div class="inputReplyText">
							<textarea class="col-12 d-none d-md-block col-md-12" id="replyText" name="contents" style="resize: none;" placeholder="댓글을 입력해주세요"></textarea>
						</div>
						<div class="col-12 addReplyBtn">
							<button class="col-12 d-none d-md-block col-md-12" id="addReplyBtn" class="addBtn">댓글 등록</button>
						</div>
						
						<script>
                         $("#addReplyBtn").on("click", function(){
                            if($("#replyText").val() == ""){
                               alert("댓글을 입력해주세요.");
                                 $("#replyText").focus();
                                 event.preventDefault();
                                 return false;
                            }
                         })
                      </script>
					</div>
				</form>
				</c:when>
				<c:otherwise>
				<div class="row addReply">
						<div class="inputReplyText">
							<textarea class="col-12 d-none d-md-block col-md-12" name="contents" style="resize: none;" placeholder="댓글을 입력해주세요"></textarea>
						</div>
						<div class="col-12 addReplyBtn">
							<button class="col-12 d-none d-md-block col-md-12" id="addBtnNull" type="button">댓글 등록</button>
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



			<div class="row replyList">
				<div id="replyListDiv" class="col-12 replys">
					<table class="col-12" id="replyList"></table>
				</div>

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
	</div>
</body>
</html>