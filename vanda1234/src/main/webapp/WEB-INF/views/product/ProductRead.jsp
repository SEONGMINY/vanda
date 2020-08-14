<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script src="../resources/js/product/productRead.js"></script> -->
<script>
$(document).ready(function() {
	
	$("#order").click("on", function order(proNum,count){
		proNum = ${read.pro_num};
		count = $("#amountcount").val();
		window.location.href = "http://localhost:8080/product/ProductOrder?pro_num="+proNum+"&count="+count;
	});

	


	$("#basket").click("on", function() {
		var query = {
				"pro_num" : $("#pro_num").val(),
				"count" : $("#amountcount").val()
				};
		console.log(query);
		 $.ajax({
				url : "product/ProductBasket",
				type : "post",
				data : query,
				dataType : "text",
				success : function(data){
					//data에서 success일 경우는 성공 아닐경우는 오류 homeController확인하면됨
					if(data == "success"){				
						alert("장바구니에 담겼습니다.");
						 location.reload(); 
					} else {
						console.log(data);
					}
					window.location.href = "http://localhost:8080/product/ProductBasket";
				}
			});
	});
});
</script>
<body>

	<div id="main">
		<h2>제품 주문 하는 곳</h2>
		<div class="divider_1">
			<div class="line"></div>
		</div>


		<!--search_box -->
		<div id="divider_sh">
			<div class="line"></div>
		</div>

			<div id="store_form">
		
				<div id="store_row">
					<button id="button_img" class="license" value="">
						<img class="s_img" name="s_img" src="http://localhost:8080/resources${read.img_path}" style="width: 250px; height: 200px;">
					</button>
	
					<div id="store_info">
						<h4>${read.pro_name}</h4>
						<input type="hidden" id="pro_num" value="${read.pro_num}">
						<p>상품번호: ${read.pro_num}</p>
						<p>상품내용: ${read.pro_content}</p>
						<p>가격: ${read.pro_price}원</p>
						<p>수량: ${read.pro_amount}개</p>
						<p id="pay_amount">수량<button type="button" onclick="minus()">-</button><input type="text" name="pay_amount" id="amountcount" value="1"><button type="button" onclick="plus()">+</button>
						</p>
						<p>
							<button id="order" value ="${read.pro_num}">주문하기</button>
							<button id="basket">장바구니 담기</button>
					</div>
				
				</div>
				
			</div>
	</div>
	
	
<%-- 	<c:if test="${!empty basketList}">
		<c:forEach var="b" items="${basketList}" varStatus="status">
			<img class="s_img" name="s_img" src="http://localhost:8080/resources${b.img_path}" style="width: 250px; height: 200px;">
			<p>${b.pro_num}</p>
			<p>${b.pro_content}</p>
			<p>${b.pro_price}</p>
		</c:forEach>
	</c:if> --%>
	
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
	
</body>
</html>