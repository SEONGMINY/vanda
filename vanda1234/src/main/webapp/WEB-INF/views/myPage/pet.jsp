<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h4 class="mb-3">반려견 등록</h4>
<form action="/pet/petRegister" method="post" class="needs-validation" novalidate>

  <div class="mb-3">
    <label for="email">이름</label>
    <input type="text" class="form-control" name="pet_name" required>
  </div>
  
  <div class="input-group mb-3">
	  <div class="input-group-prepend" >
	    <span class="input-group-text" id="inputGroupFileAddon01" style="background-color:#212529; color:#ffffff" >프로필</span>
	  </div>
	  <div class="custom-file">
	    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name="uploadFile">
	    <label class="custom-file-label" for="inputGroupFile01"></label>
	 		          <div class='uploadResult' style="display:none"> 
          <ul>
          
          </ul>
        </div>
        <div class="add1" style="display:none"></div>
	  </div>
  </div>

  <div class="row">
  	<div class="col-md-3 mb-3">
      <label for="age">나이</label>
      <input type="number" class="form-control" name="pet_age" placeholder="" required>
    </div>
    <div class="col-md-5 mb-3">
      <label for="kind_num">견종</label>
      <select class="custom-select d-block w-100" name="kind_num" id="kind_num" required>
      				<c:forEach var="kind" items="${kindList}" varStatus="status">
						<option value="${kind.kind_num}">${kind.kind_name}</option>
					</c:forEach>

      </select>
      
    </div>
    <div class="col-md-4 mb-3 form-group has-feedback">
      <label class="control-label" for="food_num">사료</label>
      <select class="custom-select d-block w-100" name = "food_num" id="food_num"  required>
        <c:forEach var="def" items="${defaultFood}" varStatus="status">
			<option value="${def.food_num}">${def.food_name}</option>
		</c:forEach> 
      </select>
    </div>
  </div>
  <hr class="mb-4">
  
  <h4 class="mb-3">성별</h4>
  <div class="d-block my-3">
  		   	 <input id = "pet_sex" type="radio" name="pet_sex"  value="M"/> 수컷<br>
		 	 <input id = "pet_sex" type="radio" name="pet_sex" value="F" /> 암컷
<!--     <div class="custom-control custom-radio">
      <input id="male" name="pet_sex" type="radio" class="custom-control-input" value="M" checked required>
      <label class="custom-control-label" for="pet_sex">수컷</label>
    </div>
    <div class="custom-control custom-radio">
      <input id="female" name="pet_sex" type="radio" class="custom-control-input" value="F" required>
      <label class="custom-control-label" for="pet_sex">암컷</label>
    </div> -->
  </div>
  <hr class="mb-4">

  <h4 class="mb-3">중성화</h4>
  <div class="d-block my-3">
		   	 <input id = "pet_check" type="radio" name="pet_check" value="O"/> O<br>
		 	 <input id = "pet_check" type="radio" name="pet_check" value="X"/> X
<!--     <div class="custom-control custom-radio">
      <input id="check_o" name="check" type="radio" class="custom-control-input" checked required>
      <label class="custom-control-label" for="check">O</label>
    </div>
    <div class="custom-control custom-radio">
      <input id="check_x" name="check" type="radio" class="custom-control-input" required>
      <label class="custom-control-label" for="check">X</label>
    </div> -->
  </div>
  
  <hr class="mb-4">
  <input class="btn btn-dark btn-lg btn-block" type="submit" value="등록하기">
</form>
<script>
$(document).ready(function(){
	
	$("#kind_num").change(function(){
		var kind_num = $(this).val();
		var query = {"kind_num" : kind_num};
		$.ajax({
			url : "/pet/petFood",
			type : "post",
			data : query,
			dataType : "json",
			success : function(data){
				console.log();
				$("#food_num").empty();
				var result = JSON.stringify(data);
				result = JSON.parse(result);
				for(var i=0; i < result.lists.length; i++){
					var html = "<option value='"+result.lists[i].food_num+"'>"+result.lists[i].food_name+"</option>";
					$("#food_num").append(html);
				}
			}
			
		});
		
	});


               
	         var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
	         var maxSize = 5242880;




	         
	         function checkExtension(fileName, fileSize) {

	            if (fileSize >= maxSize) {
	               alert("파일 사이즈 초과");
	               return false;
	            }

	            if (regex.test(fileName)) {
	               alert("해당 종류의 파일은 업로드할 수 없습니다.");
	               return false;
	            }
	            return true;
	         }

	         $("input[type='file']")
	         .change(
	               function(e) {
	                  

	                  var formData = new FormData();

	                  var inputFile = $("input[name='uploadFile']");

	                  var files = inputFile[0].files;

	                  for (var i = 0; i < files.length; i++) {

	                     if (!checkExtension(
	                           files[i].name,
	                           files[i].size)) {
	                        return false;
	                     }
	                     formData.append("uploadFile",
	                           files[i]);

	                  }

	                  $.ajax({
	                     url : '/uploadAjaxAction',
	                     processData : false,
	                     contentType : false,
	                     data : formData,
	                     type : 'POST',
	                     dataType : 'json',
	                     success : function(result) {
	                        console.log(result);
	                     
	                     showUploadResult(result);

	                     }
	                  });
	               });               

	         
	           function showUploadResult(uploadResultArr) {

	               if(!uploadResultArr || uploadResultArr.length == 0) {
	                  return;
	                  }

	               var uploadUL = $(".uploadResult ul");
	                  
	               
	            var str="";
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
	                  $(".uploadResult ul li").each(function(i, obj){
	                       
	                       var jobj = $(obj);
	                       console.dir(jobj);
	                      
	                       str += "<input type='hidden' name='imgList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	                       str += "<input type='hidden' name='imgList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	                       str += "<input type='hidden' name='imgList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	                       str += "<input type='hidden' name='imgList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	                       
	                     });

	                 $(".add1").append(str);   
	                }

  });
</script>


