<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="/resources/css/styles2.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>
<div class="messaging">
  <div class="inbox_msg">
	<div class="inbox_people">
	  <div class="headind_srch">
		<div class="recent_heading">
		  <h4>상담 기록</h4>
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
			<input type="text" class="search-bar"  placeholder="Search" >
			</div>
		</div>
	  </div>
	  <!-- 상담 내역 -->
	  <div class="inbox_chat scroll">
	
	 
	 
	
		  <c:choose>
		  
		  	<c:when test="${check.user_rule eq 'member' }">
		  		<c:forEach items="${roomList}" var="room">
			  		<div class="chat_list" data-num="${room.room_num }">
				  		<div class="chat_people">
							<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
							<div class="chat_ib">
					  			<h5>${room.doc_id} 수의사님과 상담<span class="chat_date"></span></h5>
					  			<p><fmt:formatDate pattern="yyyy-MM-dd" value="${room.room_date}"></fmt:formatDate></p>
					  			<input type="hidden" id="roomNum" value="${room.room_num}"/>
							</div>
				  		</div>
					</div>
				</c:forEach>
		  	</c:when>
		  	
		  	<c:when test="${check.user_rule eq 'doctor' }">
		  		<c:forEach items="${roomDocList}" var="room">
			  		<div class="chat_list" data-num="${room.room_num }">
				  		<div class="chat_people">
							<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
							<div class="chat_ib">
					  			<h5>${room.user_id} 회원님과 상담<span class="chat_date"></span></h5>
					  			<p><fmt:formatDate pattern="yyyy-MM-dd" value="${room.room_date}"></fmt:formatDate></p>
					  			<input type="hidden" id="roomNum" value="${room.room_num}"/>
							</div>
				  		</div>
					</div>
				</c:forEach>
		  	</c:when>
		  	
		  </c:choose>
	  
	  	
		
	  </div>
	</div>
	
	<!-- 메세지 내용  -->	
	<div class="mesgs">
	  <div class="msg_history">
	
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="메세지를 입력하세요." />
		  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		</div>
	  </div>
	</div>
  </div>
</div>
<script type="text/javascript" src="/resources/js/chat.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var userId = "${check.user_id}"; // 유저 아이디
		var roomNum; // 방 번호
		var roomBox = $(".inbox_chat"); // 상당 내역 DIV
		var msgHistory = $(".msg_history"); // 채팅 DIV
		var msgInput = $(".write_msg"); // 채팅 치는 곳

		

		$(".chat_list").on("click", function(e){
			roomNum = $(this).data('num');
			msgList();
		});

		

		/* 메세지 불러오기  */
		function msgList(){
			chatService.msgList({room_num:roomNum},function(list){
				var str = "";

				if(list == null || list.length == 0){
					msgHistory.html("");
					return;
				}


				for(var i = 0;i<list.length;i++){
					
					if("${check.user_id}" == list[i].user_id){
						str += "<div class='outgoing_msg' data-roomNum='" + list[i].msg_num + "'>";
						str += "<div class='sent_msg'>";
						str += "<p>" + list[i].msg_content + "</p>";
						str += "<span class='time_date'>" + chatService.displayTime(list[i].msg_date) + "</span></div></div>";
					} else {
						str += "<div class='incoming_msg' data-roomNum='" + list[i].msg_num + "'>";
						str += "<div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>";
						str += "<div class='received_msg'>";
						str += "<div class='received_withd_msg'>";
						str += "<h5>" + list[i].user_id + "</h5>";
						str += "<p>" + list[i].msg_content + "</p>";
						str += "<span class='time_date'>" + chatService.displayTime(list[i].msg_date) + "</span></div></div></div>";
					}
						
				}

				msgHistory.html(str);
			});
		};

		/* 메세진 send 버튼 클릭시  */
		$(".msg_send_btn").on("click",function(e){
			if(!msgInput.val()){
				
			} else {
				chatService.add({room_num:roomNum,user_id:"${check.user_id}",msg_content:msgInput.val()},function(result){
					sendMessage();
					msgHistory.animate({scrollTop:9999},'slow');
					msgInput.val("");
				});	
			}		
		});
		

		// 엔터입력시 메세지 보내기
		msgInput.keypress(function(event){
			var kcode=event.keyCode;
			if(!msgInput.val()){
			} else {
				if(kcode=='13'){
					chatService.add({room_num:roomNum,user_id:"${check.user_id}",msg_content:msgInput.val()},function(result){
						sendMessage();
						msgHistory.animate({scrollTop:9999},'slow');
						msgInput.val("");
					});	
				}	
			}
		});

		/* 소켓 통신  */
		let sock = new SockJS("http://localhost:8080/consulting/chat");
		sock.onmessage = onMessage;
		sock.onclose = onClose;

		// 메시지 전송
		function sendMessage() {				
			sock.send(msgInput.val()+",${check.user_id}");
		}
		// 서버로부터 메시지를 받았을 때
		function onMessage(msg) {
			var data = msg.data;
			var temp = data.split(",");
			var time = new Date();
			var str = "";
			var selfId = temp[1];
			

			if("${check.user_id}" == selfId){
				str += "<div class='outgoing_msg' data-roomNum='" + roomNum + "'>";
				str += "<div class='sent_msg'>";
				str += "<p>" + temp[0] + "</p>";
				str += "<span class='time_date'>" + chatService.displayTime(time) + "</span></div></div>";
			} else {
				str += "<div class='incoming_msg' data-roomNum='" + roomNum + "'>";
				str += "<div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>";
				str += "<div class='received_msg'>";
				str += "<div class='received_withd_msg'>";
				str += "<h5>" + temp[1] + "</h5>";
				str += "<p>" + temp[0] + "</p>";
				str += "<span class='time_date'>" + chatService.displayTime(time) + "</span></div></div></div>";
			}

			msgHistory.append(str);
			msgHistory.animate({scrollTop:9999},'slow');
		}
		// 서버와 연결을 끊었을 때
		function onClose(evt) {
			alert("연결실패");
		}

		

		
		
	});
</script>


</body>
</html>




 