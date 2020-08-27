<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<c:forEach items="${roomList}" var="room">
	<tr>
		<td>${room.room_num}</td>
		<td><a class="move" href="/chat/chatView?room_num=${room.room_num }">${room.user_id},${room.doc_id}</a></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>