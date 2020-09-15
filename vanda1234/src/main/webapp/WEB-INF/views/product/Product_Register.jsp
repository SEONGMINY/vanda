<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->


<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
											data.target.result).width(250)
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

	<div class="container">
		<c:if test="${empty product}">
			<form role="f" method="post" autocomplete="off" enctype="multipart/form-data" action="/product/product_insert">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<h4 class="card-title">
								<i class="fas fa-square"></i>상품등록화면
							</h4>
							<p class="card-catagory"></p>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<tbody>

										<tr style="line-height: 32px;">
											<td>상품이름 : <input type="text" name="pro_name"
												id="pro_name"></td>
										</tr>
										<tr>
											<td>상품가격 : <input type="text" name="pro_price"
												id="pro_price"></td>

										</tr>
										<tr>
											<td>상품내용 : <textarea id="pro_content" name="pro_content"></textarea></td>

										</tr>
										<tr>
											<td>상품갯수 : <input type="text" name="pro_amount"
												id="pro_amount"></td>
										</tr>
										<tr>
											<td>상품이미지 : <input type="file" name="file"
												id="file_image"></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="select_img">
								<img src="" />
							</div>
							<br><%=request.getRealPath("/")%>
						</div>
					</div>

					<div class="pt-3"></div>



				</div>
				<div class="text-center mt-3">
					<input type="submit" value="상품등록">
				</div>
			</div>
		</form>
	</c:if>
	
	<c:if test="${!empty product}">
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" action="/product/product_modifyProc">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<h4 class="card-title">
								<i class="fas fa-square"></i>상품수정화면
							</h4>
							<p class="card-catagory"></p>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<tbody>

										<tr style="line-height: 32px;">
											<td>상품이름 : <input type="text" name="pro_name" id="pro_name" value="${product.pro_name}"></td>
										</tr>
										<tr>
											<td>상품가격 : <input type="text" name="pro_price" id="pro_price" value="${product.pro_price}"></td>

										</tr>
										<tr>
											<td>상품내용 : <textarea id="pro_content" name="pro_content">${product.pro_content}</textarea></td>

										</tr>
										<tr>
											<td>상품갯수 : <input type="text" name="pro_amount" id="pro_amount" value="${product.pro_amount}"></td>
										</tr>
										<tr>
											<td>상품이미지 : <input type="file" name="file" id="file_image" value="${product.img_name}"></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="select_img">
				<img src="http://localhost:8080/resources${product.img_path}" style="width: 250px; height: 200px;">
			</div>
						</div>
					</div>

					<div class="pt-3"></div>



				</div>
				<input type="hidden" name="img_path" value="http://localhost:8080/resources${product.img_path}">
			<input type="hidden" name="img_name" value="${product.img_name}">
			<input type="hidden" name="pro_num" value="${product.pro_num}">
				<div class="text-center mt-3">
					<input type="submit" value="상품수정">
				</div>
			</div>
		</form>
	</c:if>

</body>
</html>
