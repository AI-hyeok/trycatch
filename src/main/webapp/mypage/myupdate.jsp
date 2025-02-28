<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 수정</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>
.trycatch {
	cursor: pointer;
}

.list li {
	cursor: pointer;
	text-align: center;
	padding: 10px 0;
	font-weight: bold;
	font-size: 20px;
}
.list li:hover{
            font-size: 25px;
        }

   .id_login_button {
   width: 100%;
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
span{
	color:white;
	font-weight:bold;
}

th {
	font-size: 25px;
}

td {
	font-size: 20px;
}

th, td {
	width: 33%;
}
.background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
        }
        .listbox{
        	opacity:0.9;
        
        }
    	.main{
    		opacity:0.9;
    		background-color: white;
    		margin-left:1rem;
    	}
    	h2{
    	font-weight:bold;
    	}
    	.headerLogoImg{
	width: 200px;
    height: auto;
}
</style>
</head>
<body>

	<form action="/updateMyInformation.mypages" method="post" id="frm">
		<input type="hidden" class="name" name="name"> <input
			type="hidden" class="nickname" name="nickname"> <input
			type="hidden" class="phone" name="phone"> <input
			type="hidden" class="email" name="email"> <input
			type="hidden" class="id" name="id">
	</form>
<img src="mypage/images/BGI.jpg" class="background-img">
	<div class="container">
		<header class="d-flex align-items-center p-3">
			<h1 class="h1 flex-grow-1 trycatch "><img class="headerLogoImg" src="mypage/images/LogoW.png"></h1>
			<span class="fs-4">개인정보수정</span>
		</header>

		<div class="id_login_button">
            <n id="loginBox">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <div class="mypage">마이페이지</div>
                <div class="whole_ranking">전체 랭킹</div>
                <div class="community">커뮤니티</div>
                <div class="QandA">Q&A</div>
            </n>
        </div>

		<div class="row mt-4">
			<aside class="col-md-3 list bg-light p-3 rounded listbox">
				<ul class="list-unstyled">
					<hr>
					<li class="myupdate">개인정보 수정</li>
					<hr>
					<li class="myrank">내 랭킹 보기</li>
					<hr>
					<li class="myboard">내 게시물 보기</li>
					<hr>
					<li class="out">회원탈퇴</li>
					<hr>
				</ul>
			</aside>


			<main class="p-4 col-md-8 rounded main">
				<h2>개인정보 수정</h2>
				<hr>
				<table class="table">
					<tr>
						<th>ID</th>
						<td id="id">${list.m_id}</td>
						<td></td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="name">${list.name}</td>
						<td></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td class="td" id="nickname">${list.nickname}</td>
						<td class="gap-3 nicknamebtnbox">
							<button class="btn btn-secondary button nicknamebutton ">수정</button>
						</td>

					</tr>
					<tr>
						<th>휴대폰</th>
						<td class="td" id="phone">${list.phone}</td>
						<td class="btnbox">
							<button class="btn btn-secondary button">수정</button>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td class="td" id="email">${list.email}</td>
						<td class="btnbox">
							<button class="btn btn-secondary button">수정</button>
						</td>
					</tr>
				</table>
				<button class="btn btn-primary update">수정완료</button>
			</main>
		</div>
	</div>

	<script>

	
	$(document).on("keydown", ".td[contenteditable='true']", function(event) {
	    if (event.key === "Enter") {
	        event.preventDefault(); // 줄바꿈 방지
	        $(this).closest("tr").find(".complete").click(); // 완료 버튼 클릭
	    }
	});
	
		$(".nicknamebutton").on("click",function(){
			let tr = $(this).closest("tr");
			let td = tr.find("td.td");
			let btnbox = tr.find("td.nicknamebtnbox");
			let btn = $(this);
			let complete = $("<button>").text("완료").addClass("btn btn-secondary complete");
			let cancel = $("<button>").text("취소").addClass("btn btn-secondary cancel").css("margin-left","0.5rem");
			td.attr("contenteditable","true").focus();
			btn.hide();
			btnbox.append(complete,cancel);
			
			cancel.on("click",function(){
				cancel.remove();
				complete.remove();
				btn.show();
				
				td.attr("contenteditable","false");
				
			});
			
			complete.on("click",function(){
				let regexNickname = /^[a-zA-Z0-9가-힣]{2,20}$/;
				
				 if(!regexNickname.test($("#nickname").text())){
		           		Swal.fire({
		           			icon: "error",
		           			title: "잘못된 입력",
		           			text: "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다.(띄어쓰기x)"
		           			
		           		});
		           		
		           		return false;
		            }
				 else{
					 $.ajax({
							url : '/checkNickname.mypages',
							type : 'POST',
							data : {
								nickname : $('#nickname').text()
							}
						}).done(function(data) { 
							data = JSON.parse(data); 
							
							if (data) {
								alert("이미 사용중인 닉네임입니다.");
								return false;
							} 
							else{
								alert("사용 가능한 닉네임입니다.")
								
								 $(".nickname").val($("#nickname").text());
								 $(".phone").val($("#phone").text());
								 $(".email").val($("#email").text());
								 
									 cancel.remove();
									complete.remove();
									btn.show();
									td.attr("contenteditable","false");
							}
						});
					 
				 }
				 
				 
			})
			
		})
	
		$(".button").on("click",function(){
			let tr = $(this).closest("tr");
			let td = tr.find("td.td");
			let btnbox = tr.find("td.btnbox");
			let btn = $(this);
			let complete = $("<button>").text("완료").addClass("btn btn-secondary complete");
			let cancel = $("<button>").text("취소").addClass("btn btn-secondary cancel").css("margin-left","0.5rem");
			
			td.attr("contenteditable","true").focus();
			btn.hide();
			btnbox.append(complete,cancel);
			
			cancel.on("click",function(){
                cancel.remove();
				complete.remove();
				btn.show();
				
				td.attr("contenteditable","false");
				
				
			});
			
			complete.on("click",function(){
				let regexPhone = /^010-?\d{4}-?\d{4}$/;
	      		let regexMail = /^\S+@\S+\.\S+$/;
	      		let regexNickname = /^[a-zA-Z0-9가-힣]{2,20}$/;
	      		
	      		
	      	  if (!regexMail.test($("#email").text())) {
	                Swal.fire({
	                    icon: "error",
	                    title: "잘못된 입력!",
	                    text: "이메일 형식으로 입력해주세요. ex)abc@naver.com"
	                });
	                mail.focus();
	                return false;
	            }
	      	  
	      	 if ($("#phone").text()!=="" && !regexPhone.test($("#phone").text())) {
	                Swal.fire({
	                    icon: "error",
	                    title: "잘못된 입력!",
	                    text: "전화번호의 형식은 010-XXXX-XXXX/010XXXXXXXX/010 XXXX XXXX입니다."
	                });
	                phone.focus();
	                return false;
	            }
	      	
	      	 
	      	 if(!regexNickname.test($("#nickname").text())){
	           		Swal.fire({
	           			icon: "error",
	           			title: "잘못된 입력",
	           			text: "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다.(띄어쓰기x)"
	           			
	           		});
	           		nickname.focus();
	           		return false;
	            }
				
				
	      	 $(".nickname").val($("#nickname").text());		
			 $(".phone").val($("#phone").text());
			 $(".email").val($("#email").text());
			
				cancel.remove();
				complete.remove();
				btn.show();
				td.attr("contenteditable","false");
				
			})
			
			
		
		});
		
		$(".update").on("click",function(){
			
			if($(".nickname").val()==""||$(".email").val()==""||$(".phone").val()==""){
				alert("수정을 하고 눌러주세요");
				return false;
			}
			
			$("#frm").submit();
			
			
		})
		
	$(".trycatch").on("click",function(){
		window.location.href="/index.jsp";
	})//index로가기	
	//네비바
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
		
		
	$(".myupdate").on("click",function(){
		window.location.href="/myupdate.mypages";
	})//개인정보수정
	
	$(".myrank").on("click",function(){
		window.location.href="/myrank.mypages";
	})//내 랭킹보기
	
	$(".myboard").on("click",function(){
		window.location.href="/myboard.mypages";
	})//내 게시물 보기
	
	$(".out").on("click",function(){
		window.location.href="/mypage/out.jsp";
	})//내 게시물 보기
	
	
	</script>
</body>
</html>
