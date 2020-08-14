<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Global</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="HTML5 website template">
<meta name="keywords" content="global, template, html, sass, jquery">
<meta name="author" content="Bucky Maler">
<link rel="stylesheet" href="/resources/assets/css/main.css">
<style>
#select_box {
   width: 200px;
   height: 60px;
   background: #ffe2a3a1;
   text-align: center;
   align: center;
   margin: 0 auto;
}

#select_box2 {
   background: #ffe2a3a1;
   font-size: 14px;
   color: #a97228;
   top: 13px;
   left: 12px;
   letter-spacing: 1px;
   width: 100%;
   height: 40px;
   min-height: 40px;
   line-height: 40px;
   padding: 0 10px;
   opacity: 0;
   filter: alpha(opacity = 0); /* IE 8 */
   align: center;
}

#pet_name {
   position: absolute;
   font-size: 14px;
   color: #a97228;
   top: 13px;
   left: 12px;
   background: #ffe2a3a1;
   align: center;
}
</style>
</head>
<script>
   function changePetList() {

      $.ajax({
         url : "/pet/selectedPet",
         type : "post",
         dataType : "json",
         data : {
            "pet_num" : $("#select_box option:selected").val()
         },
         success : function(data) {
            $("#eat").text(data.eat_gram);
            $("#weight").text(data.pet_weight);
/*             $("#reWeight").text(data.repet_weight);
            $("#reEat").text(data.reeat_gram);
            $("#reWalk").text(data.rewalk); */
            
         },
         error : function(request, status, error) {
            alert("code = " + request.status + " message = "
                  + request.responseText + " error = " + error);
            // 실패 시 처리
         }

      })

   }

   function changePetListWalk() {

      $.ajax({
         url : "/pet/selectedPetWalk",
         type : "post",
         dataType : "json",
         data : {
            "pet_num" : $("#select_box option:selected").val()
         },
         success : function(data) {
            var str = "";
            
            for(var i = 0;i<data.length;i++){      
               str += "<a href='#0'><h3 data-actNum='" + data[i].act_num + "'>"+data[i].timer+"</h3></a>";

            } 
      
            $(".about--options").html(str);
         },
         error : function(request, status, error) {
            alert("code = " + request.status + " message = "
                  + request.responseText + " error = " + error);
            // 실패 시 처리
         }

      })

   }
</script>
<style>
</style>
<body>


   <!-- notification for small viewports and landscape oriented smartphones -->
   <!-- <div class="device-notification">
  <a class="device-notification--logo" href="#0">
    <img src="/resources/assets/img/logo.png" alt="Global">
    <p>Global</p>
  </a>
  <p class="device-notification--message">Global has so much to offer that we must request you orient your device to portrait or find a larger screen. You won't be disappointed.</p>
</div> -->


   <div class="perspective effect-rotate-left">
      <div class="container">
         <div class="outer-nav--return"></div>
         <div id="viewport" class="l-viewport">
            <div class="l-wrapper">
               <!--     <header class="header">
          <a class="header--logo" href="#0">
            <img src="/resources/assets/img/logo.png" alt="Global">
            <p>Global</p>
          </a>
          <button class="header--cta cta">Hire Us</button>
          <div class="header--nav-toggle">
            <span></span>
          </div>
        </header> -->
               <nav class="l-side-nav">
                  <ul class="side-nav">
                     <li class="is-active"><span>Home</span></li>
                     <li><span>Details</span></li>
                     <li><span>Walk</span></li>
                     <li><span>Consulting</span></li>
                     <!-- <li><span>Hire us</span></li> -->
                  </ul>
               </nav>
               <ul class="l-main-content main-content">
                  <li class="l-section section section--is-active">
                     <div class="intro">
                        <div class="intro--banner">
                           <h1>
                              Detail<br>view<br>of my dog
                           </h1>

                           <button class="cta">
                              Hire Us
                              <svg version="1.1" id="Layer_1"
                                 xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 viewBox="0 0 150 118"
                                 style="enable-background: new 0 0 150 118;"
                                 xml:space="preserve">
                  <g
                                    transform="translate(0.000000,118.000000) scale(0.100000,-0.100000)">
                    <path
                                    d="M870,1167c-34-17-55-57-46-90c3-15,81-100,194-211l187-185l-565-1c-431,0-571-3-590-13c-55-28-64-94-18-137c21-20,33-20,597-20h575l-192-193C800,103,794,94,849,39c20-20,39-29,61-29c28,0,63,30,298,262c147,144,272,271,279,282c30,51,23,60-219,304C947,1180,926,1196,870,1167z" />
                  </g>
                  </svg>
                              <span class="btn-background"></span>
                           </button>
                           <img src="/resources/assets/img/dog.png" alt="Welcome">
                        </div>
                        <div class="intro--options">
                           <a href="#0">
                              <h3>Shopping</h3>
                              <p>VANDA만의 고유한 IOT장비와 각각의 반려견의 사료를 추천 받고 싶다면</p>
                           </a> <a href="#0">
                              <h3>Fantasy interactive</h3>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                 elit sed do.</p>
                           </a> <a href="#0">
                              <h3>Paul &amp; shark</h3>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                                 elit sed do.</p>
                           </a>
                        </div>
                     </div>
                  </li>
                  <li class="l-section section">
                     <div class="work">

                        <br>
                        <!-- 강아지 이름 슬라이드  -->
                        <select id="select_box" onchange="changePetList(),changePetListWalk()">
      
                           <c:forEach var="pet" items="${pet}" varStatus="status">
                              <option id="pet_name" value="${pet.pet_num}">${pet.pet_name}</option>
                              <br>
                           </c:forEach>
                        </select>


                        <!-- 강아지 상세정보 구현 -->

                        <div class="work--lockup">
                           <ul class="slider">
                              <li class="slider--item slider--item-left"><a href="#0">
                                    <div class="slider--item-image">
                                       <!-- <img src="/resources/assets/img/work-victory.jpg" alt="Victory"> -->
                                       <p style="line-height: 30px">체중</p>

                                       <p style="font-size: 40px;" id="weight">${nonSelectedPet.pet_weight}</p>
                                       <p style="font-size: 20px; color: #8C8C8C">/</p>
                                       <p style="font-size: 20px; color: #8C8C8C" id="reWeight">권장체중</p>


                                       
                                    </div> <!--  <p class="slider--item-title">Victory</p>
                      <p class="slider--item-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do.</p> -->
                              </a></li>
                              
                              
                              
                              
                              <li class="slider--item slider--item-center"><a href="#0">
                                    <div class="slider--item-image">
                                       <!--  <img src="/resources/assets/img/work-metiew-smith.jpg" alt="Metiew and Smith"> -->
                                       <p style="line-height: 30px;color:#858585">배식</p>
                                       <p style="font-size: 40px;color:#858585" id="eat">${nonSelectedPet.eat_gram}kg</p>

										   <p style="font-size: 20px; color: #8C8C8C">/</p>
                                       <p style="font-size: 20px; color: #8C8C8C" id="reEat">권장급여량</p>
                                    </div> <!--    <p class="slider--item-title">Metiew &amp; Smith</p>
                      <p class="slider--item-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit sed do.</p> -->
                              </a></li>
                              
                              
                              
                              
                              
                              <li class="slider--item slider--item-right"><a href="#0">
                              
                              
                                    <div class="slider--item-image">
                                       <!-- <img src="/resources/assets/img/work-alex-nowak.jpg" alt="Alex Nowak"> -->
                                       <p style="line-height: 30px;color:#858585">활동</p>
                                       <p style="font-size: 40px;color:#858585" id="walk">${nonSelectedPet.eat_gram}kg</p>

										   <p style="font-size: 20px; color: #8C8C8C">/</p>
                                       <p style="font-size: 20px; color: #8C8C8C" id="reWalk">권장활동량</p>
                                    </div> 
                                    
                                    
                              </a>
                              </li>
                           </ul>
                         
                           <div class="slider--prev">
                              <svg version="1.1" id="Layer_1"
                                 xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 viewBox="0 0 150 118"
                                 style="enable-background: new 0 0 150 118;"
                                 xml:space="preserve">
                  <g
                                    transform="translate(0.000000,118.000000) scale(0.100000,-0.100000)">
                    <path
                                    d="M561,1169C525,1155,10,640,3,612c-3-13,1-36,8-52c8-15,134-145,281-289C527,41,562,10,590,10c22,0,41,9,61,29
                    c55,55,49,64-163,278L296,510h575c564,0,576,0,597,20c46,43,37,109-18,137c-19,10-159,13-590,13l-565,1l182,180
                    c101,99,187,188,193,199c16,30,12,57-12,84C631,1174,595,1183,561,1169z" />
                  </g>
                  </svg>
                           </div>
                           <div class="slider--next">
                              <svg version="1.1" id="Layer_1"
                                 xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 viewBox="0 0 150 118"
                                 style="enable-background: new 0 0 150 118;"
                                 xml:space="preserve">
                  <g
                                    transform="translate(0.000000,118.000000) scale(0.100000,-0.100000)">
                    <path
                                    d="M870,1167c-34-17-55-57-46-90c3-15,81-100,194-211l187-185l-565-1c-431,0-571-3-590-13c-55-28-64-94-18-137c21-20,33-20,597-20h575l-192-193C800,103,794,94,849,39c20-20,39-29,61-29c28,0,63,30,298,262c147,144,272,271,279,282c30,51,23,60-219,304C947,1180,926,1196,870,1167z" />
                  </g>
                  </svg>
                           </div>
                        </div>
                     </div>
                  </li>
                  
               <!-- 산책 리스트  -->
                  <li class="l-section section">
                     <div class="about">
                        <div class="about--banner">
                           <h2>
                              We<br>believe in<br>passionate<br>people
                           </h2>
                           <a href="#0">Career <span>
                              <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                          viewBox="0 0 150 118" style="enable-background: new 0 0 150 118;" xml:space="preserve">
                                      <g transform="translate(0.000000,118.000000) scale(0.100000,-0.100000)">
                                           <path d="M870,1167c-34-17-55-57-46-90c3-15,81-100,194-211l187-185l-565-1c-431,0-571-3-590-13c-55-28-64-94-18-137c21-20,33-20,597-20h575l-192-193C800,103,794,94,849,39c20-20,39-29,61-29c28,0,63,30,298,262c147,144,272,271,279,282c30,51,23,60-219,304C947,1180,926,1196,870,1167z" />
                                      </g>
                                   </svg>
                           </span>
                           </a> <img src="/resources/assets/img/about-visual.png" alt="About Us">
                        </div>
                        <div class="about--options">
                           <%-- <c:forEach items="${actList}" var="actList">
                              <a href="#0"><h3><c:out value="${actList.total_distance}" /></h3></a>
                           </c:forEach> --%>
                           <!-- <a href="#0">
                              <h3>Winners</h3>
                           </a> <a href="#0">
                              <h3>Philosophy</h3>
                           </a> <a href="#0">
                              <h3>History</h3>
                           </a> -->   
                        </div>
                     </div>
                  </li>
                  <li class="l-section section">
                     <div class="contact">
                        <div class="contact--lockup">
                           <div class="modal">
                              <div class="modal--information">
                                 <p>Pawia 5, 31-154 Kraków, Poland</p>
                                 <a href="mailto:ouremail@gmail.com">ouremail@gmail.com</a> <a
                                    href="tel:+148126287560">+48 12 628 75 60</a>
                              </div>
                              <ul class="modal--options">
                                 <li><a href="#0">Bēhance</a></li>
                                 <li><a href="#0">dribbble</a></li>
                                 <li><a href="mailto:ouremail@gmail.com">Contact Us</a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </li>
                  <li class="l-section section">
                     <div class="hire">
                        <!--  <h2>You want us to do</h2> -->
                        <!-- checkout formspree.io for easy form setup -->
                        <!-- <form class="work-request">
                <div class="work-request--options">
                  <span class="options-a">
                    <input id="opt-1" type="checkbox" value="app design">
                    <label for="opt-1">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      App Design
                    </label>
                    <input id="opt-2" type="checkbox" value="graphic design">
                    <label for="opt-2">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      Graphic Design
                    </label>
                    <input id="opt-3" type="checkbox" value="motion design">
                    <label for="opt-3">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      Motion Design
                    </label>
                  </span>
                  <span class="options-b">
                    <input id="opt-4" type="checkbox" value="ux design">
                    <label for="opt-4">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      UX Design
                    </label>
                    <input id="opt-5" type="checkbox" value="webdesign">
                    <label for="opt-5">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      Webdesign
                    </label>
                    <input id="opt-6" type="checkbox" value="marketing">
                    <label for="opt-6">
                      <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 150 111" style="enable-background:new 0 0 150 111;" xml:space="preserve">
                      <g transform="translate(0.000000,111.000000) scale(0.100000,-0.100000)">
                        <path d="M950,705L555,310L360,505C253,612,160,700,155,700c-6,0-44-34-85-75l-75-75l278-278L550-5l475,475c261,261,475,480,475,485c0,13-132,145-145,145C1349,1100,1167,922,950,705z"/>
                      </g>
                      </svg>
                      Marketing
                    </label>
                  </span>
                </div>
                <div class="work-request--information">
                  <div class="information-name">
                    <input id="name" type="text" spellcheck="false">
                    <label for="name">Name</label>
                  </div>
                  <div class="information-email">
                    <input id="email" type="email" spellcheck="false">
                    <label for="email">Email</label>
                  </div>
                </div>
                <input type="submit" value="Send Request">
              </form> -->
                     </div>
                  </li>
               </ul>
            </div>
         </div>
         s
      </div>
      <ul class="outer-nav">
         <li class="is-active">Home</li>
         <li>Details</li>
         <li>About</li>
         <li>Contact</li>
         <li>Hire us</li>
      </ul>
   </div>

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
   <script>
      window.jQuery
            || document
                  .write('<script src="/resources/assets/js/vendor/jquery-2.2.4.min.js"><\/script>')
   </script>
   <script src="/resources/assets/js/functions-min.js"></script>

</body>
</html>