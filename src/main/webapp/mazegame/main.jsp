<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.87.0/phaser.min.js" integrity="sha512-e251dDfxfj70o3iWsf84M612cWbWdTXjVbFXA7MavobTcKB1sCLV+WNiduc20UrpWLXRgi1tgob1TOAfySx9Xg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="Start.js"></script>
    <script src="SelectMode.js"></script>
    <script src="Play.js"></script>
    <script src="Play2.js"></script>
    <script src="Play3.js"></script>
    <script src="GameOver.js"></script>
    <script src="Rule.js"></script>
    
    <title>Main</title>
    <style>

.background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            object-fit: cover;
            z-index: -1;
        }

        .container{
            width:100%;
            height:100%;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction: column;
        }

        .logo{
            margin-top: 100px;
        }

        #gamebox{
            background-color: black;
            width:1023px;
            height:593px;
            margin:auto;
            top: 655px;
            left: 840px;
            z-index: 20;
            display:flex;
            justify-content:center;
            align-items:center;
            margin-top:55px;
            border-radius: 25px;
        }
        

    </style>
</head>
<body>
    <img class="background-img" src="images/gamePage4.jpg">
    <div class="container">
        
        <div id="gamebox"></div>
        <a href="/index.jsp">
        <div class="logo"><img src="images/LogoW.png" style="height:150px;"></div>
        </a>
    </div>
    <script>
        let config = {
            type:Phaser.AUTO,
            parent:"gamebox",
            width:870,
            height:580,
            physics:{
                default:'arcade',
                arcade:{
                    //debug:true
                }
            },
            scene:[Start, SelectMode, Play, Play2, Play3, GameOver, Rule]
        };
        let game = new Phaser.Game(config);
    </script>
</body>
</html>