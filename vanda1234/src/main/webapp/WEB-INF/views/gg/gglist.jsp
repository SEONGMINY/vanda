<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<head>
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
	
/* body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		nav a{
         
         	color : #d4d4d4;
         	font-size : 14px;
      	}
      
      	nav a:hover {
         	text-decoration:none;
         	color : #eeeeee;
      	} */


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


</head>

<body>
    <header>
    	<%@include file="../navBar.jsp" %>	    
	</header>
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
