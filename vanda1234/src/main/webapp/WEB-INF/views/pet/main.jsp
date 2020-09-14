

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
 
      #content1 {
      border-style: solid;
        border: 4px #bcbcbc;
        margin: 10px 0px;
        text-align: center;
        font-family: Consolas, monospace;
        font-style: italic;
        font-size: 13px;
        background-color: white;
        border-radius: 20px;
      }
      #content2 {
      display: table;
      background-color: #FFFFFF;
      width:99%;
      height:350px;
      margin: 0px 0px 0px 5px;
      border-radius: 20px;
      border:2px solid #8C8C8C ;
      
      }
      #content2_1{
      display:table-cell;
      text-align: center;
      vertical-align: middle;
      }
      #content2_2{
      display:inline-block;
      
      }
      #content3 {
      display: table;
      background-color: #FFFFFF;
      width:99%;
      height:500px;
      margin: 10px 0px 0px 5px;
      border-radius: 20px;
      border:2px solid #8C8C8C ;
      
      }
      #content3_1{
      display:table-cell;
      text-align: center;
      vertical-align: middle;
      }
      #content3_2{
      display:inline-block;
      
      }
	#circle1{
	width:250px;
	height:250px;
	border-radius: 50%;
	background: #FFFFFF;
	font-size: 16px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:left;
	margin: 10px 45px 10px 45px;
	border:10px solid #BC2424;
	
	}
	#circle2{
	width:250px;
	height:250px;
	border-radius: 50%;
	background: #FFFFFF;
	font-size: 16px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:left;
	margin: 10px 45px 10px 45px;
	border:10px solid #00bba7;
	
	}
	#circle3{
	width:250px;
	height:250px;
	border-radius: 50%;
	background: #FFFFFF;
	font-size: 16px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:left;
	margin: 10px 45px 10px 45px;
	border:10px solid #ffea00;
	
	}
	#circle4{
	width:250px;
	height:250px;
	border-radius: 50%;
	background: #FFFFFF;
	font-size: 16px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:left;
	margin: 10px 45px 10px 45px;
	border:10px solid #003e8b;
	
	}
	#square1{
	width:320px;
	height:380px;
	border-radius: 10%;
	background: #FFFFFF;
	font-size: 16px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:left;
	margin: 10px 85px 10px 85px;
	border:2px solid #8C8C8C;
	}
	#square3 {
	width:400px;
	height:50px;
	border-radius: 10%;
	background: #FFFFFF;
	font-size: 20px;
	text-align: center;
	color:#000000;
	font-weight:bold;
	float:right;
	margin: 10px 10px 10px 45px;
	border:2px solid #8C8C8C;
		
	}
	
	#btn btn-default dropdown-toggle {
	margin: 2px 0px 0px 5px;
	}
	
	section {
	margin-top : 100px;}
</style>

</head>

<script> 


function changePetList(){

		$.ajax({
			url : "pet/test",
			type : "post",
			dataType : "json",
			data : {"pet_num" : $("#petName option:selected").val()},
			success : function(data){
				location.reload();
				},
			 error:function(request,status,error){
		        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
		        // 실패 시 처리
		       }



		})
	    
	     }


		    </script>

<body>

   

      
  

<div id="menu">

<c:choose>
     <c:when test="${check == null}">
  <%@ include file="../notLogin-menu.jsp" %>
    </c:when> 
        <c:when test="${check != null}">
  <%@ include file="../Login-menu.jsp" %>
    </c:when>

</c:choose> 

</div>


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
                           <th>사료번호</th>
                          </tr>
                         </thead>
                          <tbody>
                  
                          <tr>
                           <td>
                           
                           <select id="petName"onchange="changePetList()">
                            <option>- 펫이름 -</option>
                         <c:forEach var="pet" items="${pet}" varStatus="status">
                                <option value="${pet.pet_num}">${pet.pet_name}</option><br>
                            </c:forEach>
                        
                        </select>
                        
                        </td>
                           <td>${pet2.pet_age}</td>
                           <td>${pet2.pet_sex}</td>
                           <td>${pet2.pet_check}</td>
                           <c:set var="kind_num" value="${pet2.kind_num}"></c:set>
                           <c:if test="${kind_num eq '1'}">
                               <td>푸들</td>
                           </c:if>
                           <c:if test="${kind_num eq '2'}">
                               <td>말티즈</td>
                           </c:if>
                        
                           <td>${pet2.pet_num}</td>
                             <td>${pet2.food_num}</td> 
                          </tr>     
                         </tbody>
                        </table>
                        
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
	                    <p style="font-size:20px; color:#8C8C8C">/${test.eat_gram}g</p>
	                    </div>
	                     <div id="circle3">
	                        <p style="line-height: 30px">활동</p>
	                    <p style="font-size:40px;">${weight.pet_weight }Kal</p>
	                    <p style="font-size:20px; color:#8C8C8C">/${weight.pet_weight }kal</p>
	                    </div>
	                     <div id="circle4">
	                        <p style="line-height: 30px">${pet2.pet_name} 의 상태</p>
	                    <p style="font-size:40px;">과체중</p>
	                    <p style="font-size:20px; color:#8C8C8C">표준:${weight.pet_weight }kg</p>
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

   

</body>
</html>