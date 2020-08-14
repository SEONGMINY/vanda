<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

#nav_menu ul {

list-style-type:none;
float:right;
padding-left:0px;
}

#nav_menu ul li {

display:inline;

padding: 0px 30px 0px 30px;
}

</style>

 
</head>
<body>
<div id="nav_menu">
<ul>

<li><a href="/product/shopmain">전체보기</a></li>
<li><a href="/product/Bestproduct">인기상품</a></li>
<li><a href="/product/ProductBasket">장바구니</a></li>

<li><a href="http://localhost:8080/user/login">로그인 </a></li>
<li><a href="user/selectSignUp">회원가입 </a></li>
</ul>
</div>

<%-- 
<c:choose>
    <c:when test="${empty check}">
        <input type="button" value="로그인" onclick="location.href='user/login'" />
        <input type="button" value="회원가입" onclick="location.href='user/selectSignUp'" />
    </c:when>
</c:choose>
 --%></body>
</html>