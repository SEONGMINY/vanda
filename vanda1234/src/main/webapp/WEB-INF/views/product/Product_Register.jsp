<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="../js/product/productregister.js"></script>
<script>
$(document).ready(
		function() {
			/* $("#register_btn").click(function() {

				var query = {
					pro_name : $("#pro_name").val(),
					pro_price : $("#pro_price").val(),
					pro_content : $("#pro_content").val(),
					pro_amount : $("#pro_amount").val(),	
					file : $("#file_image").val()
				};
				console.log(query);
			}); */

			$("#file_image").change(
					function() {

						if (this.files && this.files[0]) {

							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src",
										data.target.result).windth(250)
										.height(200);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
		});
</script>
<title>Home</title>
</head>
<body>
	<c:if test="${empty product}">
		<!-- product라는 모델or세션이 비어있을경우 상품등록 -->
		<form role="form" method="post" autocomplete="off"
			enctype="multipart/form-data" action="/product/product_insert">


			<p>
				상품이름 : <input type="text" name="pro_name" id="pro_name">
			</p>
			<p>
				상품가격 : <input type="text" name="pro_price" id="pro_price">
			</p>
			<p>
				상품내용 :
				<textarea id="pro_content" name="pro_content"></textarea>
			</p>
			<p>
				상품갯수 : <input type="text" name="pro_amount" id="pro_amount">
			</p>
			<p>
				상품이미지 : <input type="file" name="file" id="file_image">
			</p>


			<div class="select_img">
				<img src="" />
			</div>
			<br>
			<%=request.getRealPath("/")%>
			<p>
				<input type="submit" value="상품등록">
			</p>
		</form>
	</c:if>

	<c:if test="${!empty product}">
		<!-- product라는 모델or세션이 있을경우 상품등록 -->
		<form role="form" method="post" autocomplete="off"
			enctype="multipart/form-data" action="/product/product_modifyProc">


			<p>
				상품이름 : <input type="text" name="pro_name" id="pro_name"
					value="${product.pro_name}">
			</p>
			<p>
				상품가격 : <input type="text" name="pro_price" id="pro_price"
					value="${product.pro_price}">
			</p>
			<p>
				상품내용 :
				<textarea id="pro_content" name="pro_content">${product.pro_content}</textarea>
			</p>
			<p>
				상품갯수 : <input type="text" name="pro_amount" id="pro_amount"
					value="${product.pro_amount}">
			</p>
			<p>
				상품이미지 : <input type="file" name="file" id="file_image" value="${product.img_name}">
			</p>


			<div class="select_img">
				<img src="http://localhost:8080/resources${product.img_path}"
					style="width: 250px; height: 200px;">
			</div>
			<br>
			<!-- 기존파일 삭제 및 데이터베이스에서 사용할 키값을 임시로 저장 -->
			<input type="hidden" name="img_path" value="http://localhost:8080/resources${product.img_path}">
			<input type="hidden" name="img_name" value="${product.img_name}">
			<input type="hidden" name="pro_num" value="${product.pro_num}">
			<p>
				<input type="submit" value="상품수정">
			</p>
		</form>
	</c:if>
</body>
</html>
