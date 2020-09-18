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

<%@include file="../postheader.jsp" %>

<main>
	<div class="container-fluid">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>공식정보변경
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form role="form" action="/gg/ggmodify" method="post">
						<div class="form-group" style="display:none">
							<label>게시글번호</label> 
							<input class="form-control" name="gg_Num" 
							value="<c:out value='${gg.gg_Num}'/>" readonly>
						</div>
						<div class="form-group" style="display:none">
							<label>아이디</label> 
							<input class="form-control" name="user_Id" 
							value="<c:out value='${gg.user_Id}'/>" readonly>
						</div>
						<div class="form-group">
							<label>제목</label> 
							<input class="form-control" name="gg_Title"
							value="<c:out value='${gg.gg_Title}'/>" >
						</div>
						<div class="form-group">
							<label>내용</label> 
							<textarea class="form-control" rows="3" name="gg_Content" ><c:out value="${gg.gg_Content}"/></textarea>
						</div>
						<div class="form-group">
							<label>유튜브링크</label> 
							<input class="form-control" name="gg_Link"
							value="${gg.gg_Link}"/>
						</div>
							<button type="submit" data-oper="modify" class="btn btn-outline-dark">변경</button>
							<button type="submit" data-oper="remove" class="btn btn-outline-dark">삭제</button>
							<button type="submit" data-oper="list" class="btn btn-outline-dark">리스트</button>
					</form>		
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
		$(document).ready(function(){
				var formObj = $("form");

				$("button").on("click", function(e){
						e.preventDefault();

						var operation = $(this).data("oper");
					
						if(operation == 'remove'){
								formObj.attr("action", "/gg/ggremove");
						}else if(operation == 'list'){
								formObj.attr("action", "/gg/gglist").attr("method", "get");
						}else if(operation === 'modify'){
								formObj.attr("action", "/gg/ggmodify");
					        }
					    
						formObj.submit();
					});
			});
	</script>
	