<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h4 class="mb-3">반려견 등록</h4>
<form class="needs-validation" novalidate>

  <div class="mb-3">
    <label for="email">이름</label>
    <input type="text" class="form-control" id="pet_name" required>
  </div>
  
  <div class="input-group mb-3">
	  <div class="input-group-prepend" >
	    <span class="input-group-text" id="inputGroupFileAddon01" style="background-color:#212529; color:#ffffff" >프로필</span>
	  </div>
	  <div class="custom-file">
	    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
	    <label class="custom-file-label" for="inputGroupFile01"></label>
	  </div>
  </div>

  <div class="row">
  	<div class="col-md-3 mb-3">
      <label for="age">나이</label>
      <input type="number" class="form-control" id="pet_age" placeholder="" required>
    </div>
    <div class="col-md-5 mb-3">
      <label for="kind">견종</label>
      <select class="custom-select d-block w-100" id="kind" required>
        <option value="1">푸들</option>
        <option value="2">말티즈</option>
        <option value="3">골드리트리버</option>
        <option value="4">도베르만</option>
      </select>
    </div>
    <div class="col-md-4 mb-3">
      <label for="state">사료</label>
      <select class="custom-select d-block w-100" id="food" onchange="" required>
        <option value="">00사료</option>
        <option value="1">기타</option>
      </select>
    </div>
  </div>
  <hr class="mb-4">
  
  <h4 class="mb-3">성별</h4>
  <div class="d-block my-3">
    <div class="custom-control custom-radio">
      <input id="male" name="pet_sex" type="radio" class="custom-control-input" value="M" checked required>
      <label class="custom-control-label" for="pet_sex">수컷</label>
    </div>
    <div class="custom-control custom-radio">
      <input id="female" name="pet_sex" type="radio" class="custom-control-input" value="F" required>
      <label class="custom-control-label" for="pet_sex">암컷</label>
    </div>
  </div>
  <hr class="mb-4">

  <h4 class="mb-3">중성화</h4>
  <div class="d-block my-3">
    <div class="custom-control custom-radio">
      <input id="check_o" name="check" type="radio" class="custom-control-input" checked required>
      <label class="custom-control-label" for="check">O</label>
    </div>
    <div class="custom-control custom-radio">
      <input id="check_x" name="check" type="radio" class="custom-control-input" required>
      <label class="custom-control-label" for="check">X</label>
    </div>
  </div>
  
  <hr class="mb-4">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="register();">등록하기</button>
</form>