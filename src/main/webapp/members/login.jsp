<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	width: 500px;
	margin: auto;
}

.title {
	width: 100%;
	height: 180px;
	font-size: 50px;
	font-weight: bold;
	display: flex;
	justify-content: center;
	align-items: center;
}

.logInBox {
	border: 1px solid black;
	width: 100%;
	border-radius: 10px;
	padding: 20px;
}

.subTitle {
	display: flex;
	justify-content: center;
	align-items: center;
	color: rgb(179, 179, 179);
	height: 50px;
	margin-bottom: 10px;
}

.inputId, .inputPw {
	border: 1px solid black;
	width: 100%;
	height: 60px;
	padding: 5px
}

.inputId {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.inputPw {
	border-bottom-right-radius: 10px;
	border-bottom-left-radius: 10px;
}

.inputId>div, .inputPw>div {
	width: 100%;
	height: 100%;
}

input {
	width: 100%;
	height: 100%;
	border: none;
}

.miniNavi {
	margin-top: 10px;
}

.miniNavi>div {
	float: left;
	width: 33.3%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#loginBtn {
	width: 100%;
	height: 50px;
	font-size: larger;
	font-weight: bold;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 20px;
}
#loginBtn:hover{
cursor:pointer;
background-color:grey;
transition:0.5s;
}
.btns {
	border: none;
	background-color: rgba(255, 255, 255, 0);
}
.btns:hover{
cursor:pointer;
}
</style>

</head>
<body>

		<div class="container">
			<div class="title">TryCatch</div>
			<div class="logInBox">
				<div class="subTitle">로그인</div>
				<div class="inputId">

					<div>
						<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">

					</div>
				</div>
				<div class="inputPw">

					<div style="position: relative; display: flex; align-items: center; width: 100%;">
						<input type="password" id="password" name="password"
							placeholder="비밀번호를 입력해주세요"
							style="width: 100%; padding-right: 40px; height: 100%; border: none;">
						<i class="fa-regular fa-eye" id="togglePassword"
							style="position: absolute; right: 15px; cursor: pointer; color: gray;"></i>
					</div>
				</div>
				<div class="Btn">
					<button id="loginBtn">로그인</button>
				</div>
			</div>
			<div class="miniNavi">
				<div>
					<button id="searchID" type="button" class="btns">아이디 찾기</button>
				</div>
				<div>
					<button id="searchPW" type="button" class="btns">비밀번호 찾기</button>
				</div>
				<div>
					<button id="signup" type="button" class="btns">회원가입</button>
				</div>
			</div>
		</div>
	<script>
	
	document.getElementById("togglePassword").addEventListener("click", function() {
        let passwordInput = document.getElementById("password");
        let icon = this;

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passwordInput.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });
	
	
	$("#signup").on("click",function(){
		location.href ="/members/signup.jsp"	
	})
	
	 $("#searchID").on("click",function(){
		location.href="/members/findoutId.jsp"
	})
	$("#searchPW").on("click",function(){
		location.href="/members/findoutPw.jsp"
		
	}) 

	$("#loginBtn").on("click", function() {
		
    $.ajax({
        url: '/login.members',
        type: 'post',
        data: {
            id: $("#id").val(),
            password: $("#password").val()
        },
        success: function(response) {
            console.log(response);
            response = JSON.parse(response);

            if (response) {
                window.location.href = "/index.jsp";
            } else {
                Swal.fire({
                    icon: "error",
                    title: "로그인 실패",
                    text: "아이디 또는 비밀번호가 잘못되었습니다."
                });
            }
        }
    });
});

	
	</script>

</body>
</html>