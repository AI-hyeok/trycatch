<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<title>SignUp</title>
<style>
* {
	box-sizing: border-box;
	margin:0;
	padding:0;
}
 body {
	
    background-image: url('images/signup5.jpg'); 
    background-size: cover; 
    background-position: center; 
   	background-repeat:no-repeat;
}

.container {
	width: 500px;
	margin: 0 auto;
	
}

.header {
	width: 100%;
	height: 150px;
	display: flex;
	align-items: center;
}

.title {
	width: 27%;
	font-size: xx-large;
	font-weight: bold;
	color:white;
	
}

.detailTitle {
	width: 73%;
	font-size: 18px;
	font-weight: bold;
	padding-top: 15px;
	color:white;
}

.contents {
	width: 100%;
}

.box1, .box2 {
	margin-bottom: 50px;
}

.inputText{
	border: 1px solid rgba(255,255,255,0.9);
	background-color: rgba(255,255,255,0.05);
	height: 50px;
	display: flex;
	align-items: center;
	padding: 0 10px;
	border-radius:10px;
	color:white;
}

.inputText input::placeholder{
	color:white;
}

.inputText i {
	margin-right: 10px;
	color:white;
}

.inputText input {
	width: 100%;
	border: none;
	height: 100%;
	background:transparent;
	color:white;
}


input[type="radio"] {
	transform: scale(0.5); 
	margin: 0;
	width:30px;
}

input[type="radio"]+label {
	font-size: 20px;

}

.rounded-top {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.rounded-bottom {
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.SignUpBtn {
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 15px;
}
#joinBtn{
	padding: 15px 30px;
    background: linear-gradient(135deg, #f39c12, #e74c3c); 
    color: white;  
    font-size: 16px; 
    border: none;  
    border-radius: 50px;  
    cursor: pointer;  
    text-decoration: none; 
    font-weight: bold;  
    transition: all 0.3s ease;  
}
#joinBtn:hover {
    transform: translateY(-5px);  
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); 
    background: linear-gradient(135deg, #e74c3c, #f39c12);  
}

#joinBtn:active {
    transform: translateY(0); 
    box-shadow: none; 
}


#checkbox, #checkbox2 {
	display: none;
}
.footer {
    width: 100%;
    background-color: rgba(0, 0, 0, 0.9); 
    color: white;  
    padding: 40px 20px; 
    text-align: center;  
    position: relative;  
    bottom: 0;
}

.footerContents {
    max-width: 1200px;  
    margin: 0 auto;  
    padding: 10px 20px;  
}

.logoText {
    font-size: 24px;  
    font-weight: bold;  
    margin-bottom: 15px;  
}

.footerTexts {
    font-size: 14px;  
    line-height: 1.6; 
    margin-top: 10px;  
    color: rgba(255, 255, 255, 0.8); 
}

.footerTexts a {
    color: rgba(255, 255, 255, 0.8); 
    text-decoration: none; 
}

.footerTexts a:hover {
    color: dodgerblue;  
    text-decoration: underline;  
    
}
#IDcheck {
    padding: 6px 25px;  
    background: #4c91d0  
    color: white;
    font-size: 12px;  
    border: none;
    border-radius: 20px;  
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s ease, transform 0.2s ease;
    margin-left: 10px;  
}
#IDcheck:hover {
    background: #3b8d8d;  
    transform: translateY(-1px);  
}

#IDcheck:active {
    background: #4c91d0;  
    transform: translateY(0);  
}
#nicknameCheck {
    padding: 6px 25px;  
    background: #4c91d0  
    color: white;
    font-size: 12px; 
    border: none;
    border-radius: 20px;  
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s ease, transform 0.2s ease;
    margin-left: 10px;  
}
#nicknameCheck:hover {
    background: #3b8d8d;  
    transform: translateY(-1px);  
}

#nicknameCheck:active {
    background: #4c91d0;  
    transform: translateY(0);  
}
#btn {
    padding: 6px 25px; 
    background: #4c91d0  
    color: white;
    font-size: 12px;  
    border: none;
    border-radius: 20px; 
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s ease, transform 0.2s ease;
    margin-left: 10px;  
}
#btn:hover {
    background: #3b8d8d; 
    transform: translateY(-1px);  
}

#btn:active {
    background: #4c91d0;  
    transform: translateY(0);  
}

</style>
</head>
<body>

	<form action="/membersInfoAdd.members" method="post" id="frm">
		<div class="container">
			<div class="header">
				<div class="title">TryCatch</div>
				<div class="detailTitle">회원가입</div>
			</div>
			<div class="contents">
				<div class="InputInfo">
					<div class="box1">
						<div class="inputText rounded-top">
							<i class="fa-regular fa-user"></i><input type="text" id="id"
								name="id" placeholder="아이디">
							<button type="button" id="IDcheck">중복확인</button>
						</div>
						<div id="checkbox"></div>
						<div class="inputText" style="position: relative;">
							<i class="fa-solid fa-lock"></i><input type="text" id="pw"
								name="password" placeholder="비밀번호">
								 <i class="fa-regular fa-eye" id="togglePassword"
                    			 style="position: absolute; right: 15px; cursor: pointer; color: gray;"></i>
								
						</div>
						<div class="inputText">
							<i class="fa-solid fa-lock"></i><input type="text" id="pw2"
								placeholder="비밀번호를 다시 입력해주세요.">
						</div>
						<div class="inputText rounded-bottom">
							<i class="fa-regular fa-envelope"></i><input type="text"
								name="email" id="mail" placeholder="[선택]이메일주소(아이디찾기 등 본인 확인용)">
						</div>
					</div>
					<div class="box2">
						<div class="inputText rounded-top">
							<i class="fa-regular fa-user"></i><input type="text" name="name"
								id="name" placeholder="이름">
						</div>
						<div class="inputText">
							<i class="fa-solid fa-circle-user"></i><input type="text"
								name="nickname" id="nickname" placeholder="닉네임">
							<button type="button" id="nicknameCheck">중복확인</button>
						</div>
						<div id="checkbox2"></div>
						<div class="inputText">
							<i class="fa-solid fa-calendar-days"></i><input type="text"
								id="birth" name="birth" placeholder="생년월일 8자리">
						</div>
						<div class="inputText">
							<i class="fa-solid fa-phone"></i><input type="text" name="phone"
								id="phone" placeholder="휴대전화번호">
						</div>
						<div class="inputText">
							<i class="fa-solid fa-star"></i><input type="radio" id="male"
								name="gender" value="남"><label for="male">남자</label><input
								type="radio" id="female" name="gender" value="여"><label
								for="female">여자</label>
						</div>
						<div class="inputText">
							<i class="fa-solid fa-hashtag"></i><input type="text"
								id="postcode" name="postcode" placeholder="우편번호" disabled>
							<button type="button" id="btn">우편번호 찾기</button>
						</div>
						<div class="inputText">
							<i class="fa-solid fa-house"></i><input type="text" id="address"
								name="address" placeholder="주소">
						</div>
						<div class="inputText rounded-bottom">
							<i class="fa-solid fa-house"></i><input type="text"
								name="detailAddress" placeholder="상세주소">
						</div>
					</div>
				</div>
				<div class="SignUpBtn" id="SignUpBtn">
					<button id="joinBtn">회원가입</button>
				</div>
			</div>
		</div>
	</form>
	<script>
	document.getElementById("togglePassword").addEventListener("click", function() {
        let passwordInput = document.getElementById("pw");
        let icon = this;

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passwordInput.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });

	function onlyOne(checkbox) {
        const checkboxes = document.getElementsByName('gender');
        checkboxes.forEach((item) => {
          if (item !== checkbox) item.checked = false;
        });
      }
   
    let isIdChecked = false;      
    let isNicknameChecked = false;
    
    $("#IDcheck").on("click", function () {
        let inputId = document.getElementById("id");
    	let idValue = $("#id").val();
    	let regexId = /^[a-z0-9]{8,20}$/; 
    	

		if(!inputId.value){
  			Swal.fire({
  				icon:"error",
  				title:"아이디를 입력하세요!",
  				html:"아이디는 8~20자리의 영문 소문자,숫자만 가능합니다."
  			});
  			inputId.focus();
  			return false;
  		}
  		
  		 if (!regexId.test(inputId.value)) {
  			$("#checkbox").text("영문 소문자 및 숫자로 8~20자 입력하세요.").css({"color": "red", "display": "block"});
		        

             Swal.fire({
                 icon: "error",
                 title: "잘못된 입력!",
                 text: "아이디는 8~20자리의 영문 소문자, 숫자만 가능합니다."
                
             });
             
             inputId.focus();
             return false;
         }
  	
             

  		 if($("#id").val==""){
  			 $("#checkbox").text("").css("display","none");
  			 alert("ID를 입력해주세요.");
  			 return;
  		 }
  		 	$.ajax({
              url:"/idcheck.members",
              type:"post",
              data:{
            	  id:$("#id").val()
            	  }
           }).done(function(resp){
				
              if(resp=="이미 사용중인 아이디입니다."){
              $("#checkbox").text(resp).css({"color":"red","display":"block"});
              	
              }
              else{
                 $("#checkbox").text(resp).css({"color":"dodgerblue","display":"block"});
              
                 }
        	});
  		 	isIdChecked = true;
    });
      
      $("#nicknameCheck").on("click",function(){
    	  	let inputNickname = document.getElementById("nickname");
    		let nicknameValue = $("#nickname").val();  	
      		let regexNickname = /^[a-zA-Z0-9가-힣]{2,20}$/;
      		 if (!inputNickname.value) {
             	Swal.fire({
 	            	icon : "error",
     	        	title: "닉네임을 입력해주세요.",
         	    	text : "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다."
             	
             	});
             	nickname.focus();
             	return false;
             }
             if(!regexNickname.test(nickname.value)){
            	 $("#checkbox2").text("닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다.(띄어쓰기x)").css({"color": "red", "display": "block"});	
            	 Swal.fire({
            			icon: "error",
            			title: "잘못된 입력",
            			text: "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다.(띄어쓰기x)"
            			
            		});
            		nickname.focus();
            		return false;
             }
     	  
    	  if($("#nickname").val()==""){
    		  $("#checkbox2").text("").css("display","none");
    		  alert("닉네임을 입력해주세요.");
    		  return;
    	  }
      	
    	  $.ajax({
      		url:"/nicknameCheck.members",
      		type:"post",
      		data:{nickname:$("#nickname").val()}
      		
      	}).done(function(resp){
      		if(resp=="이미 사용중인 닉네임입니다."){
      			$("#checkbox2").text(resp).css({"color":"red","display":"block"});
      		
      				
      		}else{
      			$("#checkbox2").text(resp).css({"color":"dodgerblue","display":"block"});
      		
      		};
      		isNicknameChecked = true;
      	});
    	  
      });
      
      
     
      
      
      document.getElementById("btn").onclick = function () {
          new daum.Postcode({
              oncomplete: function (data) {
                  document.getElementById("postcode").value = data.zonecode;
                  document.getElementById("address").value = data.roadAddress;
              }
          }).open();
      };
      
      let frm = document.getElementById('frm');
      let inputId = document.getElementById('id');
      const pw = document.getElementById('pw');
      const pw2 = document.getElementById('pw2');
      let mail = document.getElementById("mail");	
      let name = document.getElementById("name");
      let nickname = document.getElementById("nickname");
      let birth = document.getElementById("birth");
      let phone = document.getElementById("phone");
      
      
      $("#SignUpBtn").on("click",function(){
    	  
      
    	  event.preventDefault();
      		let regexId = /^[a-z0-9]{8,20}$/;
      		let regexPw = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
      		let regexName = /^[가-힣]{2,5}$/;
      		let regexPhone = /^010-?\d{4}-?\d{4}$/;
      		let regexMail = /^\S+@\S+\.\S+$/;
			let regexNickname = /^[a-zA-Z0-9가-힣]{2,20}$/;
			let regexBirth = /^\d{8}$/;   
      		
      		if(!inputId.value){
      			Swal.fire({
      				icon:"error",
      				title:"아이디를 입력하세요!",
      				html:"아이디는 8~20자리의 영문 소문자,숫자 만 가능합니다."
      			});
      			inputId.focus();
      			return false;
      		}
      		
      		 if (!regexId.test(inputId.value)) {

                 Swal.fire({
                     icon: "error",
                     title: "잘못된 입력!",
                     text: "아이디는 8~20자리의 영문 소문자, 숫자만 가능합니다."
                    
                 });
                 inputId.focus();
                 return false;
             }
      		 
      		 if ($("#checkbox").text() === "이미 사용중인 아이디입니다.") {
                 Swal.fire({
                     icon: "error",
                     title: "아이디 중복 확인",
                     text: "이미 사용중입니다. 다른 아이디를 입력해주세요."
                 });
                 return false;
             }
      	
      		if (!pw.value) {
                Swal.fire({
                    icon: "error",
                    title: "패스워드를 입력하세요!",
                    text: "패스워드는 8자 이상의 영문 대/소문자, 숫자를 포함해야 합니다."
                   
                });
                pw.focus();
                return false;
            }
      	
      		if (!regexPw.test(pw.value)) {
                Swal.fire({
                    icon: "error",
                    title: "잘못된 입력!",
                    text: "패스워드는 8자 이상의 영문 대/소문자, 숫자를 포함해야 합니다."
      
                });
                pw.focus();
                return false;
            }

            if (pw.value !== pw2.value) {
                Swal.fire({
                    icon: "error",
                    title: "잘못된 입력!",
                    text: "패스워드가 일치하지 않습니다. 다시 입력해주세요."
                   
                });
                pw2.focus();
                return false;
            }
            
            if(!mail.value){
            	Swal.fire({
            		icon:"error",
            		title:"이메일을 입력해주세요",
            		text:"이메일 형식으로 입력해주세요. ex)abc@naver.com"           	
            	});
            	mail.focus();
            	return false;
            }
            
            if (!regexMail.test(mail.value)) {
                Swal.fire({
                    icon: "error",
                    title: "잘못된 입력!",
                    text: "이메일 형식으로 입력해주세요. ex)abc@naver.com"
                });
                mail.focus();
                return false;
            }
      	
            if (!name.value) {
                Swal.fire({
                    icon: "error",
                    title: "이름을 입력하세요!",
                    text: "이름은 한글 2~5자로 입력해주세요."
                 
                });
                name.focus();
                return false;
            }

            if (!regexName.test(name.value)) {
                Swal.fire({
                    icon: "error",
                    title: "잘못된 입력!",
                    text: "이름은 한글 2~5자로 입력해주세요."
                    
                });
                name.focus();
                return false;
            }

            if (!nickname.value) {
            	Swal.fire({
	            	icon : "error",
    	        	title: "닉네임을 입력해주세요.",
        	    	text : "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다."
            	
            	});
            	nickname.focus();
            	return false;
            }
            if(!regexNickname.test(nickname.value)){
           		Swal.fire({
           			icon: "error",
           			title: "잘못된 입력",
           			text: "닉네임은 2~20자리 영문 대/소문자, 숫자, 한글만 입력 가능합니다.(띄어쓰기x)"
           			
           		});
           		nickname.focus();
           		return false;
            }
            if ($("#checkbox2").text() === "이미 사용중인 닉네임입니다.") {
                Swal.fire({
                    icon: "error",
                    title: "닉네임 중복 확인",
                    text: "닉네임이 이미 사용중입니다. 다른 닉네임을 입력해주세요."
                });
                return false;
            }
            
            if(!birth.value){
            	Swal.fire({
	
            	icon : "error",
            	title: " 생년월일을 입력해주세요.",
            	text : "생년월일은 8자리 숫자만 입력 가능합니다. 예) 19990101 / YYYYMMDD"
            	});
            	birth.focus();
            	return false;

            	}
             
            if(!regexBirth.test(birth.value)){
            	Swal.fire({
            		icon: "error",
            		titile: "잘못된 입력",
            		text: "생년월일은 8자리 숫자만 입력 가능합니다. 예) 19990101 / YYYYMMDD"
            		
            	});
            	birth.focus();
            	return false;	
            }
            
            if (phone.value && !regexPhone.test(phone.value)) {
                Swal.fire({
                    icon: "error",
                    title: "잘못된 입력!",
                    text: "전화번호의 형식은 010-XXXX-XXXX/010XXXXXXXX/010 XXXX XXXX입니다."
                });
                phone.focus();
                return false;
            }
	
            
            
            
            
             
              
                if (!isIdChecked || !isNicknameChecked) {
                    event.preventDefault();  
					
                 
                    Swal.fire({
                        icon: "warning",
                        title: "중복검사를 먼저 해주세요!",
                        text: "아이디와 닉네임의 중복검사를 먼저 해주세요."
                    });
                } else {
                	$.ajax({
                  		url:"/idNickCheck.members",
                  		type:"post",
                  		data:{nickname:$("#nickname").val(),
                  			id:$("#id").val()}
                  	}).done(function(resp){
                  		if(resp=="true"){
                  			
                  			Swal.fire({
                  				icon : "warning",
                  				text: "이미 사용중인 아이디/닉네임 입니다."
                  			});      
                  		}else{
                  			 Swal.fire({
                                 position: "center",
                                 icon: "success",
                                 title: "회원가입이 완료되었습니다.",
                                 showConfirmButton: false,
                                 timer: 2500
                             }).then(() => {
                                 frm.submit();
                             });
                  		};
                  	});
                } 
      });
      
    
    </script>

</body>
<div class="row footer">
			<div class="col-12 footerContents">
				<div class="col-12 logoText">Try Catch</div>
				<div class="col-12 footerTexts">
					이메일:trycatch@gmail.com|채팅 : 카카오톡 채널(아이디 트라이캐치)<br> <br>충청남도
					천안시 서북구 두정중10길|전화번호 : 1633-122001<br> <br>© Try catch
					Korea Corporation All Rights Reserved.
				</div>
			</div>
		</div>

</html>