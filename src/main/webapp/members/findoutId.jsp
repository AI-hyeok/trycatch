<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js">
</script>
<style>
	* {
		box-sizing: border-box;
		margin:0;
		padding:0;
	}
html, body {
	 	height: 100vh;
    	background-image: url('/image/findID2.jpg'); 
    	background-size: cover;
    	background-position: center; 
   		background-repeat:no-repeat;
   		color:rgba(255,255,255,0.9);
}

.navi {
		width: 100%;
		height: 100px;
		display: flex;
    	justify-content: center; 
    	align-items: center; 
	}
.logo img{
		height:100px;
}
	.navi>div {
		width: 150px;
		height: 100%;
		display: flex;
		justify-content: center;
		
}
	.navi>div {
		width: 150px;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	
	}

	.subContainer {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}

	.title {
		font-size: 25px;
		font-weight: bold;
		color:rgba(255,255,255,0.9);
	}

		align-items: center;
	
	}

	.subContainer {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}

	.title {
		font-size: 25px;
		font-weight: bold;
		color:rgba(255,255,255,0.9);
	}


	.header, .contents, .btn {
		width: 50%;
	}

	.contents {
		border: 1px solid rgba(255,255,255,0.9);
		width: 50%;
		height: 300px;
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 30px;
		background-color:rgba(255,255,255,0.1);
		border-radius:10px;
		
	}

	.guide {
		width: 100%;
		height: 50px;
		color:rgba(255,255,255,0.9);
	}

	.name, .email, .inputCode {
		width: 100%;
		height: 50px;
	}

	.name>div {
		float: left;
		width: 33.33%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.email>div {
		float: left;
		width: 33.33%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.inputCode {
		width: 33.33%;
		height: 50px;
		margin-left: 33.33%;
	}
	.inputCode input::placeholder{
		color:white;
	}
	
	.btn {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	button {
		width: 100%;
        max-width: 150px;
        height: 40px;
        border: none;
        background-color: rgb(214, 214, 214);
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
        transition: 0.3s;
	}
	button:hover {
        background-color: rgb(180, 180, 180);
    }
	.btn button {
        width: 120px;
        height: 40px;
        border-radius: 5px;
        background-color: rgb(100, 100, 100);
        color: white;
        border: none;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn button:hover {
        background-color: rgb(70, 70, 70);
    }
	input {
		width: 100%;
		height: 90%;
		border: 1px solid #ccc; 
    	border-radius: 5px;
    	background-color: rgba(255, 255, 255, 0.1); 
    	color: white; 
	}
	input:focus {
    	outline: none;
    	border-color: #007bff; 
    	background-color: rgba(255, 255, 255, 0.1); 
	}
</style>

</head>
<body>

<%
    String m_id = (String) request.getAttribute("m_id");
    if (m_id == null) {
        m_id = ""; // 값이 없으면 빈 문자열 설정
    }
%>
<form action="/findId.members" method="post">
	<div class="container">
		<div class="navi">
		<div class="logo">
			 <img src="/image/LogoW.png">
		</div>
		</div>
		
		<div class="subContainer">
			<div class="header">
				<div class="title">아이디 찾기</div>
				<hr style="border: 2px solid black;">
			</div>
			<div class="contents">
				<div class="contentsContainer">
					<div class="guide">등록된 이메일 주소와 이름이 현재 입력한 이메일 주소와 이름과 같아야 등록된 아이디를 받을
						수 있습니다.</div>
					<div class="name">
						<div>이름</div>
						<div>
							<input type="text" name="name" placeholder="기존에 가입한 이름을 입력하세요">
						</div>
					</div>
					<div class="email">
						<div>이메일</div>
						<div>
							<input type="text" name="email" placeholder="기존에 가입한 이메일을 입력하세요">
						</div>
						<div>
							<button id="sendCode">아이디 확인</button>
						</div>
					</div>
					<div class="inputCode">
						<input type="text" id="foundId" placeholder="등록된 아이디" readonly>
						
					</div>
				</div>
			</div>
			
			<div class="btn">
			<a href="/members/login.jsp">
				<button type="button">로그인 하기</button>
			</a>
			</div>
		</div>
	</div>
</form>

<script>
   $(document).ready(function() {
        var foundId = "<%= m_id %>";
        if(foundId != null){
	       $("#foundId").val(foundId);    	
        }else{
        	$("#foundId").val("잘못된 값입니다.");    
        }
   });
</script>

</body>
</html>