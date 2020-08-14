<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/menu.css" rel="stylesheet" />

<title>Insert title here</title>
<style>


</style>
 
</head>
<body>
<nav>
      <div class='menu'>
         <ul>
            <li>
              <a href="/">  <img src="/resources/img/logo.png" alt="반다 로고이미지" style="width:202px; height:57px">
              </a>
            </li>
            <li>
               <a href='http://localhost:8080/pet/main'>비만매니지먼트</a>
            </li>
            <li>
               <a href='#'>상담</a>
            </li>
            <li class='active sub'>
               <a href='#'>커뮤니티</a>
               <ul>
                  <li class='sub'>
                     <a href='#'>before & after</a>   
                  </li>
                  <li class='sub'>
                     <a href='#'>홈 트레이닝</a>
                  
                  </li>
                  <li class='sub'>
                     <a href='#'>공식정보</a>
                     
                  </li>
               </ul>
            </li>
            <li>
               <a href='#'>쇼핑몰</a>
            </li>
            <!-- 
            login-menu랑 notlogin메뉴에 a태그에 주소를 전체다 넣은이유 = 재요청시에 url 중복됨.  -->
            <li class='logout'>
               <a href='http://localhost:8080/user/logout'>로그아웃</a> 
            </li>
               <li class='myPage'>
               <a href='http://localhost:8080/user/myPage'>마이페이지</a>
            </li>
            <li class='qna'>
               <a href='#'>고객센터</a>
            </li>
         </ul>
      </div>
</nav>


</body>

</html>