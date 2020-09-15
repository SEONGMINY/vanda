<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- <script src="../resources/js/product/productRead.js"></script> -->
<script>
	$(document)
			.ready(
					function() {

						$("#order")
								.click(
										"on",
										function order(proNum, count) {
											proNum = ${read.pro_num};
											count = $("#amountcount").val();
											window.location.href = "http://localhost:8080/product/ProductOrder?pro_num="
													+ proNum
													+ "&count="
													+ count;
										});

						$("#basket")
								.click(
										"on",
										function() {
											var query = {
												"pro_num" : $("#pro_num").val(),
												"count" : $("#amountcount").val()};
											console.log(query);
											$
													.ajax({
														url : "product/ProductBasket",
														type : "post",
														data : query,
														dataType : "text",
														success : function(data) {
															//data에서 success일 경우는 성공 아닐경우는 오류 homeController확인하면됨
															if (data == "success") {
																alert("장바구니에 담겼습니다.");
																location
																		.reload();
															} else {
																console
																		.log(data);
															}
															window.location.href = "http://localhost:8080/product/ProductBasket";
														}
													});
										});
					});
</script>
<body>

	<div class="container">
		<form name="f" method="post">

			<div class="col-sm-12 pt-3">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">
							<i class="fas fa-square"></i> 주문화면
						</h4>
						<p class="card-catagory"></p>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<td><img class="s_img" name="s_img" src="http://localhost:8080/resources${read.img_path}" style="width: 250px; height: 200px;"></td>
									</tr>
										<input type="hidden" id="pro_num" value="${read.pro_num}">
									<tr style="line-height: 32px;">
										<td>상품번호: ${read.pro_num}</td>
									</tr>
									<tr>
										<td>상품내용: ${read.pro_content}</td>

									</tr>
									<tr>
										<td>가격: ${read.pro_price}원</td>

									</tr>
									<tr>
										<td>재고량: ${read.pro_amount}개</td>
									</tr>
									<tr>
										<td id="pay_amount">주문수량</td>
										<td>
											<button type="button" onclick="minus()">-</button>
											<input type="text" name="pay_amount" id="amountcount" value="1">
										<button type="button" onclick="plus()">+</button>

										</td>

									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="pt-3"></div>



			</div>

		</form>

		<div class="text-center mt-3">
			<button id="order"  value ="${read.pro_num}" class="btn btn-success">주문하기</button>
			<button id="basket" class="btn btn-info">장바구니 담기</button>
		</div>
	</div>
</body>
</html>
<script>
	function plus() {
		var cnt = $("#amountcount").val();
		var Maxcnt = $("#Maxamount").val();
		/* console.log(Maxcnt); */

		var price = $("#product_price").val();

		if (cnt == Maxcnt) {
			alert("최대 구매수량은" + Maxcnt + "개입니다");
			return;
		}

		cnt++;
		var html = "<p>총 가격 : " + price * cnt + " 원</p>"
		$("#amountcount").val(cnt)
		$("#pay_TotalPrice").empty();
		$("#pay_TotalPrice").append(html);
		$("#pay_price").val(price * cnt);
	}
	// 1이하로 내려가면안됌
	function minus() {
		var cnt = $("#amountcount").val();
		var Mincnt = 1;
		var price = $("#product_price").val();

		if (cnt == 1) {
			alert("최소 구매수량은" + Mincnt + "개입니다");
			return;
		}

		cnt--;
		var html = "<p>총 가격 : " + price * cnt + " 원</p>"
		$("#amountcount").val(cnt)
		$("#pay_TotalPrice").empty();
		$("#pay_TotalPrice").append(html);
		$("#amountcount").val(cnt);
		$("#pay_price").val(price * cnt);
	}
</script>


</html>