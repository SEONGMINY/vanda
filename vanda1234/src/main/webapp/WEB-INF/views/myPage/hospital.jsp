<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">

$(document)
.ready(
		function(e) {




			      
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
					       
					        str += "<input type='hidden' name='hospimgList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					        str += "<input type='hidden' name='hospimgList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					        str += "<input type='hidden' name='hospimgList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					        str += "<input type='hidden' name='hospimgList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
					        
					      });

					  $(".uploadResult").append(str);   
					 }
		

		

		

				

			  
			});


</script>


<h4 class="mb-3">병원정보 관리</h4>
<form action="/user/hospReg" method="post" class="needs-validation">

  <div class="mb-3">
    <label for="hosp_name">병원이름</label>
   
    
    <input type="text" class="form-control" name="hosp_name" id="hosp_name" value="${hosp.hosp_name}" required>
  
  </div>
  
  <div class="mb-3">
    <label for="hosp_tel">병원 전화번호</label>
    <input type="text" class="form-control" name="hosp_tel" id="hosp_tel" value="${hosp.hosp_tel}" required>
  </div>

  <div class="mb-3">
    <label for="hosp_add">병원주소 </label>
    <input type="text" class="form-control" name="hosp_add" id="hosp_add" value="${hosp.hosp_add}" required>
  </div>
  
  <div class="mb-3">
    <label for="hosp_content">병원 소개</label>
  <input type="text" class="form-control" name="hosp_content" id="hosp_content" value="${hosp.hosp_content}" style="width:100%;height:100px;" required>
  </div>
  

										
  

      <div class="mb-3">
    <label for="uploadfile">병원 이미지</label>
  <input type="file" class="form-control" name="uploadFile">
  </div>
          <div class='uploadResult'> 
          <ul>
          
          </ul>
        </div>
          <hr class="mb-4">
        <c:choose>
  	<c:when test="${hosp==null}">
  <input type="submit" name="test1" class="btn btn-dark btn-lg btn-block" value="등록하기">
  </c:when>
  <c:when test="${hosp!=null}">
  <button class="btn btn-dark btn-lg btn-block" type="button" onclick="hospModify();">수정하기</button>
  </c:when>
  </c:choose>
</form>


