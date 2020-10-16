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

	<div class="card mb-4" style="margin-top: 150px">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>공식정보
				<button id='regBtn' type="button"
					class="btn btn-xs float-right btn-outline-dark"">게시글 작성</button>

			</div>
			<div class="card-body">
				<div>
					<table class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>게시글번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성일</th>
								<th>조회수</th>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${list}" var="post">
								<tr>
									<td><c:out value="${post.postNum}" /></td>
									<td><a class="move"
										href="<c:out value='${post.postNum}'/>">
										 <c:out value="${post.postTitle}" />
									</a></td>
									<td><c:out value="${post.postContent}" /></td>
									<td><c:out value="${post.postDate}" /></td>
									<td><c:out value="${post.postCount}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>


					<div class="row">
						<div class="col-lg-12">
							<form id="searchForm" action="/ht/postlist" method="get">
								<select name="type">
									<option value=""
										<c:out value="${pageMaker.crt.type == null?'selected':''}"/>>------</option>
									<option value="C"
										<c:out value="${pageMaker.crt.type eq 'C'?'selected':''}"/>>제목</option>
									<option value="W"
										<c:out value="${pageMaker.crt.type eq 'W'?'selected':''}"/>>내용</option>
									<option value="CW"
										<c:out value="${pageMaker.crt.type eq 'CW'?'selected':''}"/>>제목
										or 내용</option>
								</select> <input type="text" name="keyword"
									value="${pageMaker.crt.keyword}"> <input type="hidden"
									name="pageNum" value="${pageMaker.crt.pageNum}"> <input
									type="hidden" name="amount" value="${pageMaker.crt.amount}">
								<button class="btn btn-outline-dark"">Search</button>
							</form>
						</div>
					</div>

					<div class="float-right">
						<ul class="pagination">
							<li class="page-item ${pageMaker.prev==true?'':'disabled'}">
								<a class="page-link" href="${pageMaker.startPage-1}">이전페이지</a>
							</li>


							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item ${pageMaker.crt.pageNum==num?'active':'' }"><a
									class="page-link" href="${num}">${num}</a></li>
							</c:forEach>

							<li class="page-item ${pageMaker.next==true?'':'disabled'}">
								<a class="page-link" href="${pageMaker.endPage+1}">다음페이지</a>
							</li>
						</ul>
					</div>

					<form id="actionForm" action="/ht/postlist" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.crt.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker.crt.amount}"> <input
							type="hidden" name="type" value="${pageMaker.crt.type}">
						<input type="hidden" name="keyword"
							value="${pageMaker.crt.keyword}">
					</form>

					<div class="modal" id="myModal" tabindex="-1" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">정보</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p>Modal body text goes here.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						console.log(result);
						function checkModal(result) {
							if (result == '' || history.state)
								return;
						}

						$("#regBtn").on("click", function() {
							self.location = "/ht/register";
						});

						var actionForm = $("#actionForm");
						var searchForm = $("#searchForm");

						$(".page-item a")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("click");
											actionForm.find(
													"input[name='pageNum']")
													.val($(this).attr("href"));
											actionForm.find(
													"input[name='type']").val(
													searchForm.find(
															"option:selected")
															.val());
											actionForm
													.find(
															"input[name='keyword']")
													.val(
															searchForm
																	.find(
																			"input[name='keyword']")
																	.val());
											actionForm.submit();
										});

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='postNum' value='"
															+ $(this).attr(
																	"href")
															+ "'>'");
											actionForm.attr("action",
													"/ht/postget");
											actionForm.submit();
										});

						$("#searchForm button").on("click", function(e) {

							searchForm.find("input[name='pageNum']").val("1");

							searchForm.submit();
						});

					});
</script>
<%@include file="footer.jsp"%>

