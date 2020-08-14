<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>반려견 등록 페이지</h1>
	<!-- <script type="text/javascript">
	$(document).ready(function(){
		// 취소
	$(".cencle").on("click", function(){
		location.href = "/";
	})
	
	})
		function register(){
	$("#regForm").submit();
	alert("회원가입 성공!");}
	</script> -->
			<form action="petRegister" method="post" id="regForm" >
			
				<div class="form-group has-feedback">
					<label class="control-label" for="pet_name">강아지 이름</label>
					<input class="form-control" type="text" id="pet_name" name="pet_name" />
				
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pet_sex">성별</label>
						<input type="radio" name="pet_sex" value="M" checked>남
                     <input type="radio" name="pet_sex" value="S" checked>여	</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="kind_num">견종(kind테이블에 kind_num과 같게)</label><br>
					<select name="kind_num" id="kind_num">
   						 <option value="1">푸들</option>
   						 <option value="2">말티즈</option>

					</select>
<!-- 					<input class="form-control" type="password" id="kind_num" name="kind_num" placeholder="1만입력"/> -->
				</div>
								<div class="form-group has-feedback">
					<label class="control-label" for="food_num">사료</label><br>
					<select name="food_num" id="food_num">
   						 <option value="1">로얄캐닌 오비서티</option>
   						 <option value="2">로얄캐닌</option>
 

					</select>
				</div> 
				<!-- 		<div class="form-group has-feedback">
					<label class="control-label" for="kind_num">비밀번호 확인</label>
					<input class="form-control" type="password" id="user_pass2" name="user_pass2" />
				</div> -->
				
				
				<div class="form-group has-feedback">
					<label class="control-label" for="pet_age">강아지 나이 </label>
					<input class="form-control" type="text" id="pet_age" name="pet_age" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="pet_check">pet_check O또는X </label>
					<input class="form-control" type="text" id="pet_check" name="pet_check" />
				</div>
				
				<input type="submit" name="submit" value="submit">
				</form>
			<!-- 	<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" onclick="register()">반려견 등록</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
 -->

</body>
</html>