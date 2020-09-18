<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="mb-3">병원정보 관리</h4>
<form class="needs-validation" novalidate>

  <div class="mb-3">
    <label for="hosp_name">병원이름</label>
    <c:choose>
    <c:when test="${hosp ==null }">
    <input type="text" class="form-control" id="hosp_name" value="${hosp.hosp_name}" required>
    </c:when>
        <c:when test="${hosp !=null }">
    <input type="text" class="form-control" id="hosp_name" value="${hosp.hosp_name}" readonly="readonly" required>
    </c:when>
    </c:choose>
  </div>
  
  <div class="mb-3">
    <label for="hosp_tel">병원 전화번호</label>
    <input type="text" class="form-control" id="hosp_tel" value="${hosp.hosp_tel}" required>
  </div>

  <div class="mb-3">
    <label for="hosp_add">병원주소 </label>
    <input type="text" class="form-control" id="hosp_add" value="${hosp.hosp_add}" required>
  </div>
  
  <div class="mb-3">
    <label for="hosp_content">병원 소개</label>
  <input type="text" class="form-control" id="hosp_content" value="${hosp.hosp_content}" style="width:100%;height:100px;" required>
  </div>
  
 <input type="hidden" id="himg_name" value="/resources/images/hospital/bok_hosp_img.jpg"/>

  										

										
  <hr class="mb-4">
  <c:choose>
  	<c:when test="${hosp==null}">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="hospReg();">등록하기</button>
  </c:when>
  <c:when test="${hosp!=null}">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="hospModify();">수정하기</button>
  </c:when>
  </c:choose>
</form>


