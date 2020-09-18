<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
header {
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
}
</style>



<style>
.uploadResult {
  width:100%;
  background-color: white;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>

<%@include file="../postheader.jsp" %>

<main>
	<div class="container-fluid">



		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i>변경 페이지
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form role="form" action="/post/modify" method="post">
						<div class="form-group">
							<label>게시글번호</label> 
							<input class="form-control" name="postNum"
							value="<c:out value='${post.postNum}'/>" readonly>
						</div>
					
						<div class="form-group">
							<label>제목</label> 
							<input class="form-control" name="postTitle"
							value="<c:out value='${post.postTitle}'/>" >
						</div>
						<div class="form-group">
							<label>내용</label> 
							<textarea class="form-control" rows="3" name="postContent" ><c:out value="${post.postContent}"/></textarea>
						</div>
						<div class="form-group">
							<label>아이디</label> 
							<input class="form-control" name="userId"
							value="<c:out value='${post.userId}'/>" readonly>
						</div>
						
							<input type="hidden" name="pageNum" value="${crt.pageNum}">
							<input type="hidden" name="amount" value="${crt.amount}">
							<input type="hidden" name="type" value="${crt.type}">
							<input type="hidden" name="keyword" value="${crt.keyword}">
							
							<button type="submit" data-oper="modify" class="btn btn-outline-dark">변경</button>
							<button type="submit" data-oper="remove" class="btn btn-outline-dark">삭제</button>
							<button type="submit" data-oper="list" class="btn btn-outline-dark">리스트</button>
					</form>
					
					<div class='bigPictureWrapper'>
						<div class='bigPicture'>
						</div>
					</div>
					
					<div class="row">
					  <div class="col-lg-12">
					    <div class="panel panel-default">
					
					      <div class="panel-heading">파일</div>
					      <div class="panel-body">
					        <div class="form-group uploadDiv">
					            <input type="file" name='uploadFile' multiple="multiple">
					        </div>
					        
					        <div class='uploadResult'> 
					          <ul>
					          
					          </ul>
					        </div>
					      </div>
					  
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</main>

	<script type="text/javascript">
		$(document).ready(function(){
				var formObj = $("form");

				$("button").on("click", function(e){
						e.preventDefault();

						var operation = $(this).data("oper");
						
						console.log(operation);
						
						if(operation == 'remove'){
								formObj.attr("action", "/post/remove");
						}else if(operation == 'list'){
								
								formObj.attr("action", "/post/postlist").attr("method", "get");
								var pageNumTag = $("input[name='pageNum']").clone();
								var amountTag = $("input[name='amount']").clone();
								var typeTag = $("input[name='type']").clone();
								var keywordTag = $("input[name='keyword']").clone();

								formObj.empty();
								
								formObj.append(pageNumTag);
								formObj.append(amountTag);
								formObj.append (typeTag);
								formObj.append(keywordTag);
						}else if(operation === 'modify'){
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
					        }
					    
						formObj.submit();
					});
			});
	</script>
	
	<script>

$(document).ready(function() {
  (function(){
    
    var postNum = '<c:out value="${post.postNum}"/>';
    
    $.getJSON("/post/getImgList", {postNum: postNum}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/resources/img/picture.png'></a>";
            str += "</div>";
            str +"</li>";
          }
       });

      
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    
      var targetLi = $(this).closest("li");
      targetLi.remove();
    }
  });  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
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
  
});

</script>
	<%@include file="footer.jsp"%>
	