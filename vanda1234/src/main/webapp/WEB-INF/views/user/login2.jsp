<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>반다 : 로그인</title>
    
    <!-- Noto Sans 글씨체 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	<!-- AJAX -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Favicons -->
	<meta name="theme-color" content="#563d7c">
<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
      
html,
body {
  height: 100%;
  font-family: 'Noto Sans KR', sans-serif;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
  /* background-image: url(../resources/images/login/background1.png);
  background-position: center;
  background-size: cover; */

}

.form-signin {
  width: 100%;
  max-width: 420px;
  padding: 15px;
  margin: auto;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input,
.form-label-group label {
  height: 3.125rem;
  padding: .75rem;
}

.form-label-group label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0; /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  pointer-events: none;
  cursor: text; /* Match the input under the label */
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:-moz-placeholder-shown) {
  padding-top: 1.25rem;
  padding-bottom: .25rem;
}

.form-label-group input:not(:-ms-input-placeholder) {
  padding-top: 1.25rem;
  padding-bottom: .25rem;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: 1.25rem;
  padding-bottom: .25rem;
}

.form-label-group input:not(:-moz-placeholder-shown) ~ label {
  padding-top: .25rem;
  padding-bottom: .25rem;
  font-size: 12px;
  color: #777;
}

.form-label-group input:not(:-ms-input-placeholder) ~ label {
  padding-top: .25rem;
  padding-bottom: .25rem;
  font-size: 12px;
  color: #777;
}

.form-label-group input:not(:placeholder-shown) ~ label {
  padding-top: .25rem;
  padding-bottom: .25rem;
  font-size: 12px;
  color: #777;
}

/* Fallback for Edge
-------------------------------------------------- */
@supports (-ms-ime-align: auto) {
  .form-label-group {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column-reverse;
    flex-direction: column-reverse;
  }

  .form-label-group label {
    position: static;
  }

  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

</style>
</head>
  <body>
    <form class="form-signin" id="loginForm" method="post">
	 <div class="text-center mb-4">
	   <svg class="logo" height="72px" viewBox="0 -32 511.99944 511" width="72px" xmlns="http://www.w3.org/2000/svg">
	   <path d="m410.1875 374.464844c-1.167969 17.027344-7.660156 32.894531-18.757812 45.871094-11.09375 12.976562-25.757813 21.839843-42.40625 25.640624-5.863282 1.339844-11.773438 2-17.65625 2-10.824219 0-21.550782-2.238281-31.664063-6.691406-19.796875-8.703125-41.039063-13.054687-62.285156-13.054687-20.878907 0-41.757813 4.199219-61.265625 12.605469l-1.023438.449218c-15.636718 6.871094-32.691406 8.492188-49.339844 4.691406-16.636718-3.8125-31.300781-12.675781-42.40625-25.652343-11.085937-12.984375-17.566406-28.839844-18.738281-45.867188-1.171875-17.027343 3.082031-33.632812 12.292969-48l55.515625-86.605469c23.039063-35.9375 62.277344-57.394531 104.964844-57.394531s81.921875 21.457031 104.960937 57.394531l55.515625 86.605469c9.214844 14.375 13.464844 30.972657 12.292969 48.007813zm0 0" fill="#2AC1BC"/>
	   <path d="m91.894531 239.738281c16.515625-6.34375 29.0625-19.652343 35.328125-37.472656 5.964844-16.964844 5.476563-36.113281-1.378906-53.921875-6.859375-17.804688-19.335938-32.335938-35.128906-40.921875-16.597656-9.023437-34.828125-10.488281-51.316406-4.136719-33.171876 12.753906-48.394532 53.75-33.929688 91.398438 11.554688 29.96875 38.503906 48.886718 65.75 48.886718 6.957031 0 13.933594-1.234374 20.675781-3.832031zm0 0" fill="#2AC1BC"/><path d="m274.824219 86.207031c0 31.550781-15.058594 59.171875-37.40625 74.039063-11.117188 7.402344-24.042969 11.644531-37.808594 11.644531-41.464844 0-75.199219-38.445313-75.199219-85.683594 0-47.261719 33.734375-85.707031 75.199219-85.707031 13.765625 0 26.691406 4.242188 37.808594 11.644531 22.347656 14.867188 37.40625 42.496094 37.40625 74.0625zm0 0" fill="#2AC1BC"/><g fill="#2AC1BC"><path d="m419.824219 140.226562c-11.246094 33.824219-40.71875 55.84375-70.960938 55.84375-6.472656 0-12.984375-1.007812-19.367187-3.128906-36.136719-12.015625-54.433594-55.214844-40.777344-96.292968 6.460938-19.464844 19.128906-35.703126 35.65625-45.71875 17.304688-10.472657 36.714844-12.964844 54.660156-7 17.949219 5.972656 32.003906 19.578124 39.585938 38.324218 7.253906 17.90625 7.683594 38.496094 1.203125 57.972656zm0 0"/><path d="m496.214844 280.058594c-15.257813 20.597656-38.09375 31.800781-60.042969 31.800781-12.597656 0-24.902344-3.679687-35.316406-11.402344-28.550781-21.128906-32.292969-64.699219-8.34375-97.113281 23.980469-32.390625 66.746093-41.546875 95.351562-20.417969l.007813.011719c28.5625 21.148438 32.304687 64.714844 8.34375 97.121094zm0 0"/><path d="m237.417969 160.246094v-148.101563c22.347656 14.867188 37.40625 42.496094 37.40625 74.0625 0 31.550781-15.058594 59.171875-37.40625 74.039063zm0 0"/><path d="m397.894531 326.457031c9.214844 14.375 13.464844 30.972657 12.292969 48.007813-1.167969 17.027344-7.660156 32.894531-18.757812 45.871094-11.09375 12.976562-25.757813 21.839843-42.40625 25.640624-5.863282 1.339844-11.773438 2-17.65625 2-10.824219 0-21.550782-2.238281-31.664063-6.691406-19.796875-8.703125-41.039063-13.054687-62.285156-13.054687v-245.773438c42.6875 0 81.921875 21.457031 104.960937 57.394531zm0 0"/></g>
	   </svg>
	   <div id="alert" class="alert alert-danger mt-4" role="alert" style="display:none;">
	     	아이디 또는 비밀번호가 맞지 않습니다.
	   </div>
	 </div>
	
	 <div class="form-label-group">
	   <input type="text" id="user_id" name="user_id" class="form-control" placeholder="Email address" required autofocus>
	   <label for="user_id">아이디</label>
	 </div>
	
	 <div class="form-label-group">
	   <input type="password" id="user_pass" name="user_pass" class="form-control" placeholder="Password" required>
	   <label for="user_pass">비밀번호</label>
	 </div>
	
	 <button class="btn btn-lg btn-info btn-block" type="button" onclick="login();" return="false">로그인</button>
	 
	 <div class="sns mt-3 mb-4">
	 	<div style="float:left;">
	    <a href="https://kauth.kakao.com/oauth/authorize?client_id=a31608bb93320540275258229418df03&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">
			<img width="24" height="24" src="../resources/images/login/kakao.png" alt="facebook">
		</a>
		<img width="24" height="24" src="../resources/images/login/tw.png" alt="twitter">
		<img width="24" height="24" src="../resources/images/login/gl.png" alt="google">
		</div>
		<div style="float:right;">
	    	<button type="button" class="btn btn-outline-info btn-sm">회원가입</button>
		</div>
	 </div> 
	</form>
</body>
<script>
	function login() {
		var formData = $("#loginForm").serialize();
		
		$.ajax ({
			url: "/user/login",
			type: "post",
			data: formData,
			success: function(data){
				if(data == "success"){
					window.location.href = "http://localhost:8080/management2";
				} else if(data == "fail"){
					$("#alert").show();
				}
			},
			error: function(err){
				alert("접속할수없음"+err);
			}
		});
	}
</script>
</html>
