<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link href="/resources/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	crossorigin="anonymous"></script>

<style>
nav {
	background-color: #F5F5F5;
}

img {
	display: block;
	margin: 0;
	padding: 0;
	outline: 0;
	border: none;
	width: 57px;
	height: 27px;
	background-size: 57px 27px;
	font: 0/0 a;
	text-shadow: none;
	color: transparent;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-webkit-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	background-color: #F5F5F5;
}
</style>

<main>


	<nav class="navbar fixed-top navbar-expand-md navbar-new-bottom">
		<div class="navbar-collapse collapse pt-2 pt-md-0" id="navbar2">
		
			<a href="http://localhost:8080"><img src="/resources/images/logo.png"></a>

			<ul class="navbar-nav w-100 justify-content-center px-3">


				<li class="nav-item active"><a class="nav-link"
					href="../post/postlist">비포 엔 에프터</a></li>
				<li class="nav-item"><a class="nav-link" href="../ht/postlist">홈트레이닝</a></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../gg/postlist">공식정보</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid" style="margin-top: 150px">