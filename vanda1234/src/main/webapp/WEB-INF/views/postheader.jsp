<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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

.container-fluid{
    width: 70%;
    padding-right: 0.75rem;
    padding-left: 0.75rem;
    margin-right: auto;
    margin-left: auto;
}

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
<header>
<nav class="site-header sticky-top py-1" style="background-color:#313132"">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2" href="" aria-label="Product">
      <a class="nav-link" href="http://localhost:8080/management2"><img src="/resources/images/logo_icon.png" width="22" height="22" alt=""></a>
    </a>
    
    <a class="py-2 d-none d-md-inline-block" href="#">쇼핑몰</a>
    
    <div class="dropdown">
	    <a class="nav-link py-2 d-none d-md-inline-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	      <a class="dropdown-item" href="http://localhost:8080/post/postlist">Before & After</a>
	      <a class="dropdown-item" href="http://localhost:8080/ht/postlist">홈 트레이닝</a>
	      <a class="dropdown-item" href="http://localhost:8080/gg/gglist">공식정보</a>
	    </div>
    </div>
    
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/mypage">마이페이지</a>
    
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/user/logout">로그아웃</a>
  </div>
</nav>
</header>
<main>
	<div class="container-fluid" style="margin-top: 150px">