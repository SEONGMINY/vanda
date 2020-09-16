<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>Checkout example · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/checkout/">
    
    <!-- 부트 스크립트 필수 링크 및 스크립트 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<meta name="theme-color" content="#563d7c">
	
	<!-- Noto Sans 글씨체 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<style>
	
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		.navbar-nav > li{
			width : 180px;
		}
		
		.list-group a {
			color : black;
			/* font-weight : bold; */
		}
		
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
	</style>
	
	<script>
		function includeChange(page) {
			alert(page);
			 $.ajax({
		         url : "/mypage",
		         type : "post",
		         data : {
		            "page" : page
		         },
		         success : function() {
			         location.reload();
		         }
	
		      })
		}
	</script>
    
  </head>
  
  <header>
  	<%@include file="../navBar.jsp" %>	    
  </header>

  <body class="bg-light">
    <div class="container">
	  <div class="row">
	    <div class="col-md-4 order-md-2 mb-4" style="margin-top:10px;">
	      <!-- <h4 class="d-flex justify-content-between align-items-center mb-3">
	        <span class="text-muted">Your cart</span>
	        <span class="badge badge-secondary badge-pill">3</span>
	      </h4> -->
	      <ul class="list-group mb-3">
	        <li class="list-group-item d-flex justify-content-between lh-condensed">
	          <div class="">
	            <h6 class="my-0"><a href="#" onclick="includeChange('info');">회원정보 관리</a></h6>
	          </div>
	        </li>
	        <li class="list-group-item d-flex justify-content-between lh-condensed">
	          <div>
	            <h6 class="my-0"><a href="#" onclick="includeChange('pet');">반려견 등록</a></h6>
	          </div>
	        </li>
	        <li class="list-group-item d-flex justify-content-between lh-condensed">
	          <div>
	            <h6 class="my-0"><a href="#" onclick="includeChange('device');">기기 등록</a></h6>
	          </div>
	        </li>
	      </ul>
	    </div>
	    
	    <div class="col-md-8 order-md-1" id="include" style="margin-top:10px;">
	    	<c:choose>
	    		<c:when test="${page eq 'info'}">
	    		${page }
	    		
	    			<%@include file="./info.jsp" %>
	    		</c:when>
	    		<c:when test="${page eq 'device'}">
	    		${page }
	    			<%@include file="./device.jsp" %>
	    		</c:when>
	    		<c:when test="${page eq 'pet'}">
	    		${page }
	    		<h1>44</h1>
	    			<%@include file="./pet.jsp" %>
	    		</c:when>
	    	</c:choose>
	    </div>    
	  </div>
	</body>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2019-2020 반다</p>
  </footer>
</div>
</html>
