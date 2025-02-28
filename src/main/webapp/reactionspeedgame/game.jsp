<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        body{
            background-color: antiquewhite;
        }
        
        .title{
            margin-top: 100px;
            display: flex;
            justify-content: center;
            font-size: 40px;
            font-weight: bold;
        }
        .description{
            margin-top: 30px;
            display: flex;
            justify-content: center;
            font-size: 25px;
        }
        .startbtnbox{
            margin-top: 30px;
            display: flex;
            justify-content: center;
           
            height: 300px;
        }
        .startbtn{
            width: 250px;
            font-size: 30px;
            font-weight: bold;
            background-color: rgb(87, 119, 223);
            color: white;
            border: none;
            cursor: pointer;
            height: 100px;

        }
       
        .click{
            width: 300px;
            height: 300px;
            font-size: 30px;
            font-weight: bold;
            background-color: rgb(248, 1, 1);
            
            border: none;
            cursor: pointer;
            display: none;
            border-radius: 300px;
        
            
            
        }
        .text{
            display: flex;
            justify-content: center;
            font-size: 20px;
           
        }
        .count{
            display: flex;
            justify-content: center;
            font-size: 40px;
            font-weight: bold;
        }
        .result{
            display: flex;
            justify-content: center;
            font-size: 20px;
        }
        .quit{
            margin-top: 30px;
            display: flex;
            justify-content: center;
         
            height: 300px;
        }
        .quitbtn{
            width: 250px;
            font-size: 30px;
            font-weight: bold;
            background-color: rgb(223, 80, 80);
            color: white;
            border: none;
            cursor: pointer;
            height: 100px;
            display: none;
        }
         .registerbtn{
            width: 250px;
            font-size: 30px;
            font-weight: bold;
            background-color: rgb(126, 221, 107);
            color: white;
            border: none;
            cursor: pointer;
            height: 100px;
            margin-left: 30px;
            display: none;
        }
        
    </style>
</head>
<body>


   <div class="container">
    <p class="count"></p>
    <div class="title">Push Push!!</div>
    <div class="description">버튼이 나오면 클릭하세요!</div>
    <p class="text"></p>
    <p class="result"></p>
    <div class="startbtnbox"><button class="startbtn">시작!</button><button class="click"></button></div>
    <div class="quit"><button class="quitbtn" type="button">나가기</button><button class="registerbtn" type="button">점수 등록하기</button></div>
    

</div>

<script>
    let startTime;
    let waiting = true;
    let timer;
    let count = 0;
    let trycount = 1;
    let reactionTimes=[];
    let point =0;

    $(".quitbtn").on("click",function(){
       location.href="/index.jsp"
    })



    $(".startbtn").on("click",function(){
       $(".startbtn").hide();
       $(".text").text("초록색을 기다리세요..")
       $(".click").show();
       $(".count").text(trycount+"/3")
       wating=true;
       
       $(document).off("click");
       $(document).on("click",function(event){  //실행시 화면을 클릭했을때
        if(!$(event.target).hasClass("startbtn")&&$(event.target).hasClass("click")){ // 시작하고 미리 연타방지
        if(waiting){
         clearTimeout(timer); //측정시간 초기화
         $(".text").text("너무 빠르셨어요. 다시 시작해주세요.");
                $(".click").hide();  // 클릭 버튼 숨김
                $(".startbtn").show();  // 다시 시작 버튼 표시
                return
        }
        else if(!waiting){ // 제대로 눌렀을때때
             let reactionTime = Date.now() - startTime; //반응속도 측정정
                reactionTimes.push(reactionTime);
            $(".text").text("반응 속도: " + reactionTime + "ms");  // 반응 시간 표시
                $(".click").css("background-color","rgb(248, 1, 1)").hide();  // 클릭 버튼 숨김
                $(".startbtn").show();  // 다시 시작 버튼 표시
                count++;
                trycount++;
             
                waiting=true;
        }
        
       
        if(count==3){
            let avg = reactionTimes.reduce((a, b) => a + b) / reactionTimes.length;  // 평균 계산
            
            $(".description").text("Game Over");
            
            $(".text").text("측정결과: "+avg.toFixed(2)+"ms");
            if(avg.toFixed(2)<240){
                point = 1000;
                $(".result").text(point+"점");
            }
            else if(240<=avg.toFixed(2) && avg.toFixed(2)<=245){
                point = 950;
                $(".result").text(point+"점");
            }
            else if(246<=avg.toFixed(2) && avg.toFixed(2)<=250){
                point = 900;
                $(".result").text(point+"점");
            }
            else if(251<=avg.toFixed(2) && avg.toFixed(2)<=255){
                point = 850;
                $(".result").text(point+"점");
            }
            else if(256<=avg.toFixed(2) && avg.toFixed(2)<=260){
                point = 800;
                $(".result").text(point+"점");
            }
            else if(261<=avg.toFixed(2) && avg.toFixed(2)<=270){
                point = 750;
                $(".result").text(point+"점");
            }
            else if(271<=avg.toFixed(2) && avg.toFixed(2)<=280) {
                point = 700;
                $(".result").text(point+"점");
            }
            else if(281<=avg.toFixed(2) && avg.toFixed(2)<=290) {
                point = 650;
                $(".result").text(point+"점");
            }
            else if(291<=avg.toFixed(2) && avg.toFixed(2)<=300) {
                point = 600;
                $(".result").text(point+"점");
            }
            else if(301<=avg.toFixed(2) && avg.toFixed(2)<=320) {
                point = 550;
                $(".result").text(point+"점");
            }
            else if(321<=avg.toFixed(2) && avg.toFixed(2)<=350) {
                point = 500;
                $(".result").text(point+"점");
            }
            else if(351<=avg.toFixed(2) && avg.toFixed(2)<=370) {
                point = 450;
                $(".result").text(point+"점");
            }
            else if(371<=avg.toFixed(2) && avg.toFixed(2)<=380) {
                point = 400;
                $(".result").text(point+"점");
            }
            else if(381<=avg.toFixed(2) && avg.toFixed(2)<=390) {
                point = 350;
                $(".result").text(point+"점");
            }
            else if(391<=avg.toFixed(2) && avg.toFixed(2)<=400) {
                point = 300;
                $(".result").text(point+"점");
            }
            else if(401<=avg.toFixed(2) && avg.toFixed(2)<=410) {
                point = 250;
                $(".result").text(point+"점");
            }
            else if(411<=avg.toFixed(2) && avg.toFixed(2)<=420) {
                point = 200;
                $(".result").text(point+"점");
            }
            else if(421<=avg.toFixed(2) && avg.toFixed(2)<=450) {
                point = 150;
                $(".result").text(point+"점");
            }
            else if(451<=avg.toFixed(2) && avg.toFixed(2)<=500) {
                point = 100;
                $(".result").text(point+"점");
            }
            else if(501<=avg.toFixed(2) && avg.toFixed(2)<=550) {
                point = 50;
                $(".result").text(point+"점");
            }
            else if(551<=avg.toFixed(2)) {
                point = 0;
                $(".result").text(point+"점");
            }
            
            $(".startbtn").hide()
            $(".click").hide();

            $(".quitbtn").css("display","block");
            $(".registerbtn").css("display","block");
            
            $(".registerbtn").on("click",function(){
				
            	let formData = "gameScore=" + encodeURIComponent(point) + 
                "&gameId=" + encodeURIComponent(4) + 
                "&gameName=" + encodeURIComponent("반응속도테스트");
            	
            	
                fetch("/addScore.games", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: formData
                })
                .then(response => response.text())
                .then(data => {
                    if (data === "LOGIN_REQUIRED") {
                        alert("로그인을 하지 않은 상태에서는 점수를 저장할 수 없습니다.");
                    } else {
                        alert("점수가 성공적으로 저장되었습니다.");
                    }
                })
                .catch(error => {
                    console.error("서버 요청 중 오류 발생:", error);
                });
            });
        }

        }

       });
       

     
        timer = setTimeout(function(){
            $(".text").text("지금!") 
            $(".click").css("background-color","greenyellow")
            waiting=false;
            startTime=Date.now();
     
        },Math.random() * 3000 + 1000);

      
    


    });
    
    

    
</script>

</body>
</html>