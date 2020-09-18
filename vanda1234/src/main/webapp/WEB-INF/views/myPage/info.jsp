<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h4 class="mb-3">회원 정보</h4>
<form class="needs-validation" novalidate>

  <div class="mb-3">
    <label for="user_id">아이디</label>
    <input type="text" class="form-control" id="user_id" readonly="readonly" value="${check.user_id}">
  </div>
  
  <div class="mb-3">
    <label for="user_name">이름</label>
    <input type="text" class="form-control" id="user_name" value="${check.user_name}">
  </div>

  <div class="mb-3">
    <label for="user_pass">비밀번호 </label>
    <input type="password" class="form-control" id="user_pass" value="${check.user_pass}" required>
  </div>
  
  <div class="mb-3">
    <label for="user_pass_check">비밀번호 확인 </label>
    <input type="password" class="form-control" id="user_pass_check" value="${check.user_pass}" onchange="userPassCheck();" required>
    <div id="user-invalid-feedback" class="invalid-feedback">
      	비밀번호가 맞지 않습니다, 다시 입력해주세요.
    </div>
    <div id="user-valid-feedback" class="valid-feedback">
      	비밀번호가 확인되었습니다.
    </div>
  </div>
  
  <div class="mb-3">
    <label for="tel">전화번호 </label>
    <input type="tel" class="form-control" id="user_tel" value="${check.user_tel}" required>
  </div>
  
  <input type="hidden" id="user_gender" value="${check.user_sex }"/>
  
  <hr class="mb-4">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="modify();">수정하기</button>
</form>