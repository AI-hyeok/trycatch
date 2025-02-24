<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.instruct {
	width: auto;
	height: 30px;
	margin-left: 20%;
	margin-top: 70px;
	font-size: 18px;
	font-weight: bold;
}

.seconddiv {
	display: flex;
}

table {
	width: 60%;
	margin: auto;
	table-layout: fixed; /* 고정 레이아웃 설정 */
}

th {
	width: 18%; /* 각 헤더 셀의 너비 설정 */
	font-size: 25px;
	padding-top: 5px;
}

#id {
	width: 105%;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.td {
	width: 70%;
	height: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.btnbox {
	width: 20%;
}

button {
	padding: 5px 15px; /* 버튼의 패딩 설정 */
	cursor: pointer; /* 커서 포인터로 변경 */
	background-color: #d9d9d9;
	border: none;
	color: black;
	font-weight: bold;
	font-size: 18px;
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

	<div class="container">
		<div class="head">
			<p class="trycatch">Try Catch</p>
			<p class="titlemypage">개인정보 수정</p>
		</div>


		<div class="seconddiv">
			<div class="right">
				<div class="first">
					<div class="list">
						<li class="myupdate">개인정보 수정</li>
						<hr>
						<li class="myrank">내 랭킹 보기</li>
						<hr>
						<li class="myboard">내 게시물 보기</li>
						<hr>
						<li class="out">회원탈퇴</li>
						<hr>
					</div>
				</div>
			</div>

			<div class="left">
				<div class="instruct">개인정보 변경</div>
				<hr style="width: 60%;">

				<table>
					<tr>

						<th>ID</th>
						<td id="id">${list.m_id}<!--<button class="button">수정</button>-->
						</td>
						<td></td>

					</tr>

				</table>
				<hr style="width: 60%;">
				<table>
					<tr>
						<th>이름</th>
						<td class="td" id="name">${list.name}</td>
						<td class="btnbox">
							<button class="button">수정</button>

						</td>

					</tr>

				</table>
				<hr style="width: 60%;">
				<table>
					<tr>
						<th>닉네임</th>
						<td class="td" id="nickname">${list.nickname}</td>
						<td class="btnbox">
							<button class="button">수정</button>

						</td>

					</tr>

				</table>
				<hr style="width: 60%;">
				<table>
					<tr>
						<th>휴대폰</th>
						<td class="td" id="phone">${list.phone}</td>
						<td class="btnbox">
							<button class="button">수정</button>

						</td>

					</tr>

				</table>
				<hr style="width: 60%;">
				<table>
					<tr>
						<th>이메일</th>
						<td class="td" id="email">${list.email}</td>

						<td class="btnbox">
							<button class="button">수정</button>

						</td>
					</tr>
				</table>
				<hr style="width: 60%;">
				<table>
					<tr>
						<th></th>
						<td></td>

						<td class="btnbox">
							<button class="update">수정완료</button>

						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<script>
	$(".trycatch").on("click",function(){
		window.location.href="/index.jsp";
	})//index로가기
	
		$(".button").on("click",function(){
			let tr = $(this).closest("tr");
			let td = tr.find("td.td");
			let btnbox = tr.find("td.btnbox");
			let btn = $(this);
			let complete = $("<button>").text("완료").addClass("complete");
			let cancel = $("<button>").text("취소").addClass("cancel");
			
			td.attr("contenteditable","true").focus();
			btn.hide();
			btnbox.append(complete,cancel);
			
			cancel.on("click",function(){
				cancel.hide();
				complete.hide();
				btn.show();
				
				td.attr("contenteditable","false");
				
			});
			
			complete.on("click",function(){
				$(".id").val($("#id").text());
				$(".name").val($("#name").text());
				$(".nickname").val($("#nickname").text());
				$(".phone").val($("#phone").text());
				$(".email").val($("#email").text());
				
				cancel.hide();
				complete.hide();
				btn.show();
				td.attr("contenteditable","false");
			})
			
			
		
		});
		
		$(".update").on("click",function(){
			if($(".id").val()==""||$(".name").val()==""||$(".nickname").val()==""||$(".phone").val()==""||$(".email").val()==""){
				alert("수정을 하고 눌러주세요");
				return
			}
			else{
			$("#frm").submit();
			}
		})
		
		
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