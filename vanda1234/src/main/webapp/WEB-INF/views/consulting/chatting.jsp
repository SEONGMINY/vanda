<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
	<p>${user.user_id }</p>
	<p>${room.room_num}</p>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="submit"/>
	<div id="messageArea"></div>
	<table id="messageList">
		<c:forEach items="${msgList}" var="msg">
		<tr>
		<td>${msg.user_id}:${msg.msg_content}</td>
		</tr>
		</c:forEach>
	</table>
	
</body>

<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		insertMsg();
		$('#message').val('');
	});

	let sock = new SockJS("http://localhost:8080/chat/chatting");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage() {
		sock.send("${user.user_id}:"+$("#message").val());
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageList").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}

	// 메세지 DB저장
	function insertMsg(){
		$.ajax({	
			url:"/chat/insertMsg", 
			data:  {
				room_num:${room.room_num},
				user_id:"${user.user_id}",
				msg_content:$("#message").val()
			},
			type:"post",
			success:function(data){
				alert("메세지 db저장 성공");
			},
			error:function(error){
				alert("메세지 db저장 실패");
			}
		});
	}
</script>
</html>