<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/resources/js/product/productView.js"></script>
<script>
$(document).ready(function(){
	// jstl로 새롭게 추가된 엘리먼트는 on메소드를 사용하며 class값으로 값을 찾지않을경우 동작정의가 되지않음 만약 jstl로 반복적으로 생성한 엘리먼트에 
	// 동작을 추가할경우에는 클래스값지정민 on메소드를 사용해야 동작을 정의할수있음 이부분은 외워야할부분
	$(".delete").on("click", function(e){
		var query = {"pro_num" : $(this).val()};
		 $.ajax({
			url : "/product/productDelete",
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


	$(".modify").on("click", function(){
		var query = {"pro_num" : $(this).val()};	
		 $.ajax({
			url : "/product/productModify",
			type : "post",
			data : query,
			dataType : "text",
			success : function(data){
				//실제 파일을 수정하기위해서 현재 데이터베이스에 저장된 키값인 pro_num을 리턴받아 해당페이지로 이동시켜 상품을 수정
				window.location.href = "/product/product_register?pro_num=" + data;												
			}
		});
	});
			
});
</script>
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
	transform:scale(1);
	overflow:hidden;
	transition: all 0.3s;
}

#button_img img:hover {
	cursor: pointer;
	/* 마우스 오버 시 그림 확대 */
	transform:scale(1.05);
	transition: all 0.3s;
}

#store_row p {
	margin: 0px 0px 0px 10px;
}

/* 매장설명 */
#store_info h4{
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
</style>
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
		</div>
		<div id="main">
	 <h2>VANDA 상품</h2>
     <div class="divider_1"><div class="line"></div></div>
            
		
		<!--search_box -->
		<div id="divider_sh">
			<div class="line"></div>
		</div>

		<div id="store_form">
			<c:forEach var="product" items="${productlist}" varStatus="status">
				<div id="store_row">
					<button id="button_img" class="license"
						value="">
						<img class="s_img" name="s_img" src="http://localhost:8080/resources${product.img_path}"
							style="width: 250px; height: 200px;">
					</button>

					<div id="store_info">
						<h4>${product.pro_name}</h4>
						<input type="hidden" id="pro_num" value="${product.pro_num}">
						<p>상품번호: ${product.pro_num}</p>
						<p>가격: ${product.pro_price}원</p>
						<p>수량: ${product.pro_amount}개</p>			
						<p><button class="delete" value = "${product.pro_num}" id="delete">삭제</button>
						<button class="modify" value = "${product.pro_num}" id="modify">수정</button></p>
					</div>
				</div>
				<!-- store_row -->
			</c:forEach>
			<c:if test="${empty productlist}">
			
				<p>검색결과가없습니다.</p>
			
		
			</c:if>		
		</div>
		<!-- store_form-->


		
		
	</div>
</body>
</html>
