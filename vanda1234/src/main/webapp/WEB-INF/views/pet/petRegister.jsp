<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	$('.multiple-items').click({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});

	$("#kind_num").change(function(){
		var kind_num = $(this).val();
		var query = {"kind_num" : kind_num};
		$.ajax({
			url : "/pet/petFood",
			type : "post",
			data : query,
			dataType : "json",
			success : function(data){
				$("#food_num").empty();
				var result = JSON.stringify(data);
				result = JSON.parse(result);
				for(var i=0; i < result.lists.length; i++){
					var html = "<option>"+result.lists[i].food_name+"</option>";
					$("#food_num").append(html);
				}
			}
			
		});
		
	});
	
  });

</script>
<body>
	<h1>반려견 등록 페이지</h1>

	<form role="form" action="petRegister" method="post">

		<div class="form-group has-feedback">
			<label class="control-label" for="pet_name">강아지 이름</label> 
			<input class="form-control" type="text" id="pet_name" name="pet_name" />

		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="pet_sex">성별</label> <input
				type="radio" name="pet_sex" value="M" checked>남 <input
				type="radio" name="pet_sex" value="S" checked>여
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="kind_num">견종(kind테이블에
				kind_num과 같게)</label><br> 
				<select name="kind_num" id="kind_num">
					<c:forEach var="kind" items="${kindList}" varStatus="status">
					<option value="${kind.kind_num}">${kind.kind_name}</option>
					</c:forEach>

			</select>
			<!-- 					<input class="form-control" type="password" id="kind_num" name="kind_num" placeholder="1만입력"/> -->
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="food_num">사료</label><br>
			 <select name="food_num" id="food_num">
				<c:forEach var="def" items="${defaultFood}" varStatus="status">
					<option>${def.food_name}</option>
				</c:forEach> 
			</select>
		</div>
		<!-- 		<div class="form-group has-feedback">
					<label class="control-label" for="kind_num">비밀번호 확인</label>
					<input class="form-control" type="password" id="user_pass2" name="user_pass2" />
				</div> -->


		<div class="form-group has-feedback">
			<label class="control-label" for="pet_age">강아지 나이 </label> <input
				class="form-control" type="text" id="pet_age" name="pet_age" />
		</div>

		<div class="form-group has-feedback">
			<label class="control-label" for="pet_check">pet_check O또는X </label>
			<input class="form-control" type="text" id="pet_check"
				name="pet_check" />
		</div>


		<button type="submit">작성</button>
	</form>
			<div class="container-fluid">
			<div class="card mb-4">

				<div class="panel panel-default">

					<div class="card-header">
						<i class=""></i>펫 이미지
					</div>

					<div class="panel-body">
						<div class="form-group uploadDiv">
							<input type="file" name='uploadFile' multiple>
						</div>

						<div class='uploadResult'>
							<ul>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- 	<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" onclick="register()">반려견 등록</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
 -->

<div class="multiple-items">
  <div>your content</div>
  <div>your content</div>
  <div>your content</div>
</div>
<script>
$(document).ready(function(e){
	 
  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
	var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){
      
      var jobj = $(obj);
      
      console.dir(jobj);
     
      str += "<input type='hidden' name='imgList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='imgList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='imgList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='imgList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
    });
    
    formObj.append(str).submit();
    
  });

  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
  var maxSize = 5242880;
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
            
          alert(result); 
		  showUploadResult(result);
		  

      }
    }); 
  });

  function showUploadResult(uploadResultArr) {

		if(!uploadResultArr || uploadResultArr.length == 0) {
			return;
			}

		var uploadUL = $(".uploadResult ul");
			
		var str = "";

		 $(uploadResultArr).each(function(i, obj) {

			 if(obj.image){
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
				    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				      
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='/resources/img/picture.png'></a>";
					str += "</div>";
					str +"</li>";
				}
		 });

		 uploadUL.append(str);
		 }

  $(".uploadResult").on("click", "button", function(e){
	  
	  var targetFile = $(this).data("file");

	  var type = $(this).data("type");
	    
	  var targetLi = $(this).closest("li");
	    
	    $.ajax({
	      url: '/deleteFile',
	      data: {fileName: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	        alert(result);
	           
	        targetLi.remove();
	         }
	    }); 
  });

  
  });  
 </script>
 
 

</body>
</html>