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
 <h1>소셜 회원 간편가입 </h1>
 <h2>회원 정보를 확인해주세요</h2>
 <section id="container">
			<form action="soSignUp" method="post" id="regForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="user_id">아이디</label>
					<input class="form-control" type="text" id="user_id" name="user_id" value="${kemail}" readonly="readonly"/>
					<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="user_id">이름</label>
					<input class="form-control" type="text" id="user_name" name="user_name" value="${kname}" readonly="readonly"/>
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
					<label class="control-label" for="user_sex">성별</label>
					<input type="radio" name="user_sex" value="M" checked>남
                     <input type="radio" name="user_sex" value="F" checked>여

				</div>	<!-- 

				
				
				<div class="form-group has-feedback">
					<label class="control-label" for="user_tel">연락처</label>
					<input class="form-control" type="text" id="user_tel" name="user_tel" />
				</div>-->
				</form>
				<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div> 
	
		</section>

   

 
</body>
</html>