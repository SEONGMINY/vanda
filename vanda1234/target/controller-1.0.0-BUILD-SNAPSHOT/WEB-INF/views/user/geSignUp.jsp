<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/login.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/notLogin-menu.jsp">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
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
<body>
  <header>
    <%@ include file="../notLogin-menu.jsp" %>
    </header>

 <!-- <section id="container">
			<form action="geSignUp" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="user_id">아이디</label>
					<input class="form-control" type="text" id="user_id" name="user_id" />
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_name">이름</label>
					<input class="form-control" type="text" id="user_name" name="user_name" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_sex">성별</label>
					<input class="form-control" type="text" id="user_sex" name="user_sex" />
					<input type="radio" name="user_sex" value="M" checked>남
                     <input type="radio" name="user_sex" value="F" checked>여

				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_pass">비밀번호</label>
					<input class="form-control" type="password" id="user_pass" name="user_pass" />
				</div>
						<div class="form-group has-feedback">
					<label class="control-label" for="user_pass">비밀번호 확인</label>
					<input class="form-control" type="password" id="user_pass2" name="user_pass2" />
				</div>
				
				
				<div class="form-group has-feedback">
					<label class="control-label" for="user_tel">연락처</label>
					<input class="form-control" type="text" id="user_tel" name="user_tel" />
				</div>
				</form>
				<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
		
		</section> -->

   
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="loginForm" action="login" method="post" onsubmit="return login()">
					<span class="login100-form-title p-b-43">
						Sign Up
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_id" id="user_id" >
						<span class="focus-input100"></span>
						<span class="label-input100" type="text" id="user_id" name="user_id">Email</span>
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_name" id="user_name">
						<span class="focus-input100"></span>
						<span class="label-input100">Name</span>
					</div>
					
					
					<div class="form-group has-feedback">
					<label class="control-label" for="user_sex">성별</label>
					<!-- <input class="form-control" type="text" id="user_sex" name="user_sex" /> -->
					<input type="radio" name="user_sex"  id="user_sex"value="M" checked>남
                     <input type="radio" name="user_sex"id="user_sex" value="F" checked>여

				</div>
				
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="user_pass" id="user_pass">
						<span class="focus-input100"></span>
						<span class="label-input100" type="password" id="user_pass" name="user_pass">Password</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="user_pass" id="user_pass2">
						<span class="focus-input100"></span>
						<span class="label-input100" type="password" id="user_pass2" name="user_pass2">Password Confirm</span>
					</div>
				
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="text" name="user_tel" id="user_tel">
						<span class="focus-input100"></span>
						<span class="label-input100" type="text" id="user_tel" name="user_tel">Phone Number</span>
					</div>
			
							
					<div class="container-login100-form-btn">
						<button class="login100-form-btn""type="button" id="submit">
							Sign Up
						</button>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2"><a href="login">
							or sign in using</a>
						</span>
					</div>

					<div class="login100-form-social flex-c-m" id="kakao_id_login" style="text-align: center">
	<a href = "https://kauth.kakao.com/oauth/authorize?client_id=a31608bb93320540275258229418df03&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">
						
					<div class="kakao">	<img src="/resources/img/kakao_signUp_small.png"/></a>  </div>
							<!-- <i class="fa fa-facebook-f" aria-hidden="true"></i> -->
						</a>

						<!-- <a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a> -->
					</div>
				</form>

				
				</div>
			</div>
 
</body>
</html>