<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<form action="/toqnawrite.qnaboard" onsubmit="return validateForm();">
		<table border="1">
			<tr>
				<th>글 작성하기</th>
			</tr>
			<tr>
				<td><input id="title" name="title" type="text" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<td><textarea id="contents" name="contents" cols="200" rows="20"
						placeholder="내용을 입력해주세요"></textarea></td>
			</tr>
			<tr align="right">
				<td>
				<input type="checkbox" name="secret" value="Y">비공개
				<button id="btn">작성완료</button>
				<button type="reset">취소</button></td>
			</tr>
		</table>
	</form>
<script>
	let profanityList = ["바보","멍청이","개똥","새끼","똥개","꼰대","놈","년"];  // 실제 비속어로 교체해주세요
	 // 비속어 검사 함수
	 function containsProfanity(input) {
	     for (let word of profanityList) {
	         if (input.includes(word)) {
	             return true;  
	         }
	     }
	     return false;  
	 }

	 function validateForm() {
	     let title = document.getElementById("title").value.trim();
	     let contents = document.getElementById("contents").value.trim();

	 
	     if (containsProfanity(title)) {
	         alert("제목에 비속어가 포함되어 있습니다.");
	         return false;
	     }

	     if (containsProfanity(contents)) {
	         alert("내용에 비속어가 포함되어 있습니다.");
	         return false;
	     }

	     if (title == "" || contents == "") {
	         alert("제목과 내용을 입력해주세요.");
	         return false;
	     }

	     return true;
	 }
	 $("#btn").on("click", function(event){
			if ($("#title").val() == "") {
				alert("제목을 입력해주세요");
				event.preventDefault(); 
			} 
			else if ($("#con").val() == "") {
				alert("내용을 입력해주세요");
				event.preventDefault(); 
			}
		});
		
</script>
</body>
</html>