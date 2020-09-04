<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<p><c:out value="${check.user_rule}"></c:out></p>
	<form action="/consulting/roomRegist" method="post">
		<input type="radio" name="doc_id" value="lhs">이한슬
		<input type="radio" name="doc_id" value="kms">김민식
		<input type="radio" name="doc_id" value="cwj">최원준
		<input type="hidden" name="user_id" value="${check.user_id }"/>
		<button type="submit">방생성</button>
	</form>
	<form action="/consulting/roomList" method="post">
		<input type="hidden" name="user_id" value="${check.user_id }"/>
		<button id="roomList">방 리스트</button>
	</form>
	
	
	</script>
</body>
</html>