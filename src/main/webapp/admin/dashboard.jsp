<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Document</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; }
        .head{ height: 60px; display: flex; align-items: center; font-size: 35px; font-weight: bold; padding-left: 20px; }
        .titlemypage{ font-size: 18px; height: 60px; display: flex; align-items: end; padding-bottom: 20px; margin-left: 15px; }
        .naviva{ width:100%; height: 70px; display: flex; align-items: center; justify-content: center; background:black; }
        .naviva>.mypage,.whole_ranking,.community,.QandA{ float:left; width:15%; height:100%; display:flex; align-items:center; justify-content:center; color:white; background:black; font-size:20px; }
        .first{ margin-top: 20px; display: flex; flex-direction: row; width: 100%; height: 800px; }
        .list{ width: 300px; background-color: #d9d9d9; border-top-left-radius: 20px; border-top-right-radius: 20px; }
        li{ list-style: none; display: flex; align-items: center; justify-content: center; height: 40px; }
        .chart-container { 
            flex-grow: 1; 
            display: flex; 
            justify-content: space-between; /* 차트를 좌우로 배치 */
            padding: 20px;
        }
        .chart-wrapper {
            width: 48%; /* 차트가 2개일 경우 각 차트의 너비를 48%로 설정 */
        }
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
                    <li><a href="/list.admins">회원 관리</a></li><hr>
                    <li>자유게시판 관리</li><hr>
                    <li>Q&A게시판 관리</li><hr>
                    <li><a href="/blacklist.admins">블랙리스트</a></li><hr>
                    <li><a href="/dashboard.admins">대쉬보드</a></li><hr>
                </ul>
            </div>
            <div class="chart-container">
                <div class="chart-wrapper">
                    <h3>플레이 횟수</h3>
                    <canvas id="playCountChart"></canvas>
                </div>
                <div class="chart-wrapper">
                    <h3>평균 점수</h3>
                    <canvas id="avgScoreChart"></canvas>
                </div>
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
    </div>
</body>
</html>
