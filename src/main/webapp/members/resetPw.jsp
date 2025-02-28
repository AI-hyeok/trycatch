<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style>
* {
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
}
html, body {
    background-image: url('images/findID2.jpg'); /* 배경 이미지 경로 */
    background-size: cover; /* 이미지가 화면을 꽉 채우도록 조정 */
    background-position: center; /* 중앙 정렬 */
    background-repeat: no-repeat; /* 반복 방지 */
    background-attachment: fixed;
}
.container {
	width: 100%;
	max-width: 600px;
	margin: auto;
	text-align: center;
}

.logo img {
	height: 100px;
	margin: 20px 0;
}

.navi {
	width: 100%;
	height: 60px;
	margin-bottom: 30px;
	background-color: rgb(218, 218, 218);
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
	font-size: 18px;
	font-weight: bold;
}

.title {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 10px;
	color:white;
}

hr {
	border: 2px solid black;
	width: 100%;
	margin-bottom: 20px;
}

.contents {
	border: 1px solid rgba(255,255,255,0.9);
	padding: 30px;
	border-radius: 10px;
	background-color: rgba(255,255,255,0.1);
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

.guide {
	font-size: 14px;
	color: #555;
	margin-bottom: 20px;
	color:white;
}

.form-group {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
}

.form-group label {
	width: 30%;
	font-weight: bold;
	color: white;
}

.form-group input {
	width: 65%;
	height: 40px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center;
}

.form-group button {
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

.form-group button:hover {
	background-color: rgb(180, 180, 180);
}

.inputCode input {
	width: 100%;
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	background-color: #eee;
}

.btn {
	margin-top: 20px;
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
</style>
</head>
<body>



	<div class="container">
		<div class="logo">
			<img src="images/LogoW.png">  
		</div>

		<div class="header">
			<div class="title">비밀번호 변경</div>
			<hr>
		</div>
		<div class="contents">
			<div class="guide">회원정보에 등록한 이름,아이디, 이메일 주소가 같아야 인증번호를 받을 수
				있습니다.</div>

			<div class="form-group" style="position: relative;">
				<label>새 비밀번호</label> <input type="password" name="password"
					id="password" required style="width: 100%; padding-right: 40px;">
				<i class="fa-regular fa-eye" id="togglePassword1"
					style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer; color: gray;"></i>


			</div>

			<div class="form-group" style="position: relative;">
				<label>비밀번호 확인</label> <input type="password" name="password2"
					id="password2" required style="width: 100%; padding-right: 40px;">
				<i class="fa-regular fa-eye" id="togglePassword2"
					style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer; color: gray;"></i>
			</div>


			<div class="form-group">
				<button type="button" id="sendCode">변경</button>
			</div>
		</div>
	</div>


	<script>
	 function togglePassword(inputId, iconId) {
	        let passwordInput = document.getElementById(inputId);
	        let icon = document.getElementById(iconId);

	        if (passwordInput.type === "password") {
	            passwordInput.type = "text";
	            icon.classList.remove("fa-eye");
	            icon.classList.add("fa-eye-slash");
	        } else {
	            passwordInput.type = "password";
	            icon.classList.remove("fa-eye-slash");
	            icon.classList.add("fa-eye");
	        }
	    }

	    document.getElementById("togglePassword1").addEventListener("click", function() {
	        togglePassword("password", "togglePassword1");
	    });

	    document.getElementById("togglePassword2").addEventListener("click", function() {
	        togglePassword("password2", "togglePassword2");
	    });
		const password = document.getElementById("password");
		const password2 = document.getElementById("password2");

		$("#sendCode").on('click', function() {

			let regexPassword = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;

			if (!password.value) {
				Swal.fire({
					icon : "error",
					title : "패스워드를 입력해주세요.",
					text : "패스워드는 8자 이상의 영문 대/소문자, 숫자를 포함해야 합니다. "

				});
				password.focus();
				return;

			}

			if (!regexPassword.test(password.value)) {
				Swal.fire({
					icon : "error",
					title : "잘못된 입력!",
					text : "패스워드는 8자 이상의 영문 대/소문자, 숫자를 포함해야 합니다."

				});
				password.focus();
				return;
			}

			if (password.value !== password2.value) {
				Swal.fire({
					icon : "error",
					title : "비밀번호가 일치하지 않습니다.",
					text : "입력한 패스워드를 다시 확인해주세요."

				});
				password2.focus();
				return;
			}

			$.ajax({
				url : '/passwordUpdate.members',
				type : 'POST',
				data : {
					id : localStorage.getItem("id"),
					password : $('#password').val()
				}
			}).done(function(data) {
				data = JSON.parse(data);

				if (data) {
					alert("변경되었습니다.");
					localStorage.removeItem("id");
					location.href = "/members/login.jsp";
				}
			});

		});
	</script>

</body>
</html>
