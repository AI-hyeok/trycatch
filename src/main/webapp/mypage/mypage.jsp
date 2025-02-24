<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
 <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; }
    
        
        .head{
            height: 60px;
            display: flex;
            align-items: center;
            font-size: 35px;
            font-weight: bold;
            padding-left: 20px;
            width: auto;
            
        }
        .trycatch{
        	cursor:pointer;
        }
        .titlemypage{
            font-size: 18px;
            height: 60px;
            display: flex;
            align-items: end;
            padding-bottom: 10px;
            margin-left: 15px; 
            width: auto;
          
        }
        .naviva{
            width:100%;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
            background:black;
        }
        .naviva>.mypage,.whole_ranking,.community,.QandA{
            float:left;
            width:15%;
            height:100%;
            display:flex;
            align-items:center;
            justify-content:center;
            color:white;
            background:black;
            font-size:20px;
            cursor:pointer;
        
        }
        .first{
            margin-top: 100px;
            display: flex;
            
            height: 800px;
            border:none;
            
            
        }
        .list{
            width: 300px;
            background-color: #d9d9d9;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px ;
        }
        li{
            list-style: none;
        
        display: flex;
        align-items: center;
        justify-content: center;
        height: 40px;
        cursor: pointer;
        font-size: 18px;
        font-weight: bold;
        }
        .inforbox{
            
            width: 800px;
            height: 700px;
            border-radius: 20px;
            background-color: #d9d9d9;
            border:none;
            margin-left: 15%;
        }
        .information{
            width: auto;
            margin-left: 30px;
            padding-top: 30px;
            font-size: 20px;
            font-weight: bold;
        }
       
        .inforboxSceond{
            height: 25%;
            display: flex;
         
            font-size: 20px;
            margin-top: 5px;
        }
        .profilebox{
            width: 18%;
            display: flex;
            justify-content: center;
            align-items: center;
            
            
        }
        .profile{
            margin-left: 10px;
            background-color: rgb(241, 198, 205);
            width: 70%;
            height: 60%;
            border-radius: 100px;
        }
        .idAndEmail{
            width: 60%;
            
        }
        .name{
           
            height: 30%;
            padding-top: 30px;
        }
        .id{
            height: 40%;
            padding-top: 20px;
           
        }
       
        .myInformation{
            width: 22%;
            display: flex;
            justify-content: center;
            align-items: end;
            font-weight: bold;
            

        }
        .inforboxThird{
            margin-top: 5%;
            height: 55%;
            font-weight: bold;
            font-size: 20px;
        }
        .email{
            width: 80%;
            margin-left: 150px;
        }
        .phone{
            width: 40%;
            margin-left: 150px;
            margin-top: 40px;
            
        }
        .birth{
            width: 40%;
            margin-left: 150px;
            margin-top: 40px;
        }
        .register{
            width: 40%;
            margin-left: 150px;
            margin-top: 40px;
        }
        .warning{
            width: 40%;
            margin-left: 150px;
            margin-top: 40px;
        }
        
    </style>
</head>
<body>

 <div class="container">
        <div class="head"><p class="trycatch">Try Catch</p><p class="titlemypage">마이페이지</p></div>
        <div class="naviva">
             <div class="mypage">마이페이지</div>
            <div class="whole_ranking" >전체 랭킹</div>
            <div class="community">커뮤니티</div>
            <div class="QandA">Q&A</div>
        </div>

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
            <div class="inforbox">
                <div class="information">기본정보</div>
                <div class="inforboxSceond">
                    <div class="profilebox">
                        <div class="profile"></div>
                    </div>
                    <div class="idAndEmail">
             	
                    	<div class="name">${list.name}</div>
                        <div class="id">아이디: ${list.m_id}</div>
                        <div class="nickname">닉네임: ${list.nickname}</div>
                       
                    </div>
                    <div class="myInformation">내 정보</div>
                </div>
                <hr style="width: 100%">
                <div class="inforboxThird">
                
                	<div class="email">이메일: ${list.email}</div>
                    <div class="phone">전화번호: ${list.phone}</div>
                    <div class="birth">생년월일: ${list.birth}</div>
                 <div class="register">가입일자: ${list.signup_date}</div>
               	<div class="warning">경고횟수: ${list.warning_count}</div>
           
                </div>
                
            </div>
        </div>
       
    </div>

	<script>
	//헤드바
	$(".trycatch").on("click",function(){
		window.location.href="/index.jsp";
	})//index로가기

	
	
	//네비바
	$(".mypage").on("click",function(){
		window.location.href="/mypage/mypage.jsp";
	})//마이페이지로가기
	
	$(".whole_ranking").on("click",function(){
		window.location.href="/rank/ranklist.jsp";
	})//전체랭킹가기
	
	$(".community").on("click",function(){
		window.location.href="/common/comlist.jsp";
	})//자유게시판가기
	
	$(".QandA").on("click",function(){
		window.location.href="/qna/qnalist.jsp";
	})//qna게시판가기
	
	
	
	//리스트
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