<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--- basic page needs
   ================================================== -->
<meta charset="utf-8">
<title>Infinity</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
   ================================================== -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
   ================================================== -->
<link rel="stylesheet" href="/resources/css/base.css">
<link rel="stylesheet" href="/resources/css/vendor.css">
<link rel="stylesheet" href="/resources/css/home.css">

<!-- script
   ================================================== -->
<script src="/resources/js/modernizr.js"></script>
<script src="/resources/js/pace.min.js"></script>

<!-- favicons
   ================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<style>
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
   width: 99%;
   height: 350px;
   margin: 0px 0px 0px 5px;
   border-radius: 20px;
}

#content2_1 {
   display: table-cell;
   text-align: center;
   vertical-align: middle;
}

#content2_2 {
   display: inline-block;
}

#circle1 {
   width: 250px;
   height: 250px;
   border-radius: 50%;
   background: #FFFFFF;
   font-size: 16px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: left;
   margin: 10px 45px 10px 45px;
   border: 10px solid #BC2424;
}

#circle2 {
   width: 250px;
   height: 250px;
   border-radius: 50%;
   background: #FFFFFF;
   font-size: 16px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: left;
   margin: 10px 45px 10px 45px;
   border: 10px solid #00bba7;
}

#circle3 {
   width: 250px;
   height: 250px;
   border-radius: 50%;
   background: #FFFFFF;
   font-size: 16px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: left;
   margin: 10px 45px 10px 45px;
   border: 10px solid #ffea00;
}

#circle4 {
   width: 250px;
   height: 250px;
   border-radius: 50%;
   background: #FFFFFF;
   font-size: 16px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: left;
   margin: 10px 45px 10px 45px;
   border: 10px solid #003e8b;
}

#content3 {
   display: table;
   background-color: #FFFFFF;
   width: 99%;
   height: 200px;
   margin: 10px 0px 0px 5px;
   border-radius: 20px;
   border: 2px solid #8C8C8C;
}

#content3_1 {
   display: table-cell;
   text-align: center;
   vertical-align: middle;
}

#content3_2 {
   display: inline-block;
}

#square1 {
   width: 320px;
   height: 380px;
   border-radius: 10%;
   background: #FFFFFF;
   font-size: 16px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: left;
   margin: 10px 50px 10px 50px;
   border: 2px solid #8C8C8C;
}

#square3 {
   width: 400px;
   height: 50px;
   font-size: 20px;
   text-align: center;
   color: #000000;
   font-weight: bold;
   float: right;
}

#browsers2 {
   background-color: white;
   border: 1px solid purple;
   display: inline-block;
   font: inherit;
   line-height: 1.5em;
   padding: 0.5em 3.5em 0.5em 1em;
   margin: 0;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
   -webkit-appearance: none;
   -moz-appearance: none;
   background-image: linear-gradient(45deg, transparent 50%, gray 50%),
      linear-gradient(135deg, gray 50%, transparent 50%),
      radial-gradient(#ddd 70%, transparent 72%);
   background-position: calc(100% - 20px) calc(1em + 2px),
      calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
   background-size: 5px 5px, 5px 5px, 1.5em 1.5em;
   background-repeat: no-repeat;
}
</style>

</head>


<body id="top">


   <!-- header 
   ================================================== -->
   <header>

      <div class="header-logo">
         <a href="http://localhost:8080/user/logout">VANDA</a>
      </div>

      <a id="header-menu-trigger" href="#0"> <span
         class="header-menu-text">Menu</span> <span class="header-menu-icon"></span>
      </a>

      <nav id="menu-nav-wrap">

         <a href="#0" class="close-button" title="close"><span>Close</span></a>

         <h3>VANDA</h3>

         <ul class="nav-list">
            <li class="current"><a class="smoothscroll" href="#home"
               title="">Home</a></li>
            <li><a href="http://localhost:8080/user/login">비만매니지먼트</a></li>
            <li><a class="smoothscroll" href="#services" title="">상담</a></li>
            <li><a href="http://localhost:8080/post/postlist">커뮤니티</a></li>
            <li><a href="http://localhost:8080/product/shopmain"> 쇼핑몰</a></li>
            <c:choose>
               <c:when test="${check == null}">
                  <li><a href="http://localhost:8080/user/login">로그인</a></li>
               </c:when>
               <c:when test="${check != null}">
                  <li><a href="http://localhost:8080/user/logout">로그아웃</a></li>
                  <li><a href="http://localhost:8080/user/myPage">마이페이지</a></li>
                  <li><a href="http://localhost:8080/pet/petRegister">펫등록</a></li>
               </c:when>

            </c:choose>

         </ul>

         <p class="sponsor-text">

            It's a waste of time <br> to worry.<br> Start now.VANDA
            <!-- Looking for an awesome and reliable webhosting? Try <a href="http://www.dreamhost.com/r.cgi?287326|STYLESHOUT">DreamHost</a>.
            Get <span>$50 off</span> when you sign up with the promocode <span>styleshout</span>.  -->
            <!-- Simply type   the promocode in the box labeled “Promo Code” when placing your order. -->
         </p>

         <ul class="header-social-list">
            <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            <li><a href="#"><i class="fa fa-behance"></i></a></li>
            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
         </ul>

      </nav>
      <!-- end #menu-nav-wrap -->

   </header>
   <!-- end header -->


   <!-- home
   ================================================== -->
   <c:choose>
      <c:when test="${check == null}">
         <section id="home">

            <div class="overlay"></div>

            <div class="home-content-table">
               <div class="home-content-tablecell">
                  <div class="row">
                     <div class="col-twelve">

                        <h3 class="animate-intro"></h3>
                        <h1 class="animate-intro">
                           <br>

                        </h1>

                        <div class="more animate-intro">
                           <a class="smoothscroll button stroke" href="#about"> Learn
                              More </a>
                        </div>

                     </div>
                     <!-- end col-twelve -->
                  </div>
                  <!-- end row -->
               </div>
               <!-- end home-content-tablecell -->
            </div>
            <!-- end home-content-table -->

            <!--<ul class="home-social-list">
          <li class="animate-intro">
              <a href="#"><i class="fa fa-facebook-square"></i></a>
         </li>
         <li class="animate-intro">
              <a href="#"><i class="fa fa-twitter"></i></a>
         </li>
         <li class="animate-intro">
              <a href="#"><i class="fa fa-instagram"></i></a>
         </li>
         <li class="animate-intro">
              <a href="#"><i class="fa fa-behance"></i></a>
         </li>
         <li class="animate-intro">
              <a href="#"><i class="fa fa-dribbble"></i></a>
         </li>         
      </ul> -->
            <!-- end home-social-list -->

            <div class="scrolldown">
               <a href="#about" class="scroll-icon smoothscroll"> Scroll Down
                  <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
               </a>
            </div>

         </section>
      </c:when>
   </c:choose>


   <c:choose>
      <c:when test="${check != null}">
         <%@ include file="management.jsp"%>
      </c:when>

   </c:choose>
   <!-- end home -->
   <!-- about
   ================================================== -->
   <%-- <section id="about">

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

   </section> --%>
   <!-- end about -->


   <!-- about
   ================================================== -->


   <!-- about
   ================================================== -->

   <c:choose>
      <c:when test="${check == null}">
         <section id="about">

            <div class="row about-wrap">
               <div class="col-full">

                  <div class="about-profile-bg"></div>

                  <div class="intro">
                     <h3 class="animate-this">About Us</h3>
                     <p class="lead animate-this">
                        <span>VANDA</span> 는 <br>반려견을 건강하게 케어해주는 서비스 입니다.<br>
                        지금 당장 건강한 다이어트 시작하겠습니까?
                     </p>
                  </div>

               </div>
               <!-- end col-full  -->
            </div>
            <!-- end about-wrap  -->

         </section>
         <!-- end about -->
      </c:when>
   </c:choose>

   <c:choose>
      <c:when test="${check == null}">
         <!-- 반다 소개 시작 -->
         <section id="portfolio">

            <div class="intro-wrap">

               <div class="row narrow section-intro with-bottom-sep animate-this">
                  <div class="col-twelve">
                     <h3>Introduce</h3>
                     <h1>VANDA란?</h1>

                     <p class="lead">
                        VANDA의 주서비스는 IOT장비를 통하여 반려견주가 <br>산책만 시켜주면 자연스럽고 건강하게 다이어트를
                        할 수 있는 서비스 입니다. <br>뿐만 아니라 간단한 온라인을 통한 수의사 상담과<br>
                        VANDA회원들이 소통할수 있는 각종 커뮤니티, <br>VANDA의 고유한 IOT제품을 파는 쇼핑몰이
                        있습니다.
                     </p>
                  </div>
               </div>
               <!-- end row section-intro -->

            </div>
            <!-- end intro-wrap -->

            <div class="row portfolio-content">
               <div class="col-twelve">
                  <div id="folio-wrap" class="bricks-wrapper">

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-shutterbug.jpg"
                           data-sub-html="#01">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/shutterbug.jpg"
                              alt="Skaterboy">
                              <div class="item-text">
                                 <span class="folio-types"> 멍멍아 놀자 </span>
                                 <h3 class="folio-title">멍멍</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="01" class='hide'>
                           <h4>오늘 사진찍었어요</h4>
                           <p>
                              너무 귀엽죠 내똥강아지 사랑스럽지요 세상사람들이 귀여운거 다알았음 좋겠당 *^.^*</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-dog1.jpg"
                           data-sub-html="#02">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/dog1.jpg" alt="Shutterbug">
                              <div class="item-text">
                                 <span class="folio-types"> 강아지랑 놀이활동 할사람 </span>
                                 <h3 class="folio-title">실내놀이 영상</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="02" class='hide'>
                           <h4>강아지랑 놀이활동 할사람</h4>
                           <p>
                              <!-- Lorem ipsum Dolor deserunt labore sint officia. Magna et aute enim proident tempor sunt quis nulla voluptate fugiat velit. <a href="https://www.behance.net/">Details -->
                              비오는날 산책은 힘드니 강아지랑 실내놀이 어때요~?</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-dog2.jpg"
                           data-sub-html="#03">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/dog2.jpg" alt="Explore">
                              <div class="item-text">
                                 <span class="folio-types"> 반려견이랑 함께 떠나는 여행 </span>
                                 <h3 class="folio-title">멍멍아 야옹해봐</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="03" class='hide'>
                           <h4>Architecture</h4>
                           <p>
                              <a>오늘만은 분위기에 취하고싶어 하는것같은 우리 또또 넘나 사랑스러워~^^ </a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-minimalismo.jpg"
                           data-sub-html="#04">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/minimalismo.jpg"
                              alt="Minimalismo">
                              <div class="item-text">
                                 <span class="folio-types"> 호기심이 많은 강아지 </span>
                                 <h3 class="folio-title">멍멍멍멍</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="04" class='hide'>
                           <h4>호기심이 많은 강아지</h4>
                           <p>
                              카메라를 새로 샀는데 두호가 뭔지 궁금해서 다가오길래 바로 찍어버린 이사진! 귀여워 증.말 <a
                                 href="https://www.behance.net/">Details</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-dog3.png"
                           data-sub-html="#05">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/dog3.png" alt="Salad">
                              <div class="item-text">
                                 <span class="folio-types"> 왕눈이 너무 귀여워 </span>
                                 <h3 class="folio-title">엉아 지금뭐해?</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="05" class='hide'>
                           <h4>엉아 지금뭐해?</h4>
                           <p>
                              갸우뚱하는 우리 왕눈이 좀 봐요 진짜 미친다 진짜.. 나미쳐 왕눈이 너무 귀엽잖아 나 미쳐 </a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-salad.jpg"
                           data-sub-html="#06">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/salad.jpg" alt="Salad">
                              <div class="item-text">
                                 <span class="folio-types"> 공식정보 </span>
                                 <h3 class="folio-title">강아지와 고양이가 친구가 될 수 있다고?</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="06" class='hide'>
                           <h4>공식정보</h4>
                           <p>
                              강아지와 고양이가 친구가 될 수 있는거 아시나요?</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                  </div>
                  <!-- end folio-wrap -->
               </div>
               <!-- end twelve -->
            </div>
            <!-- end portfolio-content -->

         </section>
         <!-- end portfolio -->
      </c:when>
   </c:choose>
   <!-- about
   ================================================== -->

   <c:choose>
      <c:when test="${check == null}">
         <section id="services">

            <div class="overlay"></div>
            <div class="gradient-overlay"></div>

            <div class="row narrow section-intro with-bottom-sep animate-this">
               <div class="col-full">

                  <h3>Services</h3>
                  <h1>What We Do.</h1>

                  <p class="lead">
                     반다는 총 3개의 IOT장비로 구성되어있스며<br> 자동배식기, 자동체중계, 무게측정 밥그릇 으로 이루어
                     져있습니다. <br>3가지 장비만 있다면 자동으로 VANDA에서 건강한다이어트를 할 수 있습니다.
                  </p>

               </div>
               <!-- end col-full -->
            </div>
            <!-- end row -->

            <div class="row services-content">

               <div class="services-list block-1-2 block-tab-full group">

                  <div class="bgrid service-item animate-this">
                     <br> <span class="icon">
                        <!-- <i class="icon-paint-brush"></i> --> <img
                        src="../resources/css/icon/food.png" alt="food">

                     </span>

                     <div class="service-content">
                        <h3 class="h05">자동배식기</h3>


                        <p>
                           강아지의 전날에 산책한 활동량 대비 체중을 합산하여 <br>강아지에게 하루에 3번 적정량을 배식 할 수
                           있도록 하여 <br>강아지가 건강하게 다이어틀 할 수 있게 하는<br> VANDA의
                           IOT장비입니다. <br>또한 강아지의 나이, 견종, 체중에 맞춰 강아지 개별로 <br>맞춤형
                           사료를 추천하는 서비스가 있습니다.
                        </p>
                     </div>

                  </div>
                  <!-- end bgrid -->

                  <div class="bgrid service-item animate-this">

                     <span class="icon"> <img
                        src="../resources/css/icon/weight.png" alt="weight">
                     </span>

                     <div class="service-content">
                        <h3 class="h05">자동 체중계</h3>

                        <p>
                           강아지의 배변패드 아래에 체중계를 놓아두면 <br>강아지가 대소변을 하러 갈때 자연스럽게 체중을 측정하여
                           따로 번거롭게 몸무게를 잴 필요가 없습니다. <br>매일매일 측정한 몸무게의 값을 토대로 몸무게 <br>그래프를
                           확인할 수 있어 반려견이 얼마나 건강하게 <br> 다이어트를 할 수 있는지 알 수 있습니다.
                        </p>
                     </div>

                  </div>
                  <!-- end bgrid -->

                  <div class="bgrid service-item animate-this">

                     <span class="icon">
                        <!-- <i class="icon-lego-block"></i> --> <img
                        src="../resources/css/icon/necklace.png" alt="necklace">
                     </span>

                     <div class="service-content">
                        <h3 class="h05">강아지 인식 목걸이</h3>

                        <p>
                           한가정내에 여러마리 강아지를 키울경우 작은 목걸이를 <br>채워주면 강아지가 같은 배변패드에 올라가도
                           자동으로<br> 강아지를 인식하여 몸무게를 분리하여 측정 <br> 할 수 있도록 하는 목걸이
                           입니다.
                        </p>
                     </div>

                  </div>
                  <!-- end bgrid -->

                  <div class="bgrid service-item animate-this">

                     <span class="icon"> <img
                        src="../resources/css/icon/dog.png" alt="dogs">
                     </span>

                     <div class="service-content">
                        <h3 class="h05">산책</h3>

                        <p>
                           반려견의 산책시간, 산책거리, 산책경로를 자동의 측정을 해주어 권장하는 산책하는량을 도달하면 그에 맞는 적절한
                           배식을 하고, 미흡하면 사료를 소모한 칼로리에 맞게<br> 감소하여 배식을 합니다.
                        </p>
                     </div>

                  </div>
                  <!-- end bgrid -->

               </div>
               <!-- end services-list -->

            </div>
            <!-- end services-content -->

         </section>
         <!-- end services -->

      </c:when>
   </c:choose>
   <!-- portfolio
   ================================================== -->

   <c:choose>
      <c:when test="${check == null}">
         <section id="portfolio" style="display: none;">

            <div class="intro-wrap">

               <div class="row narrow section-intro with-bottom-sep animate-this">
                  <div class="col-twelve">
                     <h3>Showcase</h3>
                     <h1>VANDA의 커뮤니티</h1>

                     <p class="lead">
                        커뮤니티는 Before&After, 홈트레이닝, 공식정보 3가지가 있으며 <br> Before&After는
                        반려견의 다이어트 전후 사진을 사용자들이 올리고<br> 정보를 공유할 수 있게합니다.<br>
                        홈트레이닝는 반려견과 집에서 할 수 있는 놀이 영상을 VANDA에서 제공 합니다. <br>공식정보는
                        견주로써 강아지에 대해 알아야할 정보를 알 수 있습니다.
                     </p>
                  </div>
               </div>
               <!-- end row section-intro -->

            </div>
            <!-- end intro-wrap -->

            <div class="row portfolio-content">
               <div class="col-twelve">
                  <div id="folio-wrap" class="bricks-wrapper">

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-shutterbug.jpg"
                           data-sub-html="#01">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/shutterbug.jpg"
                              alt="Skaterboy">
                              <div class="item-text">
                                 <span class="folio-types"> 멍멍아 놀자 </span>
                                 <h3 class="folio-title">멍멍</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="01" class='hide'>
                           <h4>오늘 사진찍었어요</h4>
                           <p>
                              너무 귀엽죠 내똥강아지 사랑스럽지요 세상사람들이 귀여운거 다알았음 좋겠당 *^.^*</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-yellowwall.jpg"
                           data-sub-html="#02">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/yellowwall.jpg"
                              alt="Shutterbug">
                              <div class="item-text">
                                 <span class="folio-types"> 강아지랑 놀이활동 할사람 </span>
                                 <h3 class="folio-title">실내놀이 영상</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="02" class='hide'>
                           <h4>강아지랑 놀이활동 할사람</h4>
                           <p>
                              <!-- Lorem ipsum Dolor deserunt labore sint officia. Magna et aute enim proident tempor sunt quis nulla voluptate fugiat velit. <a href="https://www.behance.net/">Details -->
                              비오는날 산책은 힘드니 강아지랑 실내놀이 어때요~?</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-dog1.jpg"
                           data-sub-html="#03">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/architecture.jpg"
                              alt="Explore">
                              <div class="item-text">
                                 <span class="folio-types"> 반려견이랑 함께 떠나는 여행 </span>
                                 <h3 class="folio-title">멍멍아 야옹해봐</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="03" class='hide'>
                           <h4>Architecture</h4>
                           <p>
                              <a>오늘만은 분위기에 취하고싶어 하는것같은 우리 또또 넘나 사랑스러워~^^ </a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-minimalismo.jpg"
                           data-sub-html="#04">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/minimalismo.jpg"
                              alt="Minimalismo">
                              <div class="item-text">
                                 <span class="folio-types"> 호기심이 많은 강아지 </span>
                                 <h3 class="folio-title">멍멍멍멍</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="04" class='hide'>
                           <h4>호기심이 많은 강아지</h4>
                           <p>
                              카메라를 새로 샀는데 두호가 뭔지 궁금해서 다가오길래 바로 찍어버린 이사진! 귀여워 증.말 <a
                                 href="https://www.behance.net/">Details</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-skaterboy.jpg"
                           data-sub-html="#05">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/skaterboy.jpg" alt="Bicycle">
                              <div class="item-text">
                                 <span class="folio-types"> 왕눈이 너무 귀여워 </span>
                                 <h3 class="folio-title">엉아 지금뭐해?</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="05" class='hide'>
                           <h4>엉아 지금뭐해?</h4>
                           <p>
                              갸우뚱하는 우리 왕눈이 좀 봐요 진짜 미친다 진짜.. 나미쳐 왕눈이 너무 귀엽잖아 나 미쳐 </a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                     <div class="brick folio-item">
                        <div class="item-wrap animate-this"
                           data-src="/resources/images/portfolio/gallery/g-salad.jpg"
                           data-sub-html="#06">
                           <a href="#" class="overlay"> <img
                              src="/resources/images/portfolio/salad.jpg" alt="Salad">
                              <div class="item-text">
                                 <span class="folio-types"> 공식정보 </span>
                                 <h3 class="folio-title">강아지와 고양이가 친구가 될 수 있다고?</h3>
                              </div>
                           </a> <a href="https://www.behance.net/" class='details-link'
                              title="details"> <i class="icon-link"></i>
                           </a>
                        </div>
                        <!-- end item-wrap -->

                        <div id="06" class='hide'>
                           <h4>공식정보</h4>
                           <p>
                              강아지와 고양이가 친구가 될 수 있는거 아시나요?</a>
                           </p>
                        </div>
                     </div>
                     <!-- end folio-item -->

                  </div>
                  <!-- end folio-wrap -->
               </div>
               <!-- end twelve -->
            </div>
            <!-- end portfolio-content -->

         </section>
         <!-- end portfolio -->
      </c:when>
   </c:choose>

   <!-- Testimonials Section
   ================================================== -->
   <c:choose>
      <c:when test="${check == null}">
         <section id="testimonials">

            <div class="row">
               <div class="col-twelve">
                  <h2 class="animate-this">Reviews of VANDA.</h2>
               </div>
            </div>

            <div class="row flex-container">

               <div id="testimonial-slider" class="flex-slider animate-this">

                  <ul class="slides">

                     <li>
                        <p>
                           학생인지라 우리집 루이한테 관심을 주기도 힘들었고, 혼자 집에서 밥은 잘먹고 하는지 걱정히 많았는데 자동으로
                           배식을 해주고<br> 얼마나 먹었는지 실시간으로 알 수 있어서 그점이 너무 좋았던것 <br>
                           같아요. 그리고 밥을 따로 챙겨주지 않아도 자동 배식이 되어서<br>굶을 일이 없어서 좋았습니다. <br>가장
                           중요한건 우리 루이가 세상에 2kg이나 빠져버렸지 뭐예요? <br>이게 다 VANDA의 배식기, 체중계
                           덕분이예요! <br>우리 루이 건강 챙겨줘서 감사해요!
                        </p>

                        <div class="testimonial-author">
                           <img src="/resources/images/avatars/hanseul.jpg"
                              alt="Author image">
                           <div class="author-info">
                              강아지멍멍 <span class="position">치와와견주</span>
                           </div>
                        </div>
                     </li>
                     <!-- end slide -->

                     <li>
                        <p>
                           한 가족 4명에서 두호를 키우는데,<br> 밥을 안 챙겨준 줄 알고 밥을 하루에 4번씩 준 적이 굉장히
                           많았어요. <br>그래서인지 우리 두호는 비만견이 되어있더라고요.<br>그래서 VANDA
                           서비스를 시작하게 되었는데 <br> 가장 좋았던 점은 2중 배식을 안 해줘서 너무 좋았어요!<br>
                           반려견주라면 정말 자동 배식기, 체중계 적극 추천합니다. <br>두호가 살이 빠지기 시작하더니 몸도
                           가벼워져서<br> 더 잘 뛰어다니는 모습이 너무 보기가 좋아요.<br> VANDA 정말
                           감사합니다!
                        </p>

                        <div class="testimonial-author">
                           <img src="/resources/images/avatars/user-03.jpg"
                              alt="Author image">
                           <div class="author-info">
                              두호는 귀여워 <span>푸들견주</span>
                           </div>
                        </div>
                     </li>
                     <!-- end slide -->

                  </ul>
                  <!-- end slides -->

               </div>
               <!-- end testimonial-slider -->

            </div>
            <!-- end flex-container -->

         </section>
         <!-- end testimonials -->

      </c:when>
   </c:choose>
   <!-- stats
   ================================================== -->

   <c:choose>
      <c:when test="${check == null}">
         <section id="clients">

            <div class="row animate-this">
               <div class="col-twelve">

                  <div class="client-lists owl-carousel">
                     <div>
                        <img src="/resources/images/clients/aws1.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/spring2.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/ajax1.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/android.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/arduino1.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/bootstrap.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/jquery1.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/kakaomap.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/oracle1.png" alt="">
                     </div>
                     <div>
                        <img src="/resources/images/clients/raspberrypi.png" alt="">
                     </div>

                  </div>

               </div>
               <!-- end col-twelve -->
            </div>
            <!-- end row -->

         </section>
         <!-- end clients -->
      </c:when>
   </c:choose>

   <!-- contact
   ================================================== -->
   <!-- <section id="contact">

      <div class="overlay"></div>

      <div class="row narrow section-intro with-bottom-sep animate-this">
         <div class="col-twelve">
            <h3>Contact</h3>
            <h1>Get In Touch.</h1>

            <p class="lead">Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.</p>
         </div> 
      </div> end section-intro

      <div class="row contact-content">

         <div class="col-seven tab-full animate-this">

            <h5>Send Us A Message</h5>

            form
            <form name="contactForm" id="contactForm" method="post">              

               <div class="form-field">
                   <input name="contactName" type="text" id="contactName" placeholder="Name" value="" minlength="2" required="">
               </div>

               <div class="row">
                    <div class="col-six tab-full">
                       <div class="form-field">
                          <input name="contactEmail" type="email" id="contactEmail" placeholder="Email" value="" required="">
                       </div>                        
                  </div>
                  <div class="col-six tab-full">               
                     <div class="form-field">
                        <input name="contactSubject" type="text" id="contactSubject" placeholder="Subject" value="">
                     </div>                          
                  </div>
               </div>
                                         
               <div class="form-field">
                    <textarea name="contactMessage" id="contactMessage" placeholder="message" rows="10" cols="50" required=""></textarea>
               </div> 

               <div class="form-field">
                  <button class="submitform">Submit</button>

                  <div id="submit-loader">
                     <div class="text-loader">Sending...</div>                             
                      <div class="s-loader">
                          <div class="bounce1"></div>
                          <div class="bounce2"></div>
                          <div class="bounce3"></div>
                     </div>
                  </div>
               </div>

            </form> end form

            contact-warning
            <div id="message-warning"></div> 

            contact-success
            <div id="message-success">
               <i class="fa fa-check"></i>Your message was sent, thank you!<br>
            </div>

         </div> end col-seven 

         <div class="col-four tab-full contact-info end animate-this">

            <h5>Contact Information</h5>

            <div class="cinfo">
               <h6>Where to Find Us</h6>
               <p>
                  1600 Amphitheatre Parkway<br>
                  Mountain View, CA<br>
                  94043 US
               </p>
            </div> end cinfo

            <div class="cinfo">
               <h6>Email Us At</h6>
               <p>
                  someone@infinitysite.com<br>
                  info@infinitysite.com              
               </p>
            </div> end cinfo

            <div class="cinfo">
               <h6>Call Us At</h6>
               <p>
                  Phone: (+63) 555 1212<br>
                  Mobile: (+63) 555 0100<br>
                    Fax: (+63) 555 0101
               </p>
            </div>

         </div> end cinfo 

      </div> end row contact-content
      
   </section> end contact
 -->

   <!-- footer
   ================================================== -->
   <c:choose>
      <c:when test="${check == null}">
         <footer>
            <div class="footer-main">

               <div class="row">

                  <div class="col-five tab-full footer-about">

                     <h4 class="h05">VANDA</h4>

                     <p>
                        vanda는 반려견 맞춤 서비스 <br>지금 당장 시작하세요.
                     </p>

                  </div>
                  <!-- end footer-about -->

                  <div class="col-three tab-full footer-social">

                     <h4 class="h05">Developer.</h4>

                     <ul class="list-links">
                        <li><a href="#">이성민</a></li>
                        <li><a href="#">김민식</a></li>
                        <li><a href="#">이주헌</a></li>
                        <li><a href="#">이한슬</a></li>
                        <li><a href="#">최원준</a></li>
                        <li><a href="#">홍승우</a></li>
                     </ul>

                  </div>
                  <!-- end footer-social -->

                  <div class="col-four tab-full footer-subscribe end">

                     <h4 class="h05">Get Notified.</h4>

                     <p>If there are any errors, please send an email to
                        zfrzfr731@naver.com</p>

                     <div class="subscribe-form">

                        <form id="mc-form" class="group" novalidate="true">

                           <input type="email" value="" name="dEmail" class="email"
                              id="mc-email" placeholder="type email" required="">

                           <!-- <input type="submit" name="subscribe" > -->
                           <button>
                              <i class="icon-mail"></i>
                           </button>

                           <label for="mc-email" class="subscribe-message"></label>

                        </form>

                     </div>

                  </div>
                  <!-- end footer-subscribe -->

               </div>
               <!-- end row -->

            </div>
            <!-- end footer-main -->

            <div class="footer-bottom">

               <div class="row">

                  <div class="col-twelve">
                     <div class="copyright">
                        <span>VANDA 2020.</span> <span>Design by<a> HansSeul</a></span>
                     </div>
                  </div>

               </div>

            </div>
            <!-- end footer-bottom -->

            <div id="go-top">
               <a class="smoothscroll" title="Back to Top" href="#top"> <i
                  class="fa fa-long-arrow-up" aria-hidden="true"></i>
               </a>
            </div>
         </footer>
      </c:when>
   </c:choose>


   <div id="preloader">
      <div id="loader"></div>
   </div>

   <!-- Java Script
   ================================================== -->
   <script src="/resources/js/jquery-2.1.3.min.js"></script>
   <script src="/resources/js/plugins.js"></script>
   <script src="/resources/js/main.js"></script>

</body>

</html>