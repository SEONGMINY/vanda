<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Home</title>

<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/shop-homepage.css" rel="stylesheet">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		var totalPrice = totalPrice();
		function totalPrice() {
			var basketIndex = $('.card-body').length;
			var total=0;
			for(var i=0;i<basketIndex;i++) {
				var target=$('.card-body').eq(i);
				total+=target.find('#totalPrice'+i).data('price');
				//console.log(target);
				//console.log(target.find('#totalPrice'+i).data('price'));
			}
			var html = "<h4>가격 총 합계 : " + total + " 원</p>";
			$("#Alltotal").html(html);
			return total;
		}
		$("#basketOrder").on("click",function(){
			window.location.href = "http://localhost:8080/product/basketInfo?totalPrice="+totalPrice;
		});

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
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/shopmain">Vanda</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${check == null}">
						<li class="nav-item">
							<a class="nav-link" href="/user/login">로그인</a>
						</li>
					</c:if>

					<c:if test="${check != null}">
						<li class="nav-item">
							<a class="nav-link" href="">${check.user_id}님 안녕하세요</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/user/logout">로그아웃</a>
						</li>

					</c:if>

					<li class="nav-item active">
						<a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
							<a class="nav-link" href="/product/ProductBasket">장바구니</a>
					</li>
					<li class="nav-item">
							<a class="nav-link" href="/product/shopmypage">마이페이지</a>
					</li>
					<c:if test="${check.user_rule == 'admin'}">
						<li class="nav-item">
							<a class="nav-link" href="/product/productmain">상품관리</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 인클루드 되는 내용 -->

	<!-- Page Content -->
	<div id="main" class="container">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">장바구니</h1>
				<!-- 밑에 주석된 부분은 카테고리가 필요하면 쓰고 필요없으면 주석한 채로 그냥 계속 놔두면 됨-->

				<div class="list-group">
					<a href="/product/shopmain" class="list-group-item">전체보기</a> <a
						href="/product/Bestproduct" class="list-group-item">인기상품</a> <a
						href="#" class="list-group-item">추천상품</a>
				</div>


			</div>
			<!-- /.col-lg-3 -->

			<div class="col-lg-9">

				<!-- 900X350 짜리 바뀌는 화면인데 보고싶은거 이미지나 내용 적어주면 됨 -->
				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>

          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://localhost:8080/resources\upload\2020\09\15\6f9c3bdd-3afb-4831-8ebc-dbb00e9e0f9f_pet5.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://localhost:8080/resources\upload\2020\09\11\0f5e6408-6812-4376-913e-5d76d251b519_pet3.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://localhost:8080/resources\upload\2020\09\11\98aa11ec-32c9-427f-9c83-bdd5e8899bff_pet4.jpg" alt="Third slide">
            </div>
          </div>

					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>




				<!-- 여기서부터 상품목록 화면-->
				<div id="store_form" class="row">
				<c:if test="${!empty basketList}">
					<c:forEach var="b" items="${basketList}" varStatus="status">
						<div class="col-lg-4 col-md-6 mb-4">
							<div id="store_row" class="card h-100">
								<button id="button_img" class="license" value="">
									<img class="s_img" name="s_img" src="http://localhost:8080/resources${b.img_path}" style="width: 250px; height: 200px;">
								</button>
								<div id="store_info" class="card-body">
									<a href="http://localhost:8080/product/ProductRead?pro_num=${b.pro_num}">
										<h5 class="card-title">상품 이름: ${b.pro_name}</h4></a> 
									<input type="hidden" id="pro_num" value="${b.pro_num}">
									<h5>가격 : ${b.pro_price}원</h5>
									<p class="card-text">상품 내용: ${b.pro_content}</p>
									<p class="card-text">주문수량 : ${b.count}개</p>
									<p id="totalPrice${status.index}" data-price="${b.pro_price * b.count}" class="card-text">총가격:
										${b.pro_price * b.count}</p>
									<p>
										<button class="basketdelete" id="${b.pro_num}">상품삭제</button>
								</div>
								<div class="card-footer">
									<small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
								</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
				</div>
				<p id="Alltotal"></p>
				<button id="basketOrder">주문하기</button>


			</div>


		</div>


	</div>
</body>

</html>
