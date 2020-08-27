/**
 * @Author: lsm
 * @Date: 2020
**/

console.log("Reply Module...");

var chatService = (function(){
	function add(msg,callback,error){
		console.log("add reply...");
		$.ajax({
			type:'post',
			url:'/chat/new',
			data:JSON.stringify(msg),
			contentType:"application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					
					callback(result);
				}
			},
			error:function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
		
	};
	
	function msgList(param, callback, error){
		var roomNum = param.room_num;
		
		$.getJSON("/chat/chatlist/"+roomNum+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error(err);
			}
		});
	};
	
	function roomList(param,callback,error){
		var userId = param.user_id;
		
		$.getJSON("/chat/roomList/"+userId+".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error(err);
			}
		});
	}
	
	function remove(rno, callback, error) {
		$.ajax({
			type: 'delete',
			url: '/replies/' + rno,
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	};
	
	function update(reply, callback, error) { 
		console.log("RNO: " +  reply.rno);
		
		$.ajax({
			type: 'put',
			url: '/replies/' + reply.rno,
			data: JSON.stringify(reply),
			contentType: 'application/json; charset=utf-8',
			success: function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err) {
				if(error){
					error(err);
				}
			}
		});
	};
	
	function get(rno, callback, error) {
		$.get("/replies/"+rno+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error(err);
			}
		});		
	};
	
	function displayTime(timeValue) {
		var today = new Date(); // 현재 시각 정보
		var gap = today.getTime() - timeValue;
		var dataObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24))  { // 1초는 1000ms
			var hh = dataObj.getHours();
			var mi = dataObj.getMinutes();
			var ss = dataObj.getSeconds();
			
			// 13:57:32 => ['13',':','57',":",'32'].join() 03:05:07 이런식으로 리턴
			// ['13',':','57',":",'32'].join() 이렇게 인자를 주지 않으면 => 13,:57,:32 로 출력
			// ['13',':','57',":",'32'].join('') 13:57:32
			
			return [(hh > 9 ? '':'0')+hh,':',(mi > 9 ? '':'0')+mi,':',(ss > 9 ? '':'0')+ss].join('');
		} else {
			var yy = dataObj.getFullYear();
			var mm = dataObj.getMonth() + 1 // 1월은 0을 리턴 2월은 1을 리턴하기 때문에 +1
			var dd = dataObj.getDate();
			
			// 2020/05/25 => ['2020','/','05','/','25']
			return [yy,'/',(mm > 9 ? '':'0')+mm,'/',(dd > 9 ? '':'0')+dd].join('');
		}
	};
	
	return {add:add,msgList:msgList,roomList:roomList,remove:remove,update:update,get:get,displayTime:displayTime};
})();