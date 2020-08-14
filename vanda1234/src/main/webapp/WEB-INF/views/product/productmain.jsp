<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	
	$(document).ready(function() {

		$("#register").click("on", function() {
			window.location.href = "http://localhost:8080/product/product_register";
		});

		$("#select").click(function() {
			window.location.href = "http://localhost:8080/product/productView";
		});

	});
</script>
</head>
<body>

	<button id="register">상품등록페이지이동</button>

	<button id="select">상품페이지이동</button>




</body>
</html>
