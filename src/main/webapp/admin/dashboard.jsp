<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>ComList</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; }
        .list li {
        cursor: pointer;
        text-align: center;
        padding: 10px 0;
        font-weight: bold;
        font-size: 20px;
    }
    .list li:hover{
            font-size: 25px;
        }

    .naviva div {
        cursor: pointer;
        font-weight: bold;
        font-size: 20px;
    }
    .trycatch{
		cursor:pointer;
	}

        .chart-container { 
            flex-grow: 1; 
            display: flex; 
            justify-content: space-between; /* 차트를 좌우로 배치 */
            padding: 20px;
        }
        .chart-wrapper {
            width: 48%; /* 차트가 2개일 경우 각 차트의 너비를 48%로 설정 */
        }
                 span{
       	font-weight: bold;
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
    		
    		background-color:white;
    		margin-left:1rem;
    	}
    	.headerLogoImg{
	width: 200px;
    height: auto;
}
    </style>
</head>
<body>
<img src="admin/images/BGI.jpg" class="background-img">
    <div class="container">
        <header class="d-flex align-items-center p-3">
            <h1 class="h1 flex-grow-1 trycatch "><img class="headerLogoImg" src="admin/images/LogoW.png"></h1>
            <span class="fs-4">대시보드</span>
        </header>

        <nav class="naviva d-flex justify-content-around bg-dark text-white p-3">
            <div class="mypage">관리자페이지</div>
            <div class="whole_ranking">전체 랭킹</div>
            <div class="community">커뮤니티</div>
            <div class="QandA">Q&A</div>
        </nav>

        <div class="row mt-4">
            <aside class="col-md-3 list bg-light p-3 rounded listbox">
                <ul class="list-unstyled">
					<li class="members">회원 관리</li>
					<hr>
					<li class="blacklist">블랙리스트</li>
					<hr>
					<li class="dashboard">대시보드</li>
					<hr>
				</ul>
			</aside>

            <main class="p-4 col-md-8 rounded main">
            <div class="chart-container">
                <div class="chart-wrapper">
                    <h4>플레이 횟수</h4>
                    <canvas id="playCountChart"></canvas>
                </div>
                <div class="chart-wrapper">
                    <h4>평균 점수</h4>
                    <canvas id="avgScoreChart"></canvas>
                </div>
            </div>
            </main>
        </div>    

            <script>
                const stats = <%= new com.google.gson.Gson().toJson(request.getAttribute("stats")) %>;

                const labels = stats.map(item => item.gameName);
                const playCounts = stats.map(item => item.playCount);
                const avgScores = stats.map(item => item.avgScore);

                // 플레이 횟수 차트
                const playCountCtx = document.getElementById('playCountChart').getContext('2d');
                new Chart(playCountCtx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '플레이 횟수',
                            data: playCounts,
                            backgroundColor: ['rgba(54, 162, 235, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(75, 192, 192, 0.5)', 'rgba(153, 102, 255, 0.5)', 'rgba(255, 99, 132, 0.5)', 'rgba(255, 205, 86, 0.5)']
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            title: {
                                display: true,
                                text: '게임별 플레이 횟수'
                            }
                        }
                    }
                });

                // 평균 점수 차트
                const avgScoreCtx = document.getElementById('avgScoreChart').getContext('2d');
                new Chart(avgScoreCtx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: '평균 점수',
                            data: avgScores,
                            backgroundColor: ['rgba(54, 162, 235, 0.5)', 'rgba(255, 159, 64, 0.5)', 'rgba(75, 192, 192, 0.5)', 'rgba(153, 102, 255, 0.5)', 'rgba(255, 99, 132, 0.5)', 'rgba(255, 205, 86, 0.5)']
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            title: {
                                display: true,
                                text: '게임별 평균 점수'
                            }
                        }
                    }
                });
            </script>
        </div>
   		<script>
   	  $(".trycatch").on("click", function () {
          window.location.href = "/index.jsp";
      })//index로가기
      
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


   	   $(".members").on("click",function(){
   	        location.href="/list.admins";
   	   })//회원관리
   	   $(".blacklist").on("click",function(){
   	        location.href="/blacklist.admins";
   	   })//블랙리스트
   	   $(".dashboard").on("click",function(){
   	        location. href="/dashboard.admins";
   	   })//대시보드
   	   
   		</script>
</body>
</html>
