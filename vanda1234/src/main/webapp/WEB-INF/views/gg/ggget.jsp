<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../postheader.jsp"%>

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
	