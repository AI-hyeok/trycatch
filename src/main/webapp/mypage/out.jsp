<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<style>
.head {
	height: 60px;
	display: flex;
	align-items: center;
	font-size: 35px;
	font-weight: bold;
	padding-left: 20px;
}

.titlemypage {
	font-size: 18px;
	height: 60px;
	display: flex;
	align-items: end;
	padding-bottom: 20px;
	margin-left: 15px;
}

.trycatch {
	cursor: pointer;
}

.seconddiv {
	display: flex;
	width: 100%;
}

.first {
	margin-top: 100px;
	display: flex;
	height: 800px;
	border: none;
}

.list {
	width: 300px;
	background-color: #d9d9d9;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

li {
	list-style: none;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 40px;
	cursor: pointer;
	font-size: 18px;
	font-weight: bold;
}

.right {
	margin-top: 100px;
	width: 100%;
}

.instruct {
	width: auto;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
	margin-left: 15%;
}

.second {
	width: 100%;
	height: 500px;
}

.title {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: end;
	font-size: 30px;
	font-weight: bold;
}

.secondInstruct {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	margin-top: 10px;
}

.passworddiv {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 25px;
	margin-top: 50px;
	font-weight: bold;
}

.password {
	margin-left: 30px;
	height: 25px;
	background-color: #d9d9d9;
	border: none;
	width: 20%;
}

.select {
	margin-left: 30px;
	background-color: #d9d9d9;
	border: none;
	cursor: pointer;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<div class="container">
		<div class="head">
			<p class="trycatch">Try Catch</p>
			<p class="titlemypage">회원탈퇴</p>
		</div>

		<div class="seconddiv">
			<div class="left">
				<div class="first">
					<div class="list">
					<ul>
						<li class="myupdate">개인정보 수정</li>
						<hr>
						<li class="myrank">내 랭킹 보기</li>
						<hr>
						<li class="myboard">내 게시물 보기</li>
						<hr>
						<li class="out">회원탈퇴</li>
						<hr>
					</ul>
					</div>
				</div>
			</div>

			<div class="right">
				<div class="instruct">회원탈퇴</div>

				<div class="second">
					<div class="title">본인확인</div>
					<div class="secondInstruct">고객님의 개인정보 보호를 위해서 본인확인을 진행합니다.</div>

					<form action="/delete.mypages" method="post" id="frm">
						<div class="passworddiv">
							비밀번호 <input type="password" class="password" name="password">
							<button class="select" type="button">확인</button>
						</div>
					</form>

				</div>
			</div>
		</div>



	</div>

	<script>
		$(".trycatch").on("click", function() {
			window.location.href = "/index.jsp";
		})//index로가기
		$(".myupdate").on("click", function() {
			window.location.href = "/myupdate.mypages";
		})//개인정보수정

		$(".myrank").on("click", function() {
			window.location.href = "/myrank.mypages";
		})//내 랭킹보기

		$(".myboard").on("click", function() {
			window.location.href = "/myboard.mypages";
		})//내 게시물 보기

		$(".out").on("click", function() {
			window.location.href = "/mypage/out.jsp";
		})//내 게시물 보기

		$(".select").on("click", function() {

			if ($(".password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				return;
			}

			if (confirm("정말 탈퇴하시겠습니까?")) {
				//$("#frm").submit();

				$.ajax({
					url : '/check.mypages',
					type : 'POST',
					data : {
						password : $('.password').val()
					}
				}).done(function(data) { // "{int : int, String: String }"
					data = JSON.parse(data); // {int : int, String: String }
					// data.int = int
					if (data) {
						$('#frm').submit();
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				});

			}

		});
	</script>

</body>
</html>