<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BoardWrite</title>
    <style>
        *{box-sizing: border-box;}


        .container{
            width:90%;
            margin:auto;
        }

        .navi{
            width:100%;
            height:100px;
            margin-bottom:50px;
        }
        .navi>div{
            float:left;
            width:20%;
            height:100%;
        }

        .title{
            width:100%;
            height:80px;
            font-size:35px;
            padding-left: 30px;
            padding-top: 30px;
        }
        .title>div{
            font-weight: bold;
        }

        .subTitle{
            width:100%;
            height:40px;
            padding-left:30px;
            padding-right:30px;
            margin-top: 50px;
        }
        .subTitle>div{
            float:left;
            height:100%;
        }
        .subtitleText{
            width:70%;
            font-size:25px;
            font-weight: bold;
        }
        .btns{
            width:30%;
            display:flex;
            justify-content:end;
            align-items: center;
        }

        
        .boardTitle{
            width:100%;
            height:250px;
            padding:30px;
        }
        .boardTitle>div{
            width:100%;
        }
        .titleText{
            border:1px solid black;
            padding-bottom:15px;
            padding-top: 30px;
            padding-left: 50px;
            padding-right: 50px;
            width:100%;
            height:40%;
            border-top-left-radius:10px;
            border-top-right-radius:10px;
            font-size: 25px;
            font-weight: bold;
            border-bottom: none;
        }
        .inputTitle{
            border:1px solid black;
            padding-bottom:30px;
            padding-top: 15px;
            padding-left: 50px;
            padding-right: 50px;
            width:100%;
            height:60%;
            border-bottom-right-radius:10px;
            border-bottom-left-radius:10px;
            border-top:none;
        }
        input{
            width:100%;
            height:100%;
            border-radius:10px;
            border-color: rgb(207, 207, 207);
            background-color:rgb(207, 207, 207);
            color:grey;
            font-size: large;
        }
        
        .InputContents{
            
            width:100%;
            height:800px;
            padding:30px;
        }
        .editor{
            border:1px solid black;
            width:100%;
            height:100%;
        }

        .footer{
            width:100%;
            height:400px;
            background-color: black;
            color:white;
        }

        button{
            margin-left: 10px;
            border-radius:0px;
            background-color: white;
            font-size:18px;
            padding:5px;
            width:100px;
        }
        
        textarea{
        width:100%;
        height:100%;
        }

    </style>
</head>
<body>
<form action="/insert.comboard" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
<input type="hidden" name="selectNotice" id="selectNotice">
<script>
	if((document.getElementById("myCheckbox").checked)){
		$("#selectNotice").val("Y");
	}else {
		$("#selectNotice").val("N");
	}

</script>
    <div class="container">
        <div class="navi">
            <div><img src="TrycatchLogo.png" style="width:100%; height:100%;"></div>
            <div>마이페이지</div>
            <div>전체 랭킹</div>
            <div>커뮤니티</div>
            <div>Q&A</div>
        </div>
        <div class="title">
            <div>커뮤니티</div>
        </div>
        <hr style="border:5px solid black;">
        <div class="subTitle">
            <div class="subtitleText">커뮤니티 글쓰기</div>
            <div class="btns">
            <c:choose>
            	<c:when test="${loginID == 'admin'}">
	 			<input type="checkbox" id="myCheckbox" name="noticeCheckbox" value="Y">
	 			<label for="myCheckbox">공지 등록</label>
	 			</c:when>
	 		</c:choose>
                <a href="/list.comboard"><button type="button">목록보기</button></a>
                <button id="insertBoard">글 등록</button>
                <script>
                $("#insertBoard").on("click", function(){
                	if($("#inputTitle").val() == ""){
                		alert("제목을 입력해주세요.");
           			 	$("#inputTitle").focus();
                        event.preventDefault();
                        return false;
                	}
                	if($("#contents").val() == ""){
            			alert("내용을 입력해주세요.");
            			$("#contents").focus();
                        event.preventDefault();
                        return false;
            		}
                })
                </script>
            </div>
        </div>
        <hr style="border:2px solid black; width:97%;">
	        <div class="boardTitle">
	            <div class="titleText">자유게시판</div>
	            <div class="inputTitle"><input name="title" id="inputTitle" type="text" placeholder="제목을 입력해주세요"></div>
	        </div>
	        <div class="inputFiles">
              <input class="files" id="file1" type="file" name="file1">
              <input class="files" type="file" name="file2">
           </div>
	        <div class="InputContents">
	            <div class="editor"><textarea id="contents" name="contents" placeholder="내용을 입력해주세요."></textarea></div>
	        </div>
	        <div class="footer">
	            Footer
	        </div>
    </div>
</form>
<script>
	        	 $('#contents').summernote({
	        	        
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
	        	 
	        	 let profanityList = ["바보","멍청이","개똥","새끼","똥개","꼰대","놈","년"];  // 실제 비속어로 교체해주세요

	        	 // 비속어 검사 함수
	        	 function containsProfanity(input) {
	        	     for (let word of profanityList) {
	        	         if (input.includes(word)) {
	        	             return true;  // 비속어가 포함된 경우
	        	         }
	        	     }
	        	     return false;  // 비속어가 없는 경우
	        	 }

	        	 function validateForm() {
	        	     let title = document.getElementById("inputTitle").value.trim();
	        	     let contents = document.getElementById("contents").value.trim();

	        	     // 제목과 내용에 비속어가 포함되었는지 확인
	        	     if (containsProfanity(title)) {
	        	         alert("제목에 비속어가 포함되어 있습니다.");
	        	         return false;
	        	     }

	        	     if (containsProfanity(contents)) {
	        	         alert("내용에 비속어가 포함되어 있습니다.");
	        	         return false;
	        	     }

	        	    

	        	     return true;
	        	 }
	        	</script>
</body>
</html>