<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ajax 업로드</h1>
	<style>
		.uploadResult {
			width: 100%;
			background-color: white;
		}
		
		.uploadResult ul {
			display: flex;
			flex-flow: row;
			justify-content: center;
			align-items: center;
		}
		
		.uploadResult ul li {
			list-style: none;
			padding: 10px;
		}
		
		.uploadResult ul li img {
			width: 100px;
		}
		
		.uploadResult ul li span{
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
		}
		
		.bigPicture {
		  position: relative;
		  display:flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.bigPicture img{
			width:600px;
		}
	</style>

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<div class="uploadResult">
	<ul>
	
	</ul>
	</div>
<button id='uploadBtn'>Upload</button>

<script src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
 </script>
		
<script>

		function showImage(fileCallPath){
	  
			 $(".bigPictureWrapper").css("display","flex").show();
			  
			 $(".bigPicture")
			  .html("<img src='/display?fileName="+fileCallPath+"'>")
			  .animate({width:'100%', height: '100%'}, 1000);
		  	
		}

		$(".bigPictureWrapper").on("click", function(e){
			  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			  setTimeout(() => {
			    $(this).hide();
			  }, 1000);
		});

		$(".uploadResult").on("click","span", function(e){
			   
			  var targetFile = $(this).data("file");
			  var type = $(this).data("type");
			  console.log(targetFile);
			  
			  $.ajax({
			    url: '/deleteFile',
			    data: {fileName: targetFile, type:type},
			    dataType:'text',
			    type: 'POST',
			      success: function(result){
			         alert(result);
			       }
			  });
			  
			});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize) {
		
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
		
			if (regex.test(fileName)) {
				alert("파일 종류 오류");
				return false;
			}
			return true;
		}

		


	$(document).ready(function(){
		 var cloneObj = $(".uploadDiv").clone();
		  
		 $("#uploadBtn").on("click", function(e){

		 var formData = new FormData();
		
		 var inputFile = $("input[name='uploadFile']");
		
		 var files = inputFile[0].files;
		
		 for (var i = 0 ; i < files.length; i++){

				if(!checkExtension(files[i].name, files[i].size) ){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			 }

		 $.ajax({
			 url: '/uploadAjaxAction',
			 processData: false,
			 contentType: false,
			 data: formData,
			 type: 'POST',
			 dataType:'json',
			 success:function(result){

				 console.log(result);

				 showUploadedFile(result);

				 $(".uploadDiv").html(cloneObj.html());
			 }
		 });
		 
		});

		 var uploadResult = $(".uploadResult ul");

	  		 function showUploadedFile(uploadResultArr) {

			 var str = "";

			 $(uploadResultArr).each(function(i, obj) {

			      if(!obj.image){

			    	  var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			          
			    	  str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
			           "<img src='/resources/img/picture.png'>"+obj.fileName+"</a>"+
			           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
			           "<div></li>"
			        }else{
			          
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);

			          var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;

			          originPath = originPath.replace(new RegExp(/\\/g),"/");

			          
			          str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
		              "<img src='display?fileName="+fileCallPath+"'></a>"+
		              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
		              "<li>";
					 }
			 });

			 uploadResult.append(str);
			 }
	});
			
	</script>
</body>
</html>