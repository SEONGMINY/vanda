<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
	
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<h2>회원정보 수정</h2>
	<form id="editINFO" action="editINFO" method="post"
		onsubmit="return check()">
		<table>
			<tr>
				<td>아이디 : ${check.user_id}</td>
			</tr>
			<tr>
				<td>휴대전화 : <input type="text" name="user_tel"
					placeholder="${check.user_tel}" /></td>
			</tr>
			<tr>
			<tr>
				<td><input type="submit" value="회원정보 수정" /></td>
			</tr>

		</table>
	</form>
	<h1>비밀번호 변경</h1>
	<form id="myPage" action="myPage" method="post"
		onsubmit="return check()">
		<table>
			<tr>
				<td><input type="password" name="user_pass" placeholder="비밀번호" /></td>
			</tr>

			<tr>
				<td><input type="password" name="confirm" placeholder="비밀번호확인" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="비밀번호 변경" /></td>
			</tr>
			<tr>
				<td><input type="button" value="홈으로"
					onclick="location.href='/'" /></td>
			</tr>

			<tr>
				<td><input type="button" value="회원탈퇴하기"
					onclick="location.href='bye'" /></td>
			</tr>
		</table>
	</form>

	<h1>기기등록</h1>
	<br>
	<form action="registerDev" method="post">
		기기명 : <input type="text" name="device_id"> <br>
		
		 기기 타입 : 
		 <select name="device_type" >
			<option value="0">체중계</option>
			<option value="1">배식기</option>
		</select> 
		<br>
		<input type="submit" value="등록">
	</form>

</body>
</html>