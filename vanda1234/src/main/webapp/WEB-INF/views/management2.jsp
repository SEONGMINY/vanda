<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


 
</head>
<body>
<script type="text/javascript">

function changePetList(){

      $.ajax({
         url : "http://localhost:8080/pet/test",
         type : "post",
         dataType : "json",
         data : {"pet_num" : $("#petName option:selected").val()},
         success : function(data){
             alert("tst");
             location.reload(); 
            
            },
          error:function(request,status,error){
              alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
              // 실패 시 처리
             }



      })
       
        }


</script>

<!-- 지도에 폴리라인 띄우기 -->
<script>		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				<c:forEach var="walkList" items="${walk}" varStatus="i">
					<c:if test="${i.first}">
						center : new kakao.maps.LatLng(${walkList.lat}, ${walkList.lon}), // 지도의 중심좌표
					</c:if>
				</c:forEach>
				
				level : 3
			// 지도의 확대 레벨
			};
	
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			var polyline = new kakao.maps.Polyline({
			    map: map,
			    path: [
					<c:forEach var="walkList" items="${walk}" varStatus="i">
						<c:if test="${not i.last}">
							new kakao.maps.LatLng(${walkList.lat}, ${walkList.lon}),
						</c:if>
						<c:if test="${i.last}">
							new kakao.maps.LatLng(${walkList.lat}, ${walkList.lon})
						</c:if>
					</c:forEach>
			    ],
			    strokeWeight: 2, // 두께
			    strokeColor: '#FF00FF',//색
			    strokeOpacity: 0.8 // 투명도
			});
	
			// 지도에 선을 표시합니다 
			polyline.setMap(map);
</script>




       
<section id="about">


      <div class="row about-wrap">
         <div class="col-full">

            <div class="about-profile-bg"></div>

            <div class="intro">
                        <div id="content1">
                                  <h2>선택한 펫 정보</h2><br>
                        <table>
                         <thead>
                          <tr>
                          
                           <th>펫이름</th>
                           <th>펫나이</th>
                           <th>펫성별</th>
                           <th>중성화유무</th>
                           <th>견종</th>
                           <th>펫번호</th>
                           <th>사료</th>
                          </tr>
                         </thead>
                          <tbody>
                  
                          <tr>
                           <td><select id="petName"onchange="changePetList()">
                            <option>- 펫이름 -</option>
                         <c:forEach var="pet" items="${pet}" varStatus="status">
                                <option value="${pet.pet_num}">${pet.pet_name}</option><br>
                            </c:forEach>
                        
                        </select></td>
                        
                        
                           <td>${pet2.pet_age}</td>
                           <td>${pet2.pet_sex}</td>
                           <td>${pet2.pet_check}</td>
                           <c:set var="kind_num" value="${pet2.kind_num}"></c:set>
                           <c:if test="${kind_num eq '1'}">
                               <td>ddddddd</td>
                           </c:if>
                           <c:if test="${kind_num eq '2'}">
                               <td>말티즈</td>
                           </c:if>
                        
                           <td>${pet2.pet_num}</td>
                             <td>${foodInfo.food_name}</td> 
                          </tr>     
                         </tbody>
                        </table>
                         <button class="btn btn-default" data-target="#layerpop" data-toggle="modal">사료정보 보려면 클릭</button><br>
                                       <a href='http://localhost:8080/pet/petRegister'>펫등록</a> 
                                       <a href='http://localhost:8080/pet/weight'>체중확인하기</a> 
                                       
                           
                     </div>
            </div>   

         </div> <!-- end col-full  -->
      </div> <!-- end about-wrap  -->

   </section> <!-- end about -->


   <!-- about
   ================================================== -->

  <!-- 비만매니지먼트 체중, 식단, 칼로리 ,상태
   ================================================== -->
   <section id="about">

      <div class="row about-wrap">
         <div class="col-full">

            <div class="about-profile-bg"></div>

            <div class="intro">
               <div id="content2">
            <div id="content2_1">
               <div id="content2_2">
                    <div id="circle1">
                       <p style="line-height: 30px" >체중</p>
                    <p style="font-size:40px;">${weight.pet_weight}kg</p>
                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight}kg</p>
                    </div>
                     <div id="circle2">
                        <p style="line-height: 30px">배식</p>
                    <p style="font-size:40px;">${eat.eat_gram}g</p>
                    <p style="font-size:20px; color:#8C8C8C">/256g</p>
                    </div>
                     <div id="circle3">
                        <p style="line-height: 30px">활동</p>
                    <p style="font-size:40px;">${weight.pet_weight }Kal</p>
                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight }kal</p>
                    </div>
                     <div id="circle4">
                        <p style="line-height: 30px">${pet2.pet_name} 의 상태</p>
                        
			<c:if test="${weight.pet_weight > 3}">
                    <p style="font-size:40px;">과체중</p>
                    </c:if>
                    
                    <c:if test="${weight.pet_weight < 3}">
                    <p style="font-size:40px;">저체중</p>
                    </c:if>
                    <p style="font-size:20px; color:#8C8C8C">표준:${kindkg}kg</p>
                    </div>
                 </div>
              </div>
         </div>
            </div>   

         </div> <!-- end col-full  -->
      </div> <!-- end about-wrap  -->

   </section> <!-- end about -->
   <!-- about
   ================================================== -->
   <section id="about">

      <div class="row about-wrap">
         <div class="col-full">

            <div class="about-profile-bg"></div>

            <div class="intro">
                  <div id="content3">
             <select id="browsers" name="browsers">
             <option value="크롬">크롬</option>
             <option value="사파리">사파리</option>
             <option value="엣지">엣지</option>
             <option value="인터넷익스플로러">인터넷익스플로러</option>
             <option value="파이어폭스">파이어폭스</option>
             <option value="오페라">오페라</option>
         </select>
           <div id="cotnet3_1">
              <div id="content3_2">
                    <div id="square1">
                       <p style="line-height: 30px" >산책정보</p>
                    <p style="font-size:40px;">${weight.pet_weight }kg</p>
                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight }kg</p>
                    </div>
                     <div id="square1">
                       <p style="line-height: 30px" >산책정보</p>
                    <p style="font-size:40px;">${weight.pet_weight }kg</p>
                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight }kg</p>
                    </div>
                      <div id="square1">
                       <p style="line-height: 30px" >산책정보</p>
                    <p style="font-size:40px;">${weight.pet_weight }kg</p>
                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight }kg</p>
                    </div>
                 </div>
              </div>
              <div id="square3">
              <p>${pet2.pet_name}에 맞는 코칭 프로그램 바로가기</p>
              </div>
             
              
         </div>
            </div>   

         </div> <!-- end col-full  -->
      </div> <!-- end about-wrap  -->

   </section>

<!-- Modal 창  -->
<br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">현재 사료정보 </h4>
      </div>
      <!-- body -->
      <div class="modal-body">
     사료명 : ${foodInfo.food_name} <br>
   특징 : ${foodInfo.food_ps }
      <br>

      
      <button onclick="recommend()" >사료추천받기</button>
      
      <div id="recommend" style="display:none">
      추천된 사료 목록
      </div>
      
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 창  -->
</body>

</html>






