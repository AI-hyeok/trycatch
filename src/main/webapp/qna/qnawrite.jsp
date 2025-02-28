<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>게시글 작성</title>
<style>

.background-img {
         position: fixed;
         top: 0;
         left: 0;
         width: 100vw;
         height: 100vh;
         z-index: -1;
      }

  body {
    font-family: 'Arial', sans-serif;
    background-color: #f7f7f7;
    margin: 0;
    padding: 0;
  }

  .container {
    width: 80%;
    max-width: 900px;
   
    margin: 100px auto;
    background-color: rgba(255, 255, 255, 0.4);
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
  }

  h1 {
    font-size: 24px;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
  }

  table {
    width: 100%;
   margin: auto;
    border-collapse: collapse;
  }

  th, td {
    padding: 10px;
    text-align: left;
  }

  th {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
  }

  input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 16px;
  }

  textarea {
    resize: vertical;
   width: 100%;
   height: 100%;
  }

  .cbtn{
   padding: 15px 30px;
    background: linear-gradient(135deg, #918fc7, #3e3ac5); 
    color: white;  
    font-size: 16px; 
    border: none;  
    border-radius: 50px;  
    cursor: pointer;  
    text-decoration: none; 
    font-weight: bold;  
    transition: all 0.3s ease;  
}
.cbtn:hover {
    transform: translateY(-5px);  
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
    background: linear-gradient(135deg, #3e3ac5, #918fc7);  
}

.cbtn:active {
    transform: translateY(0); 
    box-shadow: none; 
}

  .checkbox-container {
    margin-top: 10px;
  }

  .checkbox-container input {
    margin-right: 5px;
  }

  .form-footer {
    text-align: right;
  }

  .form-footer button {
    margin-right: 10px;
  }
</style>
</head>
<body>
   <img class="background-img" src="images/BGI.jpg">
<div class="container">
  <h1>글 작성하기</h1>
  <form action="/toqnawrite.qnaboard" onsubmit="return validateForm();">
    <table>
      <tr>
        <td colspan="2">
          <input id="title" name="title" type="text" placeholder="제목을 입력하세요">
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <textarea id="contents" name="contents" cols="200" rows="20" placeholder="내용을 입력해주세요"></textarea>
        </td>
      </tr>
      <tr>
        <td class="checkbox-container" colspan="2">
          <input type="checkbox" name="secret" value="Y">비공개
        </td>
      </tr>
      <tr class="form-footer">
        <td colspan="2" style="position:relative">
          <button type="submit" class="cbtn" id="btn">작성완료</button>
          <button class="cbtn" type="reset">취소</button>
          <button type="button"id="listBtn" class="cbtn" style="position:absolute; right:0;">목록으로</button>
        </td>
      </tr>
    </table>
  </form>
</div>

<script>
  let profanityList = ["바보", "멍청이", "개똥", "새끼", "똥개", "꼰대", "놈", "년"];  // 실제 비속어로 교체해주세요

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
  
  $(document).ready(function() {
	    // "목록으로" 버튼 클릭 시 이동
	    $("#listBtn").on("click", function(){
	        location.href = "/qnalist.qnaboard";
	    });

	    // 작성완료 버튼 클릭 시 유효성 검사
	    $("#btn").on("click", function(event){
	        if (!validateForm()) {
	            event.preventDefault();  // 폼 제출 방지
	        }
	    });
  });
</script>

</body>
</html>
