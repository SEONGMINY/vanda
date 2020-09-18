<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../postheader.jsp"%>
<!doctype html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="/resources/js/jquery.modal.min.js"></script>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/album/">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

<!-- 	
    Favicons
<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c"> -->


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

/*   .modal {
	height: 550px;
	width: 600px;
	display: none;
	position: absolute;
	top: 30%;
	left: 35%;
	background: white;
}  
 */
iframe {
	width: 100%;
	height: 800px;
}
</style>


</head>

<body>
	<main role="main">
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<c:forEach items="${list }" var="gg">
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">
								<img src="${gg.gg_Youtubesum}"
									style="width: 100%; height: 225px;" data-toggle="modal"
									data-target=".bs-example-modal-lg${gg.gg_Num}" />

								<div class="card-body">
									<p class="card-text">
										<c:out value="${gg.gg_Title}" />
									</p>
									<p class="card-text">
										<c:out value="${gg.gg_Content}" />
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-outline-secondary" data-toggle="modal"
												data-target=".bs-example-modal-lg${gg.gg_Num}">view</button>
										<c:if test="${check.user_id == gg.user_Id}">
											<button type="button"
												class="btn btn-sm btn-outline-secondary move"						
												href="<c:out value='${gg.gg_Num}'/>">
												Edit</button>
										</c:if>
										</div>
<%-- 
							<td><a class="move"
										href="<c:out value='${post.postNum}'/>"> <c:out
												value="${post.postTitle}" />
									</a></td>


 --%>									</div>
								</div>
							</div>
						</div>


						<div class="modal fade bs-example-modal-lg${gg.gg_Num}"
							tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div>
										<iframe src="<c:out value="${gg.gg_Youtubelink}" />"></iframe>
									</div>
								</div>
							</div>
						</div>

					</c:forEach>

				</div>
				<!-- row -->

				<button id='regBtn' type="button"
					class="btn btn-xs float-right btn-outline-dark"">게시글 작성</button>
					
					
				<form id="actionForm" action="/gg/ggget" method="get">
				</form>

			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.5/assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script>
		$("#regBtn").on("click", function() {
			self.location = "/gg/register";
		});
	</script>
	<script>
	
	var actionForm = $("#actionForm");
	
		$(document)
				.ready(
						function() {
							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='gg_Num' value='"
																+ $(this).attr(
																		"href")
																+ "'>'");
												actionForm.attr("action",
														"/gg/ggget");
												actionForm.submit();
											});
						});
	</script>

</body>
</html>
