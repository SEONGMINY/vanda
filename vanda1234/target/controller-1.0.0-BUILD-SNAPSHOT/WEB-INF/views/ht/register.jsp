<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="header.jsp"%>

<main>
	<div class="container-fluid">
		<h1 class="mt-4">VANDA</h1>


		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>게시글 작성 페이지
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form role="form" action="/ht/register" method="post">
						<div class="form-group">
							<label>카테고리</label> 
							<input class="form-control" name="classNum" value="3" readonly="readonly">
						</div>
						<div class="form-group">
							<label>아이디</label> 
							<input class="form-control" name="userId" >
						</div>
						<div class="form-group">
							<label>제목</label> 
							<input class="form-control" name="postTitle">
						</div>
						<div class="form-group">
							<label>내용</label> 
							<textarea class="form-control" rows="3" name="postContent"></textarea>
						</div>				
							<button type="submit" class="btn btn-outline-dark">작성</button>
							<button type="reset" class="btn btn-outline-dark">리셋</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
<div class="container-fluid">
  <div class="card mb-4">
  
    <div class="panel panel-default">

      <div class="card-header">
				<i class=""></i>파일 업로드
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
</main>

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

<%@include file="footer.jsp"%>
