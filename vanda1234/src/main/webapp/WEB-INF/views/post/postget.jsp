<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	<!-- jQuery 필수 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script> 
	<meta name="theme-color" content="#563d7c">
	
	<!-- Noto Sans 글씨체 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">





<style>
header {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		nav a{
         
         	color : #d4d4d4;
         	font-size : 14px;
      	}
      
      	nav a:hover {
         	text-decoration:none;
         	color : #eeeeee;
      	}
}
</style>


<style>
.uploadResult {
  width:100%;
  
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}

.uploadResult1 {
  width:100%;
  
}
.uploadResult1 ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult1 ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult1 ul li img{
  width: 100px;
}
.uploadResult1 ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>

<%@include file="../postheader.jsp" %>

<main>
	<div class="container-fluid">

		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>비포 앤 에프터
			</div>
			<div class="card-body">
				<div class="table-responsive">

					<div class="form-group">
						<label>게시글번호</label> <input class="form-control" name='postNum'
							value='<c:out value="${post.postNum}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control"
							name='postTitle' value='<c:out value="${post.postTitle}"/>'
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='postContent'
							readonly="readonly"><c:out value="${post.postContent}" />
							</textarea>
					</div>
					<div class="form-group">
						<label>아이디</label> <input class="form-control" name='userId'
							value='<c:out value="${post.userId}"/>' readonly="readonly">
					</div>
					<button data-oper="modify" class="btn btn-outline-dark">변경하기</button>
					<button data-oper="list" class="btn btn-outline-dark">리스트</button>


					<form id="operForm" action="/post/modify" method="get">
						<input type="hidden" id="postNum" name="postNum"
							value="<c:out value='${post.postNum}'/>"> <input
							type="hidden" name="pageNum" value="${crt.pageNum}"> <input
							type="hidden" name="amount" value="${crt.amount}"> <input
							type="hidden" name="type" value="${crt.type}"> <input
							type="hidden" name="keyword" value="${crt.keyword}">
					</form>


				</div>
			</div>
		</div>
	</div>
	
	<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>






<div class="container-fluid">
<div class="card mb-4">
  <div class="card-header">
    <div class="panel panel-default">

      <div class="panel-heading">비포</div>
      <div class="panel-body">
               
        <div class='uploadResult' style="float:left; width:50%;"> 
          <ul>
          </ul>
        </div>
        
      </div>
    </div>
  </div>
</div>
</div>

<div class="container-fluid">
<div class="card mb-4">
  <div class="card-header">
    <div class="panel panel-default">

      <div class="panel-heading">에프터</div>
      <div class="panel-body">
        <div class='uploadResult1' style="float:left; width:50%;"> 
          <ul>
          </ul>
        </div>
        
      </div>
    </div>
  </div>
</div>
</div>

	<div class='container-fluid'>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Reply
					<button id='addReplyBtn' class='btn btn-primary  btn-xs float-right'>NewReply</button>
				</div>

				<div class="panel-body">
					<ul class="chat">
					</ul>
				</div>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>

</main>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글작성</h4>
			</div>

			<div class="modal-body">
				<div class="form-group">
					<label>replyContent</label> <input class="form-control"
						name='replyContent' >
				</div>
				<div class="form-group">
						<label>작성자</label> <input class="form-control" name="userId" value="${check.user_id}" readonly="readonly" >
				</div>
				<div class="form-group" id="modalReplyDate">
					<label>replydate</label> <input class="form-control"
						name='replyDate' value=''>
				</div>
			</div>

			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">변경</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">작성</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default"
					data-dismiss="modal">Close</button>
			</div>


		</div>
	</div>
</div>




<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#postNum").remove();
			operForm.attr("action", "/post/postlist");
			operForm.submit();
		});
	});
</script>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(
		function() {
			var postNumValue = '<c:out value="${post.postNum}"/>';
			var replyUL = $(".chat");

			showList(1);

			function showList(page) {
				replyService.getList(
						{ postNum : postNumValue, page : page || 1 }, /// param
						function(replyCnt, list) { // callback
							if (page == -1) {
								pageNum = Math.ceil(replyCnt / 10.0);
								showList(pageNum);
								return;
							}

							var str = "";
							if (list == null || list.length == 0) {
								showList(-1);
								return;
							}
							for (var i = 0, len = list.length || 0; i < len; i++) {
								str += "<li class='left clearfix' data-replyNum='"+list[i].replyNum+"'>";

								str += " <div><div class='header'><strong class='primary-font'>"
										+ list[i].userId
										+ "</strong>";

								str += "<small class='pull-right text-muted'>"
										+ replyService
												.displayTime(list[i].replyDate)
										+ "</small></div>";

								str += "<p>"
										+ list[i].replyContent
										+ "</p></div>";

								str += '</li>';
							}
							replyUL.html(str);

							showReplyPage(replyCnt);
						});
			}

			var pageNum = 1;
		    var replyPageFooter = $(".panel-footer");
		    
		    function showReplyPage(replyCnt){
		      
		      var endNum = Math.ceil(pageNum / 10.0) * 10;  
		      var startNum = endNum - 9; 
		      
		      var prev = startNum != 1;
		      var next = false;
		      
		      if(endNum * 10 >= replyCnt){
		        endNum = Math.ceil(replyCnt/10.0);
		      }
		      
		      if(endNum * 10 < replyCnt){
		        next = true;
		      }
		      
		      var str = "<ul class='pagination pull-right'>";
		      
		      if(prev){
		        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		      }
		      
		      for(var i = startNum ; i <= endNum; i++){
		        
		        var active = pageNum == i? "active":"";
		        
		        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		      }
		      
		      if(next){
		        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		      }
		      
		      str += "</ul></div>";
		      
		      console.log(str);
		      
		      replyPageFooter.html(str);
		    }

		    






			

			var modal = $(".modal");
			var modalInputreplyContent = modal.find("input[name='replyContent']");
			var modalInputuserId = modal.find("input[name='userId']");
			var modalInputreplyDate = modal.find("input[name='replyDate']");

			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#addReplyBtn").on("click", function(e) {
	/* 			modal.find("input").val(""); */
				modalInputreplyDate.closest("div").hide();
				modal.find("button[id != 'modalCloseBtn']").hide();

				modalRegisterBtn.show();

				$(".modal").modal("show");

			});

			// 댓글 추가
			modalRegisterBtn.on("click", function(e) {
				var reply = {
					replyContent : modalInputreplyContent.val(),
					userId : modalInputuserId.val(),
					postNum : postNumValue
				};
				console.log(reply);
				replyService.add(reply, function(result) {

					//alert(result);

					modal.find("input").val("");
					modal.modal("hide");

					//showList(1);
					showList(-1);
				});
			});

			$(".chat").on(
					"click",
					"li",
					function(e) {
						var replyNum = $(this)
								.attr("data-replyNum");
						//var replyNum = $(this).data('replyNum');

						replyService.get(replyNum, function(reply) {

							console.log(replyNum);

							modalInputreplyContent
									.val(reply.replyContent);
							modalInputuserId.val(reply.userId);
							modalInputuserId.attr('readonly',
									'readonly');
							$('#modalReplyDate').attr("style",
									"display:none;");
							modal.data("replyNum", reply.replyNum);

							modal.find(
									"button[id !='modalCloseBtn']")
									.hide();
							modalModBtn.show();
							modalRemoveBtn.show();

							$(".modal").modal("show");

						});
					});

			modalModBtn.on("click", function(e) {

				var reply = {
					replyNum : modal.data("replyNum"),
					replyContent : modalInputreplyContent.val()
				};

				replyService.update(reply, function(result) {

					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
			});

			modalRemoveBtn.on("click", function(e) {

				var replyNum = modal.data("replyNum");
				replyService.remove(replyNum, function(result) {

					alert(result);
					modal.modal("hide");
					showList(pageNum);

				});
			});


			replyPageFooter.on("click", "li a", function(e){
				e.preventDefault();

				pageNum = $(this).attr("href");

				showList(pageNum);

				
			});
	});

	$(document).ready(function(){
		(function(){
			var postNum = '<c:out value="${post.postNum}"/>';

			$.getJSON("/post/getImgList", {postNum: postNum}, function(arr){
				console.log(arr);

				var str ="";

				$(arr).each(function(i, attach){

					//image type
					if(attach.fileType){
				           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
				           
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<img src='/display?fileName="+fileCallPath+"'>";
				           str += "</div>";
				           str +"</li>";
				         }else{
				             
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<span> "+ attach.fileName+"</span><br/>";
				           str += "<img src='/resources/img/picture.png'></a>";
				           str += "</div>";
				           str +"</li>";
				         }
				       });
			       $(".uploadResult ul").html(str);
				}); 
			
			})();


		(function(){
			var postNum = '<c:out value="${post.postNum}"/>';

			$.getJSON("/post/getImgList1", {postNum: postNum}, function(arr){
				console.log(arr);

				var str ="";

				$(arr).each(function(i, attach){

					//image type
					if(attach.fileType){
				           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
				           
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<img src='/display?fileName="+fileCallPath+"'>";
				           str += "</div>";
				           str +"</li>";
				         }else{
				             
				           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				           str += "<span> "+ attach.fileName+"</span><br/>";
				           str += "<img src='/resources/img/picture.png'></a>";
				           str += "</div>";
				           str +"</li>";
				         }
				       });
			       $(".uploadResult1 ul").html(str);
				}); 
			
			})();

		$(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      //download 
		      self.location ="/download?fileName="+path
		    }
		    
		    
		  });
		  
		  function showImage(fileCallPath){
			    
		    alert(fileCallPath);
		    
		    $(".bigPictureWrapper").css("display","flex").show();
		    
		    $(".bigPicture")
		    .html("<img src='/display?fileName="+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 10);
		    
		  }

		  $(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 0);
		  });
				
		});
</script>

<%@include file="footer.jsp"%>
