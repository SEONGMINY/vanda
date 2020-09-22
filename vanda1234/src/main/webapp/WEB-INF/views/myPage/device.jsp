<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h4 class="mb-3">반려견 등록</h4>
<form class="needs-validation" novalidate>

  <div class="mb-3">
    <label for="user_id">아이디</label>
    <input type="text" class="form-control" id="user_id" readonly="readonly" value="${check.user_id}">
  </div>
  
  <div class="row">
  	<div class="col-md-6 mb-3">
      <label for="device_type">디바이스 타입</label>
      <select class="custom-select d-block w-100" name="device_type" id="device_type" required>
	  	<option value="체중계">체중계</option>
	  	<option value="배식기">배식기</option>
      </select>
    </div>
    <div class="col-md-6 mb-3">
    	<label for="device_id">디바이스 아이디</label>
    	<input type="text" class="form-control" id="device_id" required>
    </div>
  </div>
  
  <div class="mb-3">
    <label for="kind_num">반려견</label>
    <select class="custom-select d-block w-100" name="pet_num" id="pet_num" required>
    	<c:forEach var="pet" items="${pet}" varStatus="status">
				<option value="${pet.pet_num}">${pet.pet_name}</option>
		</c:forEach>
    </select>
  </div>
  
  <hr class="mb-4">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="device();">등록하기</button>
</form>