<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 랭킹</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        .container { width: 1400px; margin: auto; }
        
        /* 네비바 */
        .title_n_naviva { width: 100%; height: 10%; display: flex; align-items: center; }
        .title { font-size: 30px; font-weight: bold; flex: 1; text-align: end; padding-right: 10px; }
        .mypage { flex: 1; text-align: start; font-size: 18px; }
        .naviva { flex: 3; display: flex; justify-content: space-around; font-size: 20px; }
        
        /* 제목 */
        .wholerank_letter { 
            font-size: 30px; 
            font-weight: bold; 
            text-align: center; 
            margin: 30px 0; 
            border-bottom: 3px solid black; 
            padding-bottom: 10px; 
        }
        
        /* 랭킹 테이블 */
        .ranking_table_box { 
            width: 95%; 
            margin: auto; 
            display: flex; 
            flex-wrap: wrap; 
            justify-content: center; 
        }
        .ranking_table { width: 45%; margin: 20px; }
        .game_name_box { font-size: 25px; font-weight: bold; text-align: center; margin-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
        th { background: lightgray; }
    </style>
</head>
<body>
    <div class="container">
        <!-- 네비바 -->
        <div class="title_n_naviva">
            <div class="title">Try Catch</div>
            <div class="mypage">마이페이지</div>
            <div class="naviva">
                <div class="n_mypage">마이페이지</div>
                <div class="n_whole_ranking">랭킹</div>
                <div class="n_community">커뮤니티</div>
                <div class="n_QandA">Q&A</div>
            </div>
        </div>
        
        <!-- 전체 랭킹 제목 -->
        <div class="wholerank_letter">전체 랭킹</div>

        <div class="ranking_table_box">
            <c:forEach var="entry" items="${groupedRanks}">
                <div class="ranking_table">
                    <!-- 게임 이름 한 번만 출력 -->
                    <div class="game_name_box">${entry.key}</div>
                    <table>
                        <thead>
                            <tr>
                                <th>Rank</th>
                                <th>Nickname</th>
                                <th>Score</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rank" items="${entry.value}">
                                <tr>
                                    <td>${rank.rank}</td>
                                    <td>${rank.nickname}</td>
                                    <td>${rank.score}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
