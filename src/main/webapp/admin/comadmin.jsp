<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; }
        .head{ height: 60px; display: flex; align-items: center; font-size: 35px; font-weight: bold; padding-left: 20px; }
        .titlemypage{ font-size: 18px; height: 60px; display: flex; align-items: end; padding-bottom: 20px; margin-left: 15px; }
        .naviva{ width:100%; height: 70px; display: flex; align-items: center; justify-content: center; background:black; }
        .naviva>.mypage,.whole_ranking,.community,.QandA{ float:left; width:15%; height:100%; display:flex; align-items:center; justify-content:center; color:white; background:black; font-size:20px; }
        .first{ margin-top: 20px; display: flex; height: 800px; }
        .list{ width: 300px; background-color: #d9d9d9; border-top-left-radius: 20px; border-top-right-radius: 20px; }
        li{ list-style: none; display: flex; align-items: center; justify-content: center; height: 40px; }
        table{ margin-left: 20px; width: 1000px; height: 700px; border-radius: 10px; overflow-y: auto; display: block; }
        th, td{ border: 1px solid black; padding: 10px; text-align: center; }
        th{ height: 50px; }
        td{ height: 40px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="head">Try Catch <p class="titlemypage">관리자페이지</p></div>
        <div class="naviva">
            <div class="mypage">관리자페이지</div>
            <div class="whole_ranking">전체 랭킹</div>
            <div class="community">커뮤니티</div>
            <div class="QandA">Q&A</div>
        </div>
        <div class="first">
            <div class="list">
                <ul>
                    <li><a href="/admin/adminpage.jsp">회원 관리</li></a><hr>
                    <li>자유게시판 관리</li><hr>
                    <li>Q&A게시판 관리</li><hr>
                    <li><a href="/admin/blacklist.jsp">블랙리스트</li></a><hr>
                </ul>
            </div>
            <table>
                <tr>
                    <th>회원ID</th>
                    <th>회원명</th>
                    <th>회원닉네임</th>
                    <th>관리</th>
                </tr>
                <c:forEach var="i" begin="1" end="50">
                    <tr>
                        <td>user${i}</td>
                        <td>홍길동${i}</td>
                        <td>닉네임${i}</td>
                        <td>
                            <button>취소</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
