<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardWrite</title>
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

.headerLogoImg{
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
	display: flex;
	justify-content: end;
	align-items: center;
}

.checkboxDiv> *{
float:left;
}

.title {
	height: 80px;
	font-size: 35px;
}

.titleDetail{
	display: flex;
	justify-content: left;
	align-items: baseline;
	color:white;
	font-weight:bold;
}

.boardTitle{
height:180px;
background-color:rgba(255, 255, 255, 0.861);
border-radius:10px;
border-bottom-left-radius:0px;
border-bottom-right-radius:0px;
margin:30px;
margin-bottom:0px;
margin-top:8px;
}

.titleText{
height::40%;
font-size:25px;
font-weight:bold;
padding-top:30px;
padding-left:30px;
}

.inputTitle{
height:60%;
padding:30px;
padding-bottom:10px;
}
#insertBtn, #listBtn{
background-color: rgba(78, 51, 128, 0.9); /* 버튼 배경색 */
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    font-size: 20px;
}

#listBtn{
width:100%;
height:100%;
}

#inputTitle{
border:none;
width:100%;
height:100%;
border-radius:10px;
padding-left:10px;
}



.inputFiles{
height:100px;
background-color:rgba(255, 255, 255, 0.861);
border-radius:10px;
margin-top:0px;
border-top-left-radius:0px;
border-top-right-radius:0px;
padding:50px;
padding-top:10px;
}

.InputContents{
min-height:500px;
margin-top:50px;
background-color:rgba(255, 255, 255, 0.861);
border-radius:10px;
padding:30px;
}




#contents{
height:500px;
width:100%;
}

.mypage, .whole_ranking, .community, .QandA{
width:100%;
height:10%;
}

.mainContents {
	margin-top: 10px;
	padding: 15px;
	height:100%;
}

.editor{
min-height:500px;
}

.writeBtn {
	margin:10px;
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
	margin-top:20px;
}

.pageNavi>div {
	height: 100%;
}




.boardName {
	display: flex;
	justify-content: left;
	align-items: baseline;
	padding-left: 10px;
	font-size:25px;
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

th{
	text-align: center;
	vertical-align: middle;
	height: 50px;
	background-color:#4a46c864;
	width:85%;
	border:1px solid rgba(255, 255, 255, 0.861);
	color:#2d2736;
}

td{
	text-align: center;
	vertical-align: middle;
	height: 40px;
}

.boardList {
	height: 100%;
	padding-right: 30px;
	padding-left: 30px;
	padding-top:15px;
	padding-bottom:20px;
	border-radius: 5px;
	background-color:rgba(255, 255, 255, 0.861);
}



#inputSearch{
	height: 80%;
	width:65%;
	background-color:#EEEEEE ;
	border-radius:5px;
	border:1px solid #EEEEEE;
}

#searchBtn{
	height: 80%;
	width:25%;;
	background-color:#4a46c864;
	border-radius:5px;
	border:1px solid #EEEEEE;
	margin-left:5px;
	margin-right:5px;
}

.searchBox, .writeBtn{
	padding:0px;
	margin:0px;
	height:40px;
	padding-left:5px;
}

.writeBtn{
	display: flex !important;
	justify-content: right !important;
	align-items: baseline !important;
}

#writeBtn{
	width:100px;
	height:80%;
	background-color:#4a46c864;
	border-radius:5px;
	border:1px solid #EEEEEE;
	padding:0px;
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
          margin-bottom:30px;
       }
        
    .paging {
	    cursor: pointer;
	    padding: 5px 10px;
	    margin: 0 5px;
	    border: 1px solid #ddd;
	    border-radius: 3px;
	    color:black;
	    text-align:middle;
	    verrical-align:center;
	}
	
	.paging:hover {
    border:2px solid #4a46c864;
    border-radius: 3px;
    color:black;
}
	

	
	.id_login_box {
	width: 100%;
	height:50%;
	margin:0px;
}
	
	.id_login_button {
	width: 130%;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 10px 10px 0px 0px;
	flex-direction: row;  /* 수평 배치 */
  	gap: 0px;
}

#loginBox{
width:100%;
height:30%;
margin:0px;
padding:20px;
}

#loginBox>div{
	flex: 1; /* 각 div 요소의 크기를 동일하게 설정 */
  text-align: center;
  font-size: 20px;
  color:white;
}

n{
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
	box-shadow: 0 0 5px #fff700, 0 0 25px #fff700, 0 0 50px #fff700, 0 0
		200px #6a00ff;
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
	background: linear-gradient(90deg, transparent,#fff700);
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
n span:nth-child(2) {
	top: -100%;
	right: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(180deg, transparent, #fff700);
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
n span:nth-child(3) {
	bottom: 0;
	right: 0;
	width: 100%;
	height: 2px;
	background: linear-gradient(270deg, transparent, #fff700);
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
n span:nth-child(4) {
	bottom: -100%;
	left: 0;
	width: 2px;
	height: 100%;
	background: linear-gradient(360deg, transparent, #fff700);
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



</style>
</head>
<body>
<img class="background-img" src="common/images/BGI.jpg">


<form action="/insert.comboard" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
<input type="hidden" name="selectNotice" id="selectNotice">
<script>
	if((document.getElementById("myCheckbox").checked)){
		S("#selectNotice").val("Y");
	}else {
		S("#selectNotice").val("N");
	}

</script>
    <div class="row container">
        <header class="d-flex align-items-center p-3">
            		<h1 class="h1 flex-grow-1 trycatch ">
            		<img class="headerLogoImg" src="common/images/LogoW.png">
            		</h1>
            		<span class="fs-4" style="color:white;">커뮤니티</span>
        	</header>
        <div class="row title">
            <div class="col-12 titleDetail">자유게시판</div>
            
           
        </div>
            
            
            <div class="row btns">
            <c:choose>
            	<c:when test="${loginID == 'admin'}">
            	<div class="col-8 checkboxDiv">
	 			<input type="checkbox" id="myCheckbox" name="noticeCheckbox" value="Y">
	 			<label for="myCheckbox" style="color:white; padding-left:5px;">공지 등록</label>
	 			<script>
	 			document.getElementById("myForm").onsubmit = function() {
	                if (document.getElementById("myCheckbox").checked) {
	                    document.getElementById("myCheckbox").value = "Y";
	                } else {
	                    document.getElementById("myCheckbox").value = "N";
	                }
	            };
	 			</script>
	 			</div>
	 			</c:when>
	 		</c:choose>
	 		<div class="col-8"></div>
                <a class="col-2" href="/list.comboard">
                <button id="listBtn" type="button">목록보기</button></a>
                <button class="col-2" id="insertBtn">게시하기</button>
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
            
            
	        <div class="row boardTitle">
	            <div class="col-12 titleText">자유게시판 글쓰기</div>
	            <div class="col-12 inputTitle"><input name="title" id="inputTitle" type="text" placeholder="제목을 입력해주세요"></div>
	        </div>
	        <div class="row inputFiles">
		        <input class="col-6 files" id="file1" type="file" name="file1">
	        	<input class="col-6 files" type="file" name="file2">
	

        	</div>
	        <div class="InputContents">
	            <div class="col-12 editor" ><textarea id="contents" name="contents" placeholder="내용을 입력해주세요."></textarea></div>
	        </div>
	        <div class="row footer">
			<div class="col-12 footerContents">
				<div class="col-12 footerTexts">
					이메일:trycatch@gmail.com|채팅 : 카카오톡 채널(아이디 트라이캐치)<br> <br>충청남도
					천안시 서북구 두정중10길|전화번호 : 1633-122001<br> <br>© Try catch
					Korea Corporation All Rights Reserved.
				</div>
				<div class="col-12 logoText">
				<img class="logoImg" src="common/images/LogoW.png">
				</div>
			</div>
		</div>
    </div>
</form>
<script>
$(document).ready(function() {
    $('#contents').summernote({
        height: 800,  // 에디터 크기 설정
        lang: 'ko-KR',  // 한글 설정
        toolbar: [
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72','96'],
        focus: true,  // 페이지 로드시 커서 위치
        callbacks: { 
            onImageUpload: function(files, editor, welEditable) {   
                for (var i = 0; i < files.length; i++) {
                    imageUploader(files[i], this);
                }
            }
        }
    });
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