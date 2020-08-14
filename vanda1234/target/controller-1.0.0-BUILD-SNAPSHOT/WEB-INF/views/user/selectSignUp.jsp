<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
* {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}
.wrap {
    height: 100%;
    width: 100%;
    background-image: url(../resources/images/login/dog.png);
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 380px;
    height: 600px;
    position: relative;
    margin: 6% auto;
    background: #fff;
    padding: 5px;
    overflow: hidden;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    box-shadow: 0 0 600px 9px #fcae8f;
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 30px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 110px;
    height: 100%;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border-radius: 30px;
    transition: .5s;
}
.social-icons {
    margin: 30px auto;
    text-align: center;
}
.social-icons img {
    width: 30px ;
    cursor: pointer;
}
.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    background: linear-gradient(to right, #ff105f, #ffad06);
    border: 0;
    outline: none;
    border-radius: 30px;
}
.checkbox {
    margin: 30px 10px 30px 0;
}
span {
    color: #777;
    font-size: 12px;
    bottom: 68px;
    position: absolute;
}
#login {
    left: 50px;
}
#register {
    left: 450px;
}
#kakao{
	margin: 20px 0px 0px 0px;
}
 </style>
</head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">General</button>
                    <button type="button" class="togglebtn" onclick="register()">Doctor</button>
                </div>
                <div class="social-icons">
                	
                    
                    <img src="../resources/images/login/fb.png" alt="facebook">
                    <img src="../resources/images/login/tw.png" alt="twitter">
                    <img src="../resources/images/login/gl.png" alt="google">
                </div>
                <form id="login" action="" class="input-group">
                   <!--  <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit">Login</button> -->
                    <input type="text" class="input-field"  id="user_id" name="user_id" placeholder="Email" required>
                    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                    <input type="text" class="input-field" name="user_name" id="user_name" placeholder="Your Name" required>
                    <label class="control-label" for="user_sex">성별</label>
					<!-- <input class="form-control" type="text" id="user_sex" name="user_sex" /> -->
					<input type="radio" name="user_sex"  id="user_sex"value="M" checked>남
                     <input type="radio" name="user_sex"id="user_sex" value="F" checked>여
                    
                    <input type="password" class="input-field"  name="user_pass" id="user_pass" placeholder="Enter Password" required>
                     <input type="password" class="input-field"  name="user_pass" id="user_pass2" placeholder="Enter Password" required>
                    <input type="text" class="input-field"  name="user_tel" id="user_tel" placeholder="Phone Number" required>
                   
                    <button class="submit">REGISTER</button>
                    
					<div class="login100-form-social flex-c-m" id="kakao_id_login" style="text-align: center">
	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=a31608bb93320540275258229418df03&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">
						
					<div class="kakao">	<img src="../resources/images/login/kakao_signUp_small .png"/></a>  </div>
							<!-- <i class="fa fa-facebook-f" aria-hidden="true"></i> -->
						
                </form>
                
                <form id="register" action="" class="input-group">
                 
                   <!--  <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit">Login</button> -->
                    <input type="text" class="input-field"  id="user_id" name="user_id" placeholder="Email" required>
                    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                    <input type="text" class="input-field" name="user_name" id="user_name" placeholder="Your Name" required>
                    <label class="control-label" for="user_sex">성별</label>
					<!-- <input class="form-control" type="text" id="user_sex" name="user_sex" /> -->
					<input type="radio" name="user_sex"  id="user_sex"value="M" checked>남
                     <input type="radio" name="user_sex"id="user_sex" value="F" checked>여
                    
                    <input type="password" class="input-field"  name="user_pass" id="user_pass" placeholder="Enter Password" required>
                     <input type="password" class="input-field"  name="user_pass" id="user_pass2" placeholder="Enter Password" required>
                    <input type="text" class="input-field"  name="user_tel" id="user_tel" placeholder="Phone Number" required>
                    <button class="submit">REGISTER</button>
                    
					<div class="login100-form-social flex-c-m" id="kakao_id_login" style="text-align: center">
	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=a31608bb93320540275258229418df03&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">
						
					<div class="kakao">	<img src="../resources/images/login/kakao_signUp_small .png"/></a>  </div>
							<!-- <i class="fa fa-facebook-f" aria-hidden="true"></i> -->
						
                </form>
               
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "110px";
                y.style.marginTop="-2000px";
            }

            $(document).ready(function(){
        		// 취소
        	$(".cencle").on("click", function(){
        		location.href = "/";
        	})
        	
        	$("#submit").on("click", function(){
        		if($("#user_id").val()==""){
        			alert("아이디를 입력해주세요.");
        			$("#user_id").focus();
        			return false;
        		}if($("#user_name").val()==""){
        			alert("이름을 입력해주세요.");
        			$("#user_name").focus();
        			return false;
        		}
        		if($("#user_pass").val()==""){
        			alert("비밀번호를 입력해주세요.");
        			$("#user_pass").focus();
        			return false;
        		}if($("#user_pass2").val()==""){
        			alert("비밀번호를 재입력해주세요.");
        			$("#user_pass2").focus();
        			return false;
        		}if($("#user_pass2").val() != $("#user_pass").val()){
        			alert("비밀번호가 틀립니다.!");
        			$("#user_pass2").focus();
        			return false;
        		}
        		if($("#user_sex").val()==""){
        			alert("성별을 입력해주세요.");
        			$("#user_sex").focus();
        			return false;
        		}
        		if($("#user_tel").val()==""){
        			alert("연락처를 입력해주세요");
        			$("#user_tel").focus();
        			return false;
        		}
        		var idChkVal = $("#idChk").val();
        		if(idChkVal == "N"){
        			alert("중복확인 버튼을 눌러주세요.");
        		}else if(idChkVal == "Y"){
        			
        			$("#regForm").submit();
        			alert("회원가입 성공!");
        		}
        	});
        }) 
        		function fn_idChk(){
        			$.ajax({
        				url : "idChk",
        				type : "post",
        				dataType : "json",
        				data : {"user_id" : $("#user_id").val()},
        				success : function(data){
        					if(data == 1){
        						alert("중복된 아이디입니다.");
        					}else if(data == 0){
        						$("#idChk").attr("value", "Y");
        						alert("사용가능한 아이디입니다.");
        					}
        				}
        			})
        		}
        </script>
    </body>
</html>