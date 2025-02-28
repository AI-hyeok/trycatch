<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<style>
.list li { cursor: pointer; text-align: center; padding: 10px 0; font-weight: bold; font-size: 20px;}
   .id_login_button {
   width: 100%;
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 10px 10px 0px 0px;
   flex-direction: row;  /* 수평 배치 */
     gap: 0px;
}

#loginBox{
width:100%;
height:30%;
margin:0px;
padding:20px;
}

#loginBox>div{
   flex: 1; /* 각 div 요소의 크기를 동일하게 설정 */
  text-align: center;
  font-size: 20px;
  color:white;
}

n{
   position: relative;
   display: flex;
   padding: 90px;
   margin: 40px 0;
   color: #6a00ff;
   text-decoration: none;
   text-transform: uppercase;
   transition: 0.5s;
   letter-spacing: 4px;
   overflow: hidden;
   margin-right: 50px;
   font-size: 40px;
   font-weight: bold;
   margin-top: 70px;
}

#loginBox>div:hover {
   background: #fff700;
   color: #2d2736;
   box-shadow: 0 0 5px #fff700, 0 0 25px #fff700, 0 0 50px #fff700, 0 0
      200px #6a00ff;
   -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
}

n:nth-child(1) {
   filter: hue-rotate(270deg);
}

n:nth-child(2) {
   filter: hue-rotate(110deg);
}

n span {
   position: absolute;
   display: block;
}

n span:nth-child(1) {
   top: 0;
   left: 0;
   width: 100%;
   height: 2px;
   background: linear-gradient(90deg, transparent,#fff700);
   animation: animate1 1s linear infinite;
}

@keyframes animate1{
    0%{
        left: -100%;
    }
    50%,100%{
        left: 100%;
    }
}
n span:nth-child(2) {
   top: -100%;
   right: 0;
   width: 2px;
   height: 100%;
   background: linear-gradient(180deg, transparent, #fff700);
   animation: animate2 1s linear infinite;
   animation-delay: 0.25s;
}

@keyframes animate2{
    0%{
        top: -100%;
    }
    50%,100%{
        top: 100%;
    }
}
n span:nth-child(3) {
   bottom: 0;
   right: 0;
   width: 100%;
   height: 2px;
   background: linear-gradient(270deg, transparent, #fff700);
   animation: animate3 1s linear infinite;
   animation-delay: 0.50s;
}

@keyframes animate3{
    0%{
        right: -100%;
    }
    50%,100%{
        right: 100%;
    }
}
n span:nth-child(4) {
   bottom: -100%;
   left: 0;
   width: 2px;
   height: 100%;
   background: linear-gradient(360deg, transparent, #fff700);
   animation: animate4 1s linear infinite;
   animation-delay: 0.75s;
}

@keyframes animate4{
    0%{
        bottom: -100%;
    }
    50%,100%{
        bottom: 100%;
    }
}
th{width: 5%;font-size: 25px;text-align: center;}
.trycatch{
	cursor:pointer;
}
.list li:hover{
            font-size: 25px;
        }
h2{
	font-weight:bold;
}
span{
	font-weight:bold;
	color:white;
}
.background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
        }
        .listbox{
        	opacity:0.9;
        }
    	.main{
    		opacity:0.9;
    		background-color:white;
    		margin-left:1rem;
    	}
.headerLogoImg{
	width: 200px;
    height: auto;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="mypage/images/BGI.jpg" class="background-img">
	<div class="container">
        <header class="d-flex align-items-center p-3">
            <h1 class="h1 flex-grow-1 trycatch "><img class="headerLogoImg" src="mypage/images/LogoW.png"></h1>
            <span class="fs-4">내 랭킹보기</span>
        </header>

		<div class="id_login_button">
            <n id="loginBox">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <div class="mypage">마이페이지</div>
                <div class="whole_ranking">전체 랭킹</div>
                <div class="community">커뮤니티</div>
                <div class="QandA">Q&A</div>
            </n>
        </div>

		 <div class="row mt-4">
        <aside class="col-md-3 list bg-light p-3 rounded listbox">
            <ul class="list-unstyled">
              <hr><li class="myupdate">개인정보 수정</li><hr>
                <li class="myrank">내 랭킹 보기</li><hr>
                <li class="myboard">내 게시물 보기</li><hr>
                <li class="out">회원탈퇴</li><hr>
            </ul>
        </aside>
      
        <main class="p-4 col-md-8 rounded main">
            <h2>내 최고랭킹</h2>
            <hr>
            <table>
                <tr>
                    <th>게임명</th>
                    <th>점수</th>
                </tr>
            </table>
            <hr>
            <table>
                <tr>
                    <th>${list[0].gamename}</th>
                    <th>${list[0].highScore}</th>
                </tr>
            </table>
            <hr>
            <table>
                
                <tr>
                    <th>${list[1].gamename}</th>
                    <th>${list[1].highScore}</th>
                    
                </tr>
            </table>
            <hr>
            <table>
                
                <tr>
                    <th>${list[2].gamename}</th>
                    <th>${list[2].highScore}</th>
                    
                </tr>
            </table>
            <hr>
            <table>
                
                <tr>
                    <th>${list[3].gamename}</th>
                    <th>${list[3].highScore}</th>
                    
                </tr>
            </table>
            <hr>
            <table>
                
                <tr>
                    <th>${list[4].gamename}</th>
                    <th>${list[4].highScore}</th>
                    
                </tr>
            </table>
            <hr>
            <table>
                
                <tr>
                    <th>${list[5].gamename}</th>
                    <th>${list[5].highScore}</th>
                    
                </tr>
            </table>
        </main>
    </div>
</div>

      

			<script>
				$(".trycatch").on("click",function(){
					window.location.href="/index.jsp";
				})//index로가기	
				//네비바
				$(".mypage").on("click",function(){
					window.location.href="/mypage.mypages";
				})//마이페이지로가기
				
				$(".whole_ranking").on("click",function(){
					window.location.href="/ranklist.games";
				})//전체랭킹가기
				
				$(".community").on("click",function(){
					window.location.href="/list.comboard";
				})//자유게시판가기
				
				$(".QandA").on("click",function(){
					window.location.href="/qnalist.qnaboard";
				})//qna게시판가기	
					
					
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