<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style>
    * {
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }
	
	html, body {
 		height: 100vh;
    	background-image: url('images/findID2.jpg'); 
    	background-size: cover; 
    	background-position: center;
    	background-repeat: no-repeat;
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
        border: 1px solid white;
        padding: 30px;
        border-radius: 10px;
        background-color: #f9f9f9;
        background-color:rgba(255,255,255,0.1);
        color: white;
    }

    .guide {
        font-size: 14px;
        color: white;
        margin-bottom: 20px;
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
    }

    .form-group input {
        width: 65%;
        height: 40px;
        padding: 5px;
        border: 1px solid white;
        border-radius: 5px;
        text-align: center;
        background: rgba(255, 255, 255, 0.2);
        color:white;
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



<form action="/findPw.members" method="post">
    <div class="container">
        <div class="logo">
             <img src="images/LogoW.png">  
        </div>

        <div class="header">
            <div class="title">비밀번호 찾기</div>
            <hr>
        </div>
        <div class="contents">
            <div class="guide">
                회원정보에 등록한 이름,아이디, 이메일 주소가 같아야 인증번호를 받을 수 있습니다.
            </div>
            
            <div class="form-group">
                <label>이름</label>
                <input type="text" name="name" id="name" required>
            </div>

            <div class="form-group">
                <label>아이디</label>
                <input type="text" name="id" id="id" required>
            </div>

            <div class="form-group">
                <label>이메일</label>
                <input type="text" name="email" id="email" required>
            </div>

            <div class="form-group">
                <button type="button" id="sendCode">확인</button>
            </div>

            <div class="inputCode">

            </div>
        </div>
        
        <div class="btn">
            <a href="/members/login.jsp">
                <button type="button">로그인</button>
            </a>
        </div>
    </div>
</form>

<script>

   $("#sendCode").on("click",function(){
	   $.ajax({
		   url: '/findPw.members',
		   type: 'POST',
		   data: {
			   id: $('#id').val(),
			   name: $('#name').val(),
			   email: $('#email').val()
		   }
	   }).done(function(data) {
		   data = JSON.parse(data);
		   
		   if(data) {
				localStorage.setItem("id", $('#id').val());		   
			   location.href="/members/resetPw.jsp";
		   } else {
			   alert("잘못된 값입니다.");
		   }
	   });
 
   })
</script>

</body>
</html>
