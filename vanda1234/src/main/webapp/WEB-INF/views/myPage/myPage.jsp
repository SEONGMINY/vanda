<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>마이페이지</title>
    
    <!-- 부트 스크립트 필수 링크 및 스크립트 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	<!-- jQuery 필수 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script> 
	<meta name="theme-color" content="#563d7c">
	
	<!-- Noto Sans 글씨체 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

	<style>
	
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		nav a{
         
         	color : #d4d4d4;
         	font-size : 14px;
      	}
      
      	nav a:hover {
         	text-decoration:none;
         	color : #eeeeee;
      	}
		
		.list-group a {
			color : black;
			/* font-weight : bold; */
		}
		
		.bd-placeholder-img {
		  font-size: 1.125rem;
		  text-anchor: middle;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		}
		
		@media (min-width: 768px) {
		  .bd-placeholder-img-lg {
		    font-size: 3.5rem;
		  }
		}
		
		
	</style>
	
	<script>
		function includeChange(page) {
			if(page == 'info'){
				$("#info-page").show();
				$("#pet-page").hide();
				$("#device-page").hide();
				$("#hospital-page").hide();
			} else if (page == 'pet'){
				$("#info-page").hide();
				$("#pet-page").show();
				$("#device-page").hide();
				$("#hospital-page").hide();				
			} else if (page == 'device') {
				$("#info-page").hide();
				$("#pet-page").hide();
				$("#device-page").show();
				$("#hospital-page").hide();
			} else if (page == 'hospital'){
				$("#info-page").hide();
				$("#pet-page").hide();
				$("#device-page").hide();
				$("#hospital-page").show();
			}
		}
	</script>
    
  </head>
  
  <header>
  	<%@include file="../navBar.jsp" %>	    
  </header>

  <body class="bg-light">
    <div class="container">

  <div class="row">
    <div class="col-md-4 order-md-2 mb-4" style="margin-top:10px;">
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="">
            <h6 class="my-0"><a href="#" onclick="includeChange('info');">회원정보 관리</a></h6>
          </div>
        </li>
        <c:if test="${check.user_rule == 'member'}">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0"><a href="#" onclick="includeChange('pet');">반려견 등록</a></h6>
          </div>
        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0"><a href="#" onclick="includeChange('device');">기기 등록</a></h6>
          </div>
        </li>
        </c:if>
        <c:if test="${check.user_rule == 'doctor'}">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0"><a href="#" onclick="includeChange('hospital');">병원등록 및 관리</a></h6>
          </div>
        </li>
        </c:if>
      </ul>
    </div>
    
    <div class="col-md-8 order-md-1" style="margin-top:20px;">
    	<div id="info-page">
    		<%@include file="./info.jsp" %>
    	</div>
    	<div id="pet-page" style="display:none;">
    		<%@include file="./pet.jsp" %>
    	</div>
    	<div id="device-page" style="display:none;">
    		<%@include file="./device.jsp" %>
    	</div>
    	<div id="hospital-page" style="display:none;">
    		<%@include file="./hospital.jsp" %>
    	</div>
    </div>
  </div>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    
  </footer>
</div>
</body>
<script>

function hospModify() {
	var formData = {

			"hosp_name" : $('#hosp_name').val(),
			"hosp_tel" : $('#hosp_tel').val(),
			"hosp_add" : $('#hosp_add').val(),
			"hosp_content" : $('#hosp_content').val(),
			"himg_name" : $('#himg_name').val()
			}

	$.ajax ({
		url: "/user/hospModify",
		type: "post",
		data: formData,
		success: function(data){
			if(data == 'success'){
				alert("수정되었습니다.");
				window.location.href = "http://localhost:8080/user/logout";
				
			} else {
				alert("오류발생");
			}		
		},
		error: function(request, status, error){
			alert("접속할수없음");
			alert("code = " + request.status + " message = "
	                  + request.responseText + " error = " + error);
		}
	});
	
}

function hospReg() {
	

	var formData = {

			"hosp_name" : $('#hosp_name').val(),
			"hosp_tel" : $('#hosp_tel').val(),
			"hosp_add" : $('#hosp_add').val(),
			"hosp_content" : $('#hosp_content').val(),
			"himg_name" : $('#himg_name').val()
			}

	$.ajax ({
		url: "/user/hospReg",
		type: "post",
		data: formData,
		success: function(data){
			if(data == 'success'){
				alert("병원이 등록되었습니다.");
				window.location.href = "http://localhost:8080/user/logout";
				
			} else {
				alert("오류발생");
			}		
		},
		error: function(request, status, error){
			alert("접속할수없음");
			alert("code = " + request.status + " message = "
	                  + request.responseText + " error = " + error);
		}
	});
			 	
			
	
	
	
}
	function register() {

		console.log($("#pet_name").val());
		console.log($("#pet_age").val());
		console.log($("#kind_num").val());
		console.log($("#food_num").val());
		console.log($("#pet_sex").val());
		console.log($("#pet_check").val());
		
		
		var formData = {
				"pet_name" : $("#pet_name").val(),
				"pet_age" : $("#pet_age").val(),
				"kind_num" : $("#kind_num").val(),
				"food_num" : $("#food_num option:selected").val(),
				"pet_sex" : $("#pet_sex").val(),
				"pet_check" : $("#pet_check").val()	

				
		}
		console.log(formData);
		$.ajax ({
			url: "/pet/petRegister",
			type: "post",
			data: formData,
			success: function(data){
				if(data == 'success'){
					alert("펫 등록이 되었습니다..");
					window.location.href = "http://localhost:8080/management2";
				} else {
					alert("펫 등록에 실패했습니다..");
				}		
			},
			error: function(err){
				console.log(err);
				alert("접속할수없음"+err);
				
			}
		});

		
		
	};
	function modify() {
		var formData = {
				"user_name" : $("#user_name").val(),
				"user_id" : $("#user_id").val(),
				"user_pass" : $("#user_pass").val(),
				"user_sex" : $("#user_gender").val(),
				"user_tel" : $("#user_tel").val()		
		}
		
		$.ajax ({
			url: "/user/editINFO",
			type: "post",
			data: formData,
			success: function(data){
				if(data == 'success'){
					alert("회원정보가 수정되었습니다.");
					window.location.href = "http://localhost:8080/user/logout";
				} else {
					alert("회원정보 수정이 실패하였습니다.");
				}		
			},
			error: function(err){
				alert("접속할수없음"+err);
			}
		});
	}
	function userPassCheck() {
		var pass1 = $("#user_pass").val();
		var pass2 = $("#user_pass_check").val();
	
		if(pass1==pass2) {
			$("#user_pass_check").removeClass("is-invalid");
			$("#user_pass_check").addClass("is-valid");
			$("#user-invalid-feedback").hide();
			$("#user-valid-feedback").show();
		} else {
			$("#user_pass_check").addClass("is-invalid");
			$("#user_pass_check").removeClass("is-valid");
			$("#user-invalid-feedback").show();
			$("#user-valid-feedback").hide();
		}
	}
</script>
</html>