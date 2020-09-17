<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--네비게이션(=메인 메뉴창)-->
<nav class="site-header sticky-top py-1" style="background-color:#313132"">
  <div class="container d-flex flex-column flex-md-row justify-content-between">
    <a class="py-2" href="" aria-label="Product">
      <a class="nav-link" href="http://localhost:8080/management2"><img src="/resources/images/logo_icon.png" width="22" height="22" alt=""></a>
    </a>
    <a class="py-2 d-none d-md-inline-block" href="#">쇼핑몰</a>
    <a class="nav-link py-2 d-none d-md-inline-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      <a class="dropdown-item" href="#">Before & After</a>
      <a class="dropdown-item" href="#">홈 트레이닝</a>
      <a class="dropdown-item" href="#">공식정보</a>
    </div>
    <a class="py-2 d-none d-md-inline-block" href="#">마이페이지</a>
    <a class="py-2 d-none d-md-inline-block" href="http://localhost:8080/user/logout">로그아웃</a>
  </div>
</nav>