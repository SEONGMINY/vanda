<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
<c:choose>
     <c:when test="${empty check}">
  <%@ include file="../notLogin-menu.jsp" %>
    </c:when> 
        <c:when test="${not empty check}">
  <%@ include file="../Login-menu.jsp" %>
    </c:when>

</c:choose>
<%--     <div id="nav" >
      <%@ include file="../main-menu.jsp" %>
    </div> --%>
${check.user_id}님 환영합니다.<br>

${sessionScope.token} <- 토큰값<br>
로그인한 유저정보 <br>

${kemail}<br>


<h1>여기는 비만매니지먼트 페이지 입니다.</h1>
<input type="button" value="홈으로" onclick="location.href='../'"/>
<input type="button" value="다음페이지" onclick="location.href='/user/test'"/>
</body>
</html>