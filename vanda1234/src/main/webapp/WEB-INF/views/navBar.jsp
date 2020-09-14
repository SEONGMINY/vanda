<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--네비게이션(=메인 메뉴창)-->
 <nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#313132">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mx-auto">
      <li class="nav-item" width>
        <a class="nav-link" href="#"><img src="/resources/images/logo_icon.png" width="25" height="25" alt=""></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">쇼핑몰</a>
      </li>		      
      <li class="nav-item dropdown">
        <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        	커뮤니티		          
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Before & After</a>
          <a class="dropdown-item" href="#">홈 트레이닝</a>
          <a class="dropdown-item" href="#">공식정보</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">마이페이지</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>