<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매자 정보적는창</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</head>
<body>
<div class="container">
    <form name="f" method="post">
 
        <div class="col-sm-12 pt-3">
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title"><i class="fas fa-square"></i>수령인 상세정보 입력창</h4>
                    <p class="card-catagory"></p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr style="line-height:32px;">
                                <td>수령인</td>
                                <td>
                                    <input type="text" name="recip_name" id="recip_name" required="required" />
								</td>           
                            </tr>
                            <tr>
                                <td>수령인 전화번호</td>
                                <td>
                                    <input type="text" name="recip_tel" id="recip_tel" required="required" />
                                </td>
                            </tr>
                            <tr>
                            	<td>상품가격: ${read.pro_price} 원 <input type="hidden" id="product_price" value="${read.pro_price}">
									<input type="hidden" id="Maxamount" value="${read.pro_amount}"></td>
                            </tr>
                            <tr id="pay_TotalPrice" >
                            	<td>총가격 </td>
                            	<td><input type="text" id="pay_price" name="pay_price" value="${read.pro_price}" readonly ="readonly">원</td>
                            </tr>
                            <tr>
                            
                            	<td>배송 요청사항</td>
                                <td>
                                     <input type="text" name="ord_msg" id="ord_msg" required="required" />
                                </td>
                            </tr>
                            <tr>
                                <td>우편번호</td>
                                <td>
                          		        <input type="text" name="recip_add" id="recip_add"
											placeholder="우편번호"> <input type="button"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" name="recip_add2" id="recip_add2"
											placeholder="도로명주소"> <input type="text"
										id="sample4_jibunAddress" placeholder="지번주소"> <span
										id="guide" style="color: #999; display: none"></span> <input
										type="text" name="recip_add3" id="recip_add3" placeholder="상세주소">
										<input type="text" id="sample4_extraAddress" placeholder="참고항목">
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>결제방법</td>
                                <td colspan="3">
                                    <input type="radio" id="pay_category" name="pay_category"
						value="카카오페이">카카오페이 <input type="radio" id="pay_category"
						name="pay_category" value="신용카드">신용카드 <input type="radio"
						id="pay_category" name="pay_category" value="무통장입금">무통장입금
                                   
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
 
          
        </div>
        
    </form>
    <div class="text-center mt-3">
        	<button id ="buy_btn" class="btn btn-success">결제하기</button>
    </div>
 
    
</div>


	<!-- 도로명 주소 api -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample4_execDaumPostcode() {

			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('recip_add').value = data.zonecode;
							document.getElementById("recip_add2").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
		$('#buy_btn').click(function() {
			var pro_num=${read.pro_num};
			var count = ${read.count};
			var user_id = "${check.user_id}";
			var data = {
				
				recip_name : $('#recip_name').val(),
				recip_tel : $('#recip_tel').val(),
				recip_add : $('#recip_add').val(),
				ord_msg : $('#ord_msg').val(),
				pay_price : $('#pay_price').val(),
				recip_add2 : $('#recip_add2').val(),
				recip_add3 : $('#recip_add3').val(),
				pay_category : $('#pay_category').val(),
				user_id : user_id,
				pro_num : pro_num,
				count : count
			};
			console.log(data);

			var IMP = window.IMP; // 생략가능
			IMP.init("imp73646324"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용	
			IMP.request_pay({
				pg : 'kakao', // version 1.1.0부터 지원. 결제수단
				pay_method : 'card', // 결제종류
				merchant_uid : 'merchant_' + new Date().getTime(), // 결제날짜
				name : '강아지사료', // 상품명
				amount : $('#pay_price').val(), // 금액
				buyer_email : 'alstlr0404@naver.com', // 사는사람 이메일
				buyer_name : $('#recip_name').val(), // 구매자 이름
				buyer_tel : $('#recip_tel').val(), // 구매자 폰번
				buyer_addr : $('#recip_add').val(), // 구매자 주소
				buyer_postcode : '123-456', // 구매자 우편번호
				m_redirect_url : 'https://www.naver.com' //
			}, function(rsp) {
				if (rsp.success) {
					$.ajax({
						url : "http://localhost:8080/product/order_info",
						type : "POST",
						data : data,
						success : function(data) {
							var msg = '결제가 완료되었습니다.'; // 결제하고나서 나오는 alert
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							alert('결제에 성공했습니다');
							alert(msg + "/" + JSON.stringify(data));
							window.location.href = "http://localhost:8080/product/shopmain";
						}
					})
					
				} else {
					var msg = '결제에 실패하였습니다.';
					
					msg += '에러내용 : ' + rsp.error_msg; // 오류내용 alert
					alert(msg);
				}
				

			});

			/*  var form = $("#"); */

			
		});

		// JS 메소드를 만들어서 동작을 붙여줌

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
			var html = "<td>총 가격 : " + price * cnt + " 원</td>"
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
			var html = "<td>총 가격 : " + price * cnt + " 원</td>"
			$("#amountcount").val(cnt)
			$("#pay_TotalPrice").empty();
			$("#pay_TotalPrice").append(html);
			$("#amountcount").val(cnt);
			$("#pay_price").val(price * cnt);
		}
	</script>
	<script>
		$(document).ready(function() {
			totalPrice();
			function totalPrice() {
				var pay = ${read.pro_price};
				var count = ${read.count};
				var total = pay*count;
				$("#pay_price").val(total);
				
			}	
		});
	</script>
</body>
</html>