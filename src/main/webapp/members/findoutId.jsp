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
	}

	/* div{
        border:1px solid black;
         } */
	.container {
		width: 100%;
		margin: auto;
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
	}

	.navi {
		width: 100%;
		height: 60px;
		margin-bottom: 50px;
		background-color: rgb(218, 218, 218);
		padding-left: 300px;
	}

	.navi>div {
		float: left;
		width: 150px;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		font-weight: bold;
		font-size: 18px;
	}

	.header, .contents, .btn {
		width: 50%;
	}

	.contents {
		border: 1px solid black;
		width: 50%;
		height: 300px;
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 30px;
	}

	.guide {
		width: 100%;
		height: 50px;
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

	.btn {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	button {
		width: 100px;
		height: 30px;
		border-radius: 0px;
		background-color: rgb(214, 214, 214);
	}

	input {
		width: 100%;
		height: 90%;
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
		<div class="logo">
			<img src="LogoB.png" style="height: 50px;">
		</div>
		<div class="navi">
			<div>아이디 찾기</div>
			<div>비밀번호 찾기</div>
		</div>
		<div class="subContainer">
			<div class="header">
				<div class="title">아이디 찾기</div>
				<hr style="border: 2px solid black;">
			</div>
			<div class="contents">
				<div class="contentsContainer">
					<div class="guide">회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 인증번호를 받을
						수 있습니다.</div>
					<div class="name">
						<div>이름</div>
						<div>
							<input type="text" name="name">
						</div>
					</div>
					<div class="email">
						<div>이메일</div>
						<div>
							<input type="text" name="email">
						</div>
						<div>
							<button id="sendCode">아이디 확인</button>
						</div>
					</div>
					<div class="inputCode">
						<input type="text" id="foundId" placeholder="가입하신 아이디" readonly>
						
					</div>
				</div>
			</div>
			
			<div class="btn">
			<a href="/members/login.jsp">
				<button type="button">다음</button>
			</a>
			</div>
		</div>
	</div>
</form>

<script>
   $(document).ready(function() {
        var foundId = "<%= m_id %>";  <%--JSP에서 받은 값 --%>
       $("#foundId").val(foundId);   <%--input 태그에 값 설정--%>
   });
</script>

</body>
</html>