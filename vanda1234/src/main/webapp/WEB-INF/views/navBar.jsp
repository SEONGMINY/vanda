<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--네비게이션(=메인 메뉴창)-->
<nav class="site-header sticky-top py-1" style="background-color:#313132"">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2" href="" aria-label="Product">
      <a class="nav-link" href="http://localhost:8080/management2"><img src="/resources/images/logo_icon.png" width="22" height="22" alt=""></a>
    </a>
    
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/product/shopmain">쇼핑몰</a>
    
    <div class="dropdown">
	    <a class="nav-link py-2 d-none d-md-inline-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	      <a class="dropdown-item" href="http://localhost:8080/post/postlist">Before & After</a>
	      <a class="dropdown-item" href="http://localhost:8080/ht/postlist">공식정보</a>
	      <a class="dropdown-item" href="http://localhost:8080/gg/gglist">홈트레이닝</a>
	    </div>
    </div>
    
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/mypage">마이페이지</a>
        <c:if test="${check.user_rule eq 'doctor'}">
    <a class="py-2 d-none d-md-inline-block" href="javascript:test()">상담기록</a>
    </c:if>
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/user/logout">로그아웃</a>
  </div>
</nav>