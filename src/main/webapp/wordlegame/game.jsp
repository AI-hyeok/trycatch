<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Wordle</title>
    <style>
        html,
        body {
            background: var(--default);
        }


        #header {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 80px;
            background-color: black;
        }

        #title-box {
            font-size: 2rem;
            font-weight: bold;
            color: white;
            padding: 10px 20px;
        }

        :root {
            --default: #121213;
            --empty: #3a3a3c;
            --wrong: #b59f3b;
            --right: #538d4e;
        }

        /* 게임 시작 화면 */
        #start-screen {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            color: white;
        }

        #start-screen h1 {
            margin-bottom: 20px;
        }

        .menu-button {
            padding: 15px;
            margin: 10px;
            font-size: 1.2rem;
            cursor: pointer;
            width: 200px;
        }




        /* 게임화면 */
        #game {
            display: none;
            place-items: center;
            width: 100%;
            height: 300px;
        }

        .grid {
            display: grid;
            grid-template-rows: repeat(6, auto);
            grid-template-columns: repeat(5, auto);
        }

        .box {
            width: 60px;
            height: 60px;
            border: 2px solid var(--empty);
            margin: 4px;
            color: white;
            text-transform: uppercase;
            display: grid;
            place-items: center;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 2.4rem;
        }

        .box.empty {
            background: var(--empty);
        }

        .box.wrong {
            background: var(--wrong);
        }

        .box.right {
            background: var(--right);
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 25%;
            transform: translate(-50%, -25%);  /* 수평, 수직 중앙 정렬 */
            width: 100%;
            height: auto;
            background-color: rgba(0, 0, 0, 0);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: white;
            padding: 45px;
            border-radius: 8px;
            width: 80%;
            max-width: 400px;
            color: black;
            position: relative;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 24px;
            cursor: pointer;
            color: black;
        }
    </style>
</head>

<body>
    <div id="header">
        <div id="title-box">Wordle</div>
    </div>

     <!-- 게임 시작 화면 -->
     <div id="start-screen">
        <h1>Wordle</h1>
        <button class="menu-button" id="start-game-btn">게임 시작</button>
        <button class="menu-button" id="how-to-play-btn">게임 방법</button>
    </div>


    <!-- 게임 화면 -->
    <div id="game"></div>
    <div id="game-buttons" style="display: none; text-align: center; margin-top: 20px;">
        <button id="back-btn" class="menu-button" style="margin-top:150px; width:150px;">이전으로</button>
    </div>

    <div id="result-container" style="display: none; text-align: center; color: white;">
        <h2 id="result-message"></h2>
        <button id="restart-btn" style="padding: 10px; font-size: 1.2rem; cursor: pointer;">다시하기</button>
    </div>

    <!-- 게임 방법 모달 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span id="close-modal" class="close">&times;</span>
            <p>1. Wordle은 5글자 단어를 맞추는 게임입니다.</p>

            <p>2. 단어 작성하고 Enter 키를 누르시면됩니다. </p>

            <p>- 정답에 포함되고 같은 위치에 있는 글자는 배경이 <span class="right" style="color:green;">초록색</span>으로 표시됩니다.</p>

            <p>- 정답에 포함되어 있지만 다른 위치에 있는 글자는 배경이 <span class="wrong" style="color:rgb(255, 179, 0)">노란색</span>으로 표시됩니다.</p>

            <p>- 틀린 글자는 배경이 <span class="empty" style="color:gray;">회색</span>으로 표시됩니다.</p>

        </div>
    </div>
    
    <script src="index.js" type="module"></script>
</body>

</html>