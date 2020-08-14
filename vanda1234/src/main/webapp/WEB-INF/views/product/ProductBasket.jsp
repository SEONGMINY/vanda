<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<html>
<head>
<style>
* {
	padding: 0;
	margin: 0;
}

#main {
	height: 100%;
}

#main h2 {
	text-align: center;
	margin-top: 50px;
}

/* 문의하기 밑에 선 */
.divider_1 .line {
	width: 160px;
	margin: 0 auto 60px;
	padding: 10px 0px 15px 0px;
	border-bottom: 1px dashed #ccc;
}

/* 매장 검색 */
#search_box {
	display: flex;
	justify-content: center;
	align-items: center;
}

/* 매장검색 select */
#search_box select {
	vertical-align: middle;
	height: 32px;
	font-size: 14px;
}

/* 시/도 select 크기 */
#sido_code {
	margin: 0px 2px;
	width: 150px;
}

/* 시/군 select 크기 */
#sigoon_code {
	margin: 0px 2px;
	width: 150px;
}

/* 검색 버튼 */
#test {
	margin: 0px 2px;
	vertical-align: middle;
	padding: 3px 10px;
	border: 1px solid #BDBDBD;
	background-color: #FFFFFF;
	color: #000000;
	outline: none;
	font: 20px;
}

/* 매장검색 bottom 선 */
#divider_sh .line {
	margin: 30px auto 20px;
	width: 1200px;
	border: 1px solid #343a40;
}

/* 제휴매장 폼 */
#store_form {
	margin: 0 auto;
	height: 748px;
	width: 1120px;
	/* border: 1px solid #000000; */
	box-sizing: border-box;
}

/* 매장사진 */
#store_row {
	margin: 30px 10px;
	/* border: 1px solid #000000; */
	position: relative;
	display: inline-block;
	flex-direction: column;
	flex-wrap: nowrap;
	width: 255px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

#button_img {
	border: none;
	outline: none;
	transform: scale(1);
	overflow: hidden;
	transition: all 0.3s;
}

#button_img img:hover {
	cursor: pointer;
	/* 마우스 오버 시 그림 확대 */
	transform: scale(1.05);
	transition: all 0.3s;
}

#store_row p {
	margin: 0px 0px 0px 10px;
}

/* 매장설명 */
#store_info h4 {
	vertical-align: middle;
	text-align: center;
	font-size: 20px;
	margin: 5px 0;
}

#store_info p {
	color: #888888;
	font-size: 14px;
	width: 245px;
	overflow: hidden;
	text-overflow: ellipsis;
}

/* Pagination */
.pagination {
	list-style: none;
	text-align: center;
	margin: 50px 0px 30px;
}

.pagination a {
	padding: 8px 16px;
	text-decoration: none;
	color: black;
}

.pagination li {
	position: relative;
	/* display: inline-block; */
	display: inline;
}

.pagination_active {
	background-color: #ddd;
}

/* 선택되지 않았을 때 */
.pagination a:active {
	border-bottom: 1px solid #000000;
	color: #000000;
	font-weight: bold;
}

.pagination a:hover {
	background-color: #ddd;
}

#header {
	width: 100%;
	height: 20%;
}

#content {
	width: 100%;
	height: 80%;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		// jstl로 새롭게 추가된 엘리먼트는 on메소드를 사용하며 class값으로 값을 찾지않을경우 동작정의가 되지않음 만약 jstl로 반복적으로 생성한 엘리먼트에 
		// 동작을 추가할경우에는 클래스값지정민 on메소드를 사용해야 동작을 정의할수있음 이부분은 외워야할부분
		$(".basketdelete").on("click", function(e){
			var query = {"pro_num" : this.id};
			console.log(query);
			 $.ajax({
				url : "/product/basketdelete",
				type : "post",
				data : query,
				dataType : "text",
				success : function(data){
					//data에서 success일 경우는 성공 아닐경우는 오류 homeController확인하면됨
					if(data == "success"){						
						alert("삭제를 완료했습니다.");
						location.reload();	
					} else {
						alert("오류발생");
					}
				}
			});	 	
		});	
	
	});
</script>
<title>Home</title>
</head>
<body>
	<div id="wrap">

		<div id="header">

			<c:if test="${check == null}">
				<%@ include file="../notLogin-menu.jsp"%>
  					널임
    		</c:if>

			<c:if test="${check != null}">
				<%@ include file="../Login-menu.jsp"%>
  						${check.user_id}님 안녕하세요
   			 </c:if>
		</div>
		<div id="main">
			<h2>장바구니 리스트</h2>
			<div class="divider_1">
				<div class="line"></div>
			</div>

			
			<div id="store_info">
				<c:if test="${!empty basketList}">
					<c:forEach var="b" items="${basketList}" varStatus="status">
						<img class="s_img" name="s_img"
							src="http://localhost:8080/resources${b.img_path}"
							style="width: 250px; height: 200px;">
						<p>${b.pro_num}</p>
						<p>상품 이름: ${b.pro_content}</p>
						<p>가격 : ${b.pro_price}원</p>
						<p>수량 : ${b.count}개</p>
						<p id="totalPrice${status.index}" data-price="${b.pro_price * b.count}">총가격: ${b.pro_price * b.count}</p>
						<!-- <p><button id="basketdelete">상품삭제</button> -->
						<p><button class="basketdelete" id="${b.pro_num}">상품삭제</button>
					</c:forEach>
				</c:if>
			</div>
			<div id="divider_sh">
				<div class="line"></div>
			</div>
			
			<p id="Alltotal">가격 총 합계 : ${b.pro_price}원</p>
			<button id="basketOrder">주문하기</button>
			
		</div>
		
		
</body>
	<script>
		$(document).ready(function() {
			var totalPrice = totalPrice();

			function totalPrice() {
				var total = 0;
				var basket = ${fn:length(basketList)};
				for(var cnt=0;cnt<basket;cnt++){
					total += $("#totalPrice"+cnt).data('price');
				};
				var html = "<h4>가격 총 합계 : " + total + " 원</p>";
				$("#Alltotal").html(html);

				return total;
			};

			$("#basketOrder").on("click",function(){
				window.location.href = "http://localhost:8080/product/basketInfo?totalPrice="+totalPrice;
			});

			
		});
	</script>
</html>
