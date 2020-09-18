<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../postheader.jsp"%>

<main>
	<div class="container-fluid">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>공식정보
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form role="form" action="/gg/register" method="post">
						<div class="form-group">
							<input type="hidden" class="form-control" name="classNum" value="2" readonly="readonly">
						</div>
						<div class="form-group" style="display:none";>
							<label>아이디</label> 
							<input  class="form-control" name="user_Id" value="${check.user_id}" readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label>
							<input class="form-control" name="gg_Title">
						</div>
						<div class="form-group">
							<label>내용</label> 
							<textarea class="form-control" rows="3" name="gg_Content"></textarea>
						</div>
						<div class="form-group">
							<label>유튜브링크</label> 
							<input class="form-control" name="gg_Youtubelink">
						</div>
						
							<button type="submit" class="btn btn-outline-dark">작성</button>
							<button type="reset" class="btn btn-outline-dark">리셋</button>
							<button type="button" class="btn btn-outline-dark" onClick="goList()">리스트</button>		
					</form>
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function goList() {
		window.location.href="http://localhost:8080/gg/gglist";
			}
		</script>
	

</main>
