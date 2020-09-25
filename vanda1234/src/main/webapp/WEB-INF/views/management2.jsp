<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>반다 : 반려견 다이어트</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">
    
    <!-- Noto Sans 글씨체 -->
    <link href="https://fonts.googleapis.csom/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <!-- 부트 스크립트 필수 링크 및 스크립트 -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
     <link href="/resources/css/styles2.css" rel="stylesheet" /> 
   
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
   <!-- jQuery 필수 스크립트 -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
     <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script> 
   <!-- slider 필수 스크립트  -->
   <link rel="stylesheet" href="/resources/slick/slick.css">
   <link rel="stylesheet" href="/resources/slick/slick-theme.css">
   <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
   <script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


   <meta name="theme-color" content="#563d7c">
   
   <style>
      
      body {
         font-family: 'Noto Sans KR', sans-serif;
      }
      
      nav a{
         
            color : #d4d4d4;
            font-size : 14px;
         }
      
         nav a:hover {
            text-decoration:none;
            color : #eeeeee;
         }
      
      #weight{
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
      #eat{
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
      #activity{
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
         .modal{
            height : 45%
      }
      
/* 지도 css */
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:800px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
.custom_typecontrol .selected_btn:hover {color:#fff;}   
.custom_zoomcontrol {position:absolute;top:50px;right:800px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
  .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;} 
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    /* 수의사 선택화면 스타일 */
   
#mask {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 999;
    background-color: #000000;
    display: none; }
.layerpop {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }
.layerpop_area .title {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #3eb0ce;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }
.layerpop_area .layerpop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent url('btn_exit_off.png') no-repeat; }
.layerpop_area .layerpop_close:hover {
    background: transparent url('btn_exit_on.png') no-repeat;
    cursor: pointer; }
.layerpop_area .content {
    width: 96%;    
    margin: 2%;
    color: #828282; }
    
    /* --------------------------------------------- */
    
    /* 채팅창 스타일 */
       
.layerpop2 {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }
.layerpop_area2 .title {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #3eb0ce;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }
.layerpop_area2 .layerpop_close2 {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    background: transparent url('btn_exit_off.png') no-repeat; }
.layerpop_area2 .layerpop_close2:hover {
    background: transparent url('btn_exit_on.png') no-repeat;
    cursor: pointer; }
.layerpop_area2 .content2 {
    width: 96%;    
    margin: 2%;
    color: #828282; }
    
    
    
       /* 체중차트창 스타일 */
       
.weightpop {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }
.weightpop_area .weightTitle {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #3eb0ce;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }
.weightpop_area .weightpop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    }
.weightpop_area .weightpop_close:hover {
    cursor: pointer; }
.weightpop_area .weightContent {
    width: 100%;
    height : 100%;    
    /* margin: 2%; */
    color: #828282; }
    
      
    /* 활동차트창 스타일 */     
.activitypop {
    display: none;
    z-index: 1000;
    border: 2px solid #ccc;
    background: #fff;
    cursor: move; }
.activitypop_area .activityTitle {
    padding: 10px 10px 10px 10px;
    border: 0px solid #aaaaaa;
    background: #f1f1f1;
    color: #3eb0ce;
    font-size: 1.3em;
    font-weight: bold;
    line-height: 24px; }
.activitypop_area .activitypop_close {
    width: 25px;
    height: 25px;
    display: block;
    position: absolute;
    top: 10px;
    right: 10px;
    }
.activitypop_area .activitypop_close:hover {
    cursor: pointer; }
.activitypop_area .activityContent {
    width: 100%;
    height : 100%;    
    /* margin: 2%; */
    color: #828282; }
    
    
    </style>
    
    <script>
       $(document).ready(function(){
          


			
          $('.multiple-items').slick({
               /* infinite: true, //양방향 무한 모션
               speed:300, // 슬라이드 스피드
               slidesToShow: 3, //한 화면에 보여줄 아이템수
               slidesToScroll: 3, // 한번에 슬라이드 시킬 아이템 개수
               arrows: true //좌우 화살 버튼 노출 여부 ( false 시 안보임 ) */
             infinite: true,
             slidesToShow: 3,
             slidesToScroll: 3
          });           
      });
       
       /* 체중 스크립트 */
       function weightChartOpen() {
           $('.weightpop').css("position", "absolute");
           //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
           $('.weightpop').css("top",(($(window).height() - $('.weightpop').outerHeight()) / 2 +15) + $(window).scrollTop());
           $('.weightpop').css("left",(($(window).width() - $('.weightpop').outerWidth()) / 2) + $(window).scrollLeft());
           $('.weightpop').draggable();
           $('#weightbox').show();
       }
       function weightClose() {
           $('#weightbox').hide();
           
       }
       function weightChart() {
          weightChartOpen(); //레이어 팝업창 오픈 
           }
       /* 활동차트 스크립트 */
       
           function activityClose() {
           $('#activitybox').hide();
           
       }
       function activityChart() {
          activityChartOpen(); //레이어 팝업창 오픈 
            }
       
       function activityChartOpen() {
           $('.activitypop').css("position", "absolute");
           //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
           $('.activitypop').css("top",(($(window).height() - $('.activitypop').outerHeight()) / 2 ) + $(window).scrollTop());
           $('.activitypop').css("left",(($(window).width() - $('.activitypop').outerWidth()) / 2) + $(window).scrollLeft());
           $('.activitypop').draggable();
           $('#activitybox').show();
       }
       function chartOpen(petNum){
          
           var chartLabels = [];
           var chartData = [];
           var chartLabels1 = [];
           var chartData1 = [];
           
           Chart.defaults.global.legend.display = false;
        
              $.ajax({
                 url : "/getPetnum",
                 type : "post",
                 dataType : "json",
                 data : {
                    "pet_num" : petNum
                 },
                 success : function(data) {
                    $.getJSON("http://localhost:8080/chartList",
                          function(data) {
                             $.each(data, function(inx, obj) {
                                chartLabels.push(obj.weight_date);
                                chartData.push(obj.pet_weight);
                             });
                             
                             createChart();
                             console.log("create Chart")
                             
                             
                             
                          });
                    var lineChartData = {
                       type : 'line',
                       labels : chartLabels,
                       datasets : [ {
                          label : "Weight",
                          pointBorderColor : "rgba(0,0,0,1)",
                          borderColor : "rgba(0, 0, 0, 0.5)",
                          backgroundColor : [ 'rgba(255, 255, 255, 0)' ],
                          borderWidth : 3,
                          data : chartData,
                          options : {
                          }
                       } ]
                    }
                    
                    function createChart() {
                       var ctx = document.getElementById("canvas").getContext("2d");
                    
                       LineChartDemo = Chart.Line(ctx, {
                          data : lineChartData,
                          options : {
                             scales : {
                                yAxes : [ {
                                   ticks : {
                                      beginAtZero : true
                                   }
                                } ]
                             },
                             legend : {
                                display : false
                             },
                             tooltips : {
                                callbacks : {
                                   label : function(tooltipItem) {
                                      return tooltipItem.yLabel;
                                   }
                                }
                             }
                          }
                       })
                    }
                    
                    $.getJSON("http://localhost:8080/activityList",
                            function(data) {
                               $.each(data, function(inx, obj) {
                                  chartLabels1.push(obj.act_date);
                                  chartData1.push(obj.total_distance);
                               });
                               createChart1();
                               console.log("create Chart")
                            });
                      var lineChartData1 = {
                         type : 'line',
                         labels : chartLabels1,
                         datasets : [ {
                            label : "distance",
                            pointBorderColor : "rgba(0,0,0,1)",
                            borderColor : "rgba(0, 0, 0, 0.5)",
                            backgroundColor : [ 'rgba(255, 255, 255, 0)' ],
                            borderWidth : 3,
                            data : chartData1,
                            options : {
                            }
                         } ]
                      }
                      function createChart1() {
                         var ctx = document.getElementById("canvas1").getContext(
                               "2d");
                         LineChartDemo = Chart.Line(ctx, {
                            data : lineChartData1,
                            options : {
                               scales : {
                                  yAxes : [ {
                                     ticks : {
                                        beginAtZero : true
                                     }
                                  } ]
                               },
                               legend : {
                                  display : false
                               },
                               tooltips : {
                                  callbacks : {
                                     label : function(tooltipItem) {
                                        return tooltipItem.yLabel;
                                        }
                                     }
                                  }
                               }
                            })
                         }
           
           
                 },
                 error : function(request, status, error) {
                    alert("code = " + request.status + " message = "
                          + request.responseText + " error = "
                          + error);
                    // 실패 시 처리
                 }
              })
          
          
          
          }

		function setPetimg(petNum) {
			
      		$.getJSON("/pet/getImgList", {petNum: petNum}, function(arr){
    			console.log(arr);

    			var str ="";

    			$(arr).each(function(i, attach){

    				//image type
    				if(attach.fileType){
    			           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
    			           
    			            str += "<div><img src='/display?fileName="+fileCallPath+"'>";
    			           str += "</div>";
    			          
    			         }else{
    			             
    			           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
    			           str += "<span> "+ attach.fileName+"</span><br/>";
    			           str += "<img src='/resources/img/picture.png'></a>";
    			           str += "</div>";
    			           str +"</li>";
    			         }
    			       });
    		       $("#abcd").html(str);
    			}); 
			
			}
       
       function changePetList(petNum) {




      	    
    	      $.ajax({
    	         url : "/pet/selectedPet",
    	         type : "post",
    	         dataType : "json",
    	         data : {
    	            "pet_num" : petNum
    	            
    	         },
    	         success : function(data) {

    	 			

    		
    	           
    	             $("#weightValue").text(data.pet_weight+"kg");   // 현재 펫 몸무게
    	             $("#gramValue").text(data.eat_gram+"g");   // 현재 펫 배식량
    	             $("#distanceValue").text(data.total_distance+"kcal");   // 현재 펫 활동량
    	             $("#avg").text("/"+data.avg+"kg");   // 권장 펫 몸무게
    	             $("#gram").text("/"+data.gram+"g");   // 권장 펫 배식량
    	             $("#recomand_distance").text("/"+data.recomand_distance+"kcal");   // 권장 펫 활동량


    	          /*  $("#eat").text(data.eat_gram);   // 현재 배식량 
    	            $("#weightValue").text(data.pet_weight+"kg");   // 현재 펫 몸무게
    	           $("#avg").text(data.avg);   //추천 몸무게
    	            $("#gram").text(data.gram);   //추천 배식량
    	            $("#walk").text(data.total_distance);   //현재 활동량
    	            $("#recomand_distance").text(data.recomand_distance); //추천 활동량 
    	            */
    	            /* if(data.eat_gram == 0){
    	               alert("금일 측정된 데이터가 존재하지않습니다.");
    	                return;
    	                }*/
    	            
    	         },
    	         error : function(request, status, error) {
    	            /* alert("code = " + request.status + " message = "
    	                  + request.responseText + " error = " + error); */
    	                  alert("금일 측정된 데이터가 존재하지않습니다.");
    	                  $("#weightValue").text(0+"kg");   // 현재 펫 몸무게
    	                  $("#gramValue").text(0+"g");   // 현재 펫 배식량
    	                  $("#distanceValue").text(0+"kcal");   // 현재 펫 활동량
    	                  $("#avg").text("/"+0+"kg");   // 권장 펫 몸무게
    	                  $("#gram").text("/"+0+"g");   // 권장 펫 배식량
    	                  $("#recomand_distance").text("/"+0+"kcal");   // 권장 펫 활동량
    	                  
    	                  return;
    	            // 실패 시 처리
    	         }

    	      })

    	   }
       function walkList(petNum) {
           var arrData = [];
           $('.multiple-items').slick('slickRemove', null, null, true);
           $.ajax({
              url: "/pet/walksList",
              type: "post",
              dataType: "json",
              data : {
                 "pet_num" : petNum,
              }, success : function(data) {
                 
                 var str = "";
                    var idx = 0;
                    $.each(data, function( index, value ) {
                       arrData[index] = data[index];
                       var leng = arrData[index].walks.length;
                       
                       $('.multiple-items').slick('slickAdd',"<div class='card' style='width: 18rem;'><div class='map' id='walk" + index + "' index style='width:100%; height:300px;'></div><div class='card-body'><p class='card-text'><h5>"+arrData[index].walks[leng-1].date+"</h5>"+arrData[index].walks[leng-1].total+"m"+"<br>"+arrData[index].walks[leng-1].timer+"</p></div></div>");
                       //$('.multiple-items').slick('slickAdd',"<div>ㅎㅇ</div>");
                       
                        //console.log(index + " : " + data[index].walks);
                        var leng = arrData[index].walks.length;
                        console.log(arrData[index].walks[leng-1].timer);
                        //console.log(arrData[index].walks[arrData[i].walks.lenn].total);
                        
                    });
                    for(var i = 0; i<arrData.length;i++){
                        var path = [];
                       var mapOptin = {
                                center : new kakao.maps.LatLng(arrData[i].walks[0].lat, arrData[i].walks[0].lon), // 지도의 중심좌표
                                level:3
                            }
                        var container = document.getElementById('walk'+i);
                        // 폴리 라인
                        for(var j = 0;j<arrData[i].walks.length;j++){
                            path[j] = new kakao.maps.LatLng(arrData[i].walks[j].lat, arrData[i].walks[j].lon);
                           
                        }
                       var map = new kakao.maps.Map(container, mapOptin);
                    var polyline = new kakao.maps.Polyline({
                          map: map,
                          path: path,
                          strokeWeight: 2, // 두께
                          strokeColor: '#FF00FF',//색
                          strokeOpacity: 0.8 // 투명도
                    });
                    }
                   
                 },
                 error : function(request, status, error) {
                    alert("code = " + request.status + " message = "
                          + request.responseText + " error = " + error);
                    // 실패 시 처리
                 }            
           });
        }

       

       </script>
       


  </head>
  <body>
    <header>
       <%@include file="./navBar.jsp" %>       
   </header>
   
  <!-- =========================================================================================-->
  <main role="main">
  
  <!-- 탭 기능 -->
  <div class="container marketing" >
     <ul class="nav nav-tabs" style="margin-top:30px;">
     <li class="nav-item">
       <a class="nav-link active" data-toggle="tab" href="#management">매니지먼트</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" data-toggle="tab" href="#consult">상담</a>
     </li>
   </ul>
   
   <div class="tab-content" style="margin-top:10px;">
     <div class="tab-pane fade show active" id="management">
       <div class="row" >
          
          <!-- 비만 매니지먼트  -->
          
          <c:forEach var="pet" items="${pet}" varStatus="status">
             <div class="col-lg-4" style="margin-bottom: 10px">
                <div class="card" style="width: 18rem;">
                 <div class="imgCard" style="height:300px;">
                 	<c:if test="${not empty pet.imgList}">
                 		<img style="height:300px; width:286px;" src="${pet.imgList[0].uploadPath}${pet.imgList[0].fileName}">
                 		<%-- <img class="${pet.imgList[0].fileName}"src="${pet.imgList[0].uploadPath}${pet.imgList[0].uuid}${pet.imgList[0].fileName}"> --%>
                 	</c:if>
                 </div>
                 <div class="card-body">
                   <h5 id="pet_name" value="${pet.pet_num}">이름 : ${pet.pet_name}</h5>
                   <p class="petValue" id="pet_age" value="${pet.pet_age}">나이 : ${pet.pet_age}살</p>
                   <p class="petValue" id="pet_sex" value="${pet.pet_sex}">성별 : ${pet.pet_sex}</p>
                   <button id ="select_box " onclick="changePetList(${pet.pet_num}),walkList(${pet.pet_num}),chartOpen(${pet.pet_num});"  class="btn btn-info">상세정보</button>
				
                 </div>
               </div>
             </div>
        </c:forEach>
        
		

          
       </div>
       
      <hr class="featurette-divider">
      
    
       
       <!-- 체중, 배식, 활동량 정보 -->
       <c:if test="${check.user_rule eq 'member'}">
       <div class="row">
         <div class="col-lg-4">
         <a href="javascript:weightChart()">
           <div id="weight">
                 <p style="line-height: 30px" >체중</p>
              <p id="weightValue" style="font-size:40px;">${nonSelectedPet.pet_weight}KG</p>
              <p style="font-size:20px; color:#8C8C8C" id = "avg">/${nonSelectedPet.avg}KG</p>
           </div>
          </a>
         </div><!-- /.col-lg-4 -->
         <div class="col-lg-4">
           <div id="eat">
               <p style="line-height: 30px">배식</p>
               <p id="gramValue"style="font-size:40px;">${nonSelectedPet.eat_gram}g</p>
               <p style="font-size:20px; color:#8C8C8C" id="gram">/${nonSelectedPet.gram}g</p>
           </div>
         </div><!-- /.col-lg-4 -->
         <div class="col-lg-4">
         <a href="javascript:activityChart()" >
           <div id="activity">
              <p style="line-height: 30px">활동</p>
              <p id="distanceValue"style="font-size:40px;"id ="walk">${nonSelectedPet.total_distance}Kcal</p>
              <p style="font-size:20px; color:#8C8C8C" id="recomand_distance">/${nonSelectedPet.recomand_distance}Kcal</p>
           </div>
           </a>
         </div>
       </div>
   </c:if>
       <hr class="featurette-divider">
       
       <!-- 산책  -->
       <div class="row">
          <div class="col-md-12">
             <div class="multiple-items">        
             </div>
      
         </div>
       </div>
       
     </div>
     
     
    <div class="tab-pane fade active" id="consult">
        <div class="row" >
        
           <div class="col-md-12">

            <div class="map_wrap">
            
            <div id="map2" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
            
              
                
                <div id="menu_wrap" class="bg_white">
            
                    <div class="option">
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                키워드 : <input type="text" value="복현 동물병원" id="keyword" size="15"> 
                                <button type="submit">검색하기</button> 
                            </form>
                        </div>
                    </div>
                    <hr>
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
         </div>
           
        </div>
     </div>
   </div>

    <hr class="featurette-divider">

    <!-- START THE FEATURETTES -->


    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->

<!-- 팝업 -->
 <!-- 팝업뜰때 배경 -->
    <div id="mask"></div>

    <!--수의사 선택화면 -->
    <div id="layerbox" class="layerpop"
        style="width: 700px; height: 350px;">
        <article class="layerpop_area">
        <div class="title">수의사 선택하기</div>
        <a href="javascript:popupClose();" class="layerpop_close"
            id="layerbox_close">X</a> <br>
        <div class="content">
   <div class="row" id="docArea">
         
      </div>
    <input type="hidden" id="user_id" name="user_id" value="${check.user_id }"/>
        </div>
        </article>
    </div>
         <!-- 상담 -->
        <div id="layerbox2" class="layerpop2"
        style="width: 1500px; height: 650px;">
        <article class="layerpop_area2">
        <div class="title">상담</div>
        <a href="javascript:chatClose();" class="layerpop_close2"
            id="layerbox_close2">X</a> <br>
        <div class="content2" >
   <div class="messaging">
  <div class="inbox_msg">
   <div class="inbox_people">
     <div class="headind_srch">
      <div class="recent_heading">
        <h4>상담 기록</h4>
      </div>
      <div class="srch_bar">
        <div class="stylish-input-group">
         <input type="text" class="search-bar"  placeholder="Search" >
         </div>
      </div>
     </div>
     <!-- 상담 내역 -->
     <div class="inbox_chat scroll" id="chatHistory">
   
     </div>
   </div>
   
   <!-- 메세지 내용  -->   
   <div class="mesgs">
     <div class="msg_history">
   
     </div>
     <div class="type_msg">
      <div class="input_msg_write">
        <input type="text" class="write_msg" placeholder="메세지를 입력하세요." />
        <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
      </div>
     </div>
   </div>
  </div>
</div>


    
        </div>
        </article>
    </div> 
    
    
    
        <!--체중 차트-->
    <div id="weightbox" class="weightpop"
        style="width: 700px; height: 450px;">
        <article class="weightpop_area">
        <div class="weightTitle">체중</div>
        <a href="javascript:weightClose();" class="weightpop_close"
            id="weightbox_close">X</a> <br>
        <div class="weightContent">

               <canvas id="canvas"></canvas>
   
       </div>
        </article>
    </div>
    
    <!--활동 차트-->
        <div id="activitybox" class="activitypop"
        style="width: 700px; height: 450px;">
        <article class="activitypop_area">
        <div class="activityTitle">활동</div>
        <a href="javascript:activityClose();" class="activitypop_close"
            id="activitybox_close">X</a> <br>
        <div class="activityContent">
               <canvas id="canvas1"></canvas>
       </div>
        </article>
    </div>
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="#">Back to top</a></p>
  </footer>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c08f314710cd5f7bdb6ccee17bbd24f&libraries=services"></script>

<script type="text/javascript">
//수의사가 상담 클릭시
function test() {
   var id = $('#user_id').val();
   startCon(id);
   
}
/* 채팅 스크립트 */
function chatOpen() {
    $('.layerpop2').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop2').css("top",(($(window).height() - $('.layerpop2').outerHeight()) / 2 +15) + $(window).scrollTop());
    $('.layerpop2').css("left",(($(window).width() - $('.layerpop2').outerWidth()) / 2) + $(window).scrollLeft());
    $('.layerpop2').draggable();
    $('#layerbox2').show();
}
function chatClose() {
    $('#layerbox2').hide();
}
function chatStart() {
   chatOpen(); //레이어 팝업창 오픈 
    }
var chat=[];
function startCon(docId){
   
   
   $.ajax({
      url : "/consulting/roomRegist",
      type : "post",
      dataType:"json",
      data : {
         "user_id" : $('#user_id').val(),
         "doc_id" : docId
      },
      success : function(data) {
         
         $.each(data, function(index,item){
            chat[index] = data[index];
               
            })
            const theTime = new Date(chat[0].room_date);
         for(var z=0; z<data.length; z++){
               var test = '<div class="chat_list" >'+
              '<div class="chat_people">'+
            '<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>'+
               '<div class="chat_ib">'+
               '<div><h5>'+chat[z].doc_id+' 수의사님과 상담<span class="chat_date"></span></h5>'+
                 '<p>'+theTime.toLocaleString()+'</p>'+
                 '<input type="hidden" id="roomNum" value='+chat[z].room_num+'></div>'+ 
               '</div></div></div>';
               
            $('#chatHistory').append(test);
         }
      popupClose();
      chatStart();
         
         
      },
      error : function(request, status, error) {
         alert("해당병원이 없습니다. 다시선택해주세요 !");
          alert("code = " + request.status + " message = "
               + request.responseText + " error = " + error); 
         // 실패 시 처리
      }
   })
   }
/* 팝업스크립트 */
function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = $(window).width();
    //문서영역의 크기 
    console.log( "document 사이즈:"+ $(document).width() + "*" + $(document).height()); 
    //브라우저에서 문서가 보여지는 영역의 크기
    console.log( "window 사이즈:"+ $(window).width() + "*" + $(window).height());        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });
    //애니메이션 효과
    //$('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow", 0.5);
}
function popupOpen() {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    $('.layerpop').draggable();
    $('#layerbox').show();
}
function popupClose() {
    $('#layerbox').hide();
    $('#mask').hide();
    $('.list-group-item').remove();
}
//예악하기 버튼 클릭시 클릭한 병원에해당하는 수의사를 가져오기위한 병원번호
var glb_hosp_tel;
var arr= [];
function goDetail() {
    var hosp_tel = glb_hosp_tel;
      
   
    /*팝업 오픈전 별도의 작업이 있을경우 구현*/ 
   /* 해당 병원에 해당하는 의사 보여줘야함.*/
             $.ajax({
            url : "/consulting/selectDoc",
            type : "post",
            dataType: "json",
            data : {
               "hosp_tel" : hosp_tel
            },
            success : function(data) {
               $.each(data, function(index,item){
                  arr[index] = data[index];
                     
                  })
            
                  for(var i=0; i<data.length; i++) {
                     var divHosp='<div class="col-md-12"><a href=javascript:startCon("'+arr[i].user_id+'"); class="list-group-item" style="float:left;width:450px;height:100px;"><img src='+ arr[i].dimg_name + ' style="width:100px;height:60px;"/>'+ arr[i].user_id +' 수의사님과 상담하기</a></div>'
                     
                     $('#docArea').append(divHosp);   
                     }
               
         
            
                popupOpen(); //수의사 선택화면 오픈 
                 wrapWindowByMask(); //화면 마스크 효과 
               
            },
            error : function(request, status, error) {
               alert("해당병원이 없습니다. 다시선택해주세요 !");
                alert("code = " + request.status + " message = "
                     + request.responseText + " error = " + error); 
               // 실패 시 처리
            }
         })
   
   
   
    
   
}
</script>
<script>
/* 지도스크립트 */
function movDocSelect() {}
var markers=[];
var mapContainer = document.getElementById('map2'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(35.901715, 128.613648), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
// 키워드로 장소를 검색합니다
searchPlaces();
//키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        // 페이지 번호를 표출합니다
        displayPagination(pagination);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        return;
    } else if (status === kakao.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}
//오버레이 제거를 위한 임시 배열
var delOverlay = [];
  function closeOverlay() {
     delOverlay[0].setMap(null);
     delOverlay.shift();
   }
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
   
   
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
   
  //커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
   
    for ( var i=0; i<places.length; i++ ) {
      
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
 
        
      
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker,title) {
           
            kakao.maps.event.addListener(marker, 'mouseover', function() {
               
               
                                  
            });
            
            kakao.maps.event.addListener(marker, 'click', function() {
            
              $.ajax({
               url : "/consulting/selectHospital",
               type : "post",
               dataType : "json",
               data : {
                  "hosp_name" : title
               },
               success : function(data) {
                  glb_hosp_tel=data.hosp_tel;
                   
                              
                    var content = '<div class="wrap">' + 
                    '    <div class="info">' + 
                    '        <div class="title">' + 
                    title + 
                    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                    '        </div>' + 
                    '        <div class="body">' + 
                    '            <div class="img" id="hosp_img">' +
                    '                <img src=' + data.himg_name + ' width="73" height="70">' +
                    '           </div>' + 
                    '            <div class="desc">' + 
                    '                <div class="ellipsis">' +data.hosp_add + '</div>' + 
                    '                <div class="jibun ellipsis" style="margin-bottom:10px;">'+data.hosp_tel +'</div>' + 
                    '                <div><button class="btn btn-outline-secondary btn-sm" style="width:60px;" onClick="goDetail()">예약</button></div>' + 
                    '            </div>' + 
                    '        </div>' + 
                    '    </div>' +    
                    '</div>';
            //마커 위에 커스텀오버레이를 표시합니다
            //마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
            var overlay = new kakao.maps.CustomOverlay({
            content: content,
            position: marker.getPosition(),
            });
         
            
              overlay.setMap(map);  
      
              delOverlay.unshift(overlay);
         
              $.getJSON("/user/getImgList", {hosp_tel: data.hosp_tel}, function(arr){
                  console.log(arr);

                  var str ="";

                  $(arr).each(function(i, attach){

                     //image type
                     if(attach.fileType){
                             var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
                             
                             str += "<div><img src='/display?fileName="+fileCallPath+"'>";
                             str += "</div>";
                             str +"</li>";
                           }else{
                               
                             str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
                             str += "<span> "+ attach.fileName+"</span><br/>";
                             str += "<img src='/resources/img/picture.png'></a>";
                             str += "</div>";
                             str +"</li>";
                           }
                         });
                      $("#hosp_img").html(str);
                  }); 
                  
                  
               },
               error : function(request, status, error) {
                  alert("해당병원이 없습니다. 다시선택해주세요 !")
               /*    alert("code = " + request.status + " message = "
                        + request.responseText + " error = " + error); */
                  // 실패 시 처리
               }
            })
            });
            kakao.maps.event.addListener(marker, 'mouseout', function() {
            
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);
        fragment.appendChild(itemEl);
    }
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}
// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '<h5>' + places.place_name + '</h5>';
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           
    el.innerHTML = itemStr;
    el.className = 'item';
    return el;
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    return marker;
}
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 
    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;
        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}
 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<script type="text/javascript" src="/resources/js/chat.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      /* 소켓 통신  */
      let sock = new SockJS("http://localhost:8080/management2");
      sock.onmessage = onMessage;
      sock.onclose = onClose;
      var userId = "${check.user_id}"; // 유저 아이디
      var roomNum; // 방 번호
      var roomBox = $(".inbox_chat"); // 상당 내역 DIV
      var msgHistory = $(".msg_history"); // 채팅 DIV
      var msgInput = $(".write_msg"); // 채팅 치는 곳
      
      $(".chat_list").on("click", function(e){
         roomNum = $(this).data('num');
         msgList();
      });
      
      /* 메세지 불러오기  */
      function msgList(){
         chatService.msgList({room_num:roomNum},function(list){
            var str = "";
            if(list == null || list.length == 0){
               msgHistory.html("");
               return;
            }
            for(var i = 0;i<list.length;i++){
               
               if("${check.user_id}" == list[i].user_id){
                  str += "<div class='outgoing_msg' data-roomNum='" + list[i].msg_num + "'>";
                  str += "<div class='sent_msg'>";
                  str += "<p>" + list[i].msg_content + "</p>";
                  str += "<span class='time_date'>" + chatService.displayTime(list[i].msg_date) + "</span></div></div>";
               } else {
                  str += "<div class='incoming_msg' data-roomNum='" + list[i].msg_num + "'>";
                  str += "<div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>";
                  str += "<div class='received_msg'>";
                  str += "<div class='received_withd_msg'>";
                  str += "<h5>" + list[i].user_id + "</h5>";
                  str += "<p>" + list[i].msg_content + "</p>";
                  str += "<span class='time_date'>" + chatService.displayTime(list[i].msg_date) + "</span></div></div></div>";
               }
                  
            }
            msgHistory.html(str);
         });
      };
      /* 메세진 send 버튼 클릭시  */
      $(".msg_send_btn").on("click",function(e){
         if(!msgInput.val()){
            
         } else {
            chatService.add({room_num:$('#roomNum').val(),user_id:"${check.user_id}",msg_content:msgInput.val()},function(result){
               sendMessage();
               msgHistory.animate({scrollTop:9999},'slow');
               msgInput.val("");
            });   
         }      
      });
      
      // 엔터입력시 메세지 보내기
      msgInput.keypress(function(event){
         var kcode=event.keyCode;
         if(!msgInput.val()){
         } else {
            if(kcode=='13'){
               chatService.add({room_num:$('#roomNum').val(),user_id:"${check.user_id}",msg_content:msgInput.val()},function(result){
                  sendMessage();
                  msgHistory.animate({scrollTop:9999},'slow');
                  msgInput.val("");
               });   
            }   
         }
      });
      // 메시지 전송
      function sendMessage() {            
         sock.send(msgInput.val()+",${check.user_id}");
      }
      // 서버로부터 메시지를 받았을 때
      function onMessage(msg) {
         var data = msg.data;
         var temp = data.split(",");
         var time = new Date();
         var str = "";
         var selfId = temp[1];
         
         if("${check.user_id}" == selfId){
            str += "<div class='outgoing_msg' data-roomNum='" + roomNum + "'>";
            str += "<div class='sent_msg'>";
            str += "<p>" + temp[0] + "</p>";
            str += "<span class='time_date'>" + chatService.displayTime(time) + "</span></div></div>";
         } else {
            str += "<div class='incoming_msg' data-roomNum='" + roomNum + "'>";
            str += "<div class='incoming_msg_img'> <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'> </div>";
            str += "<div class='received_msg'>";
            str += "<div class='received_withd_msg'>";
            str += "<h5>" + temp[1] + "</h5>";
            str += "<p>" + temp[0] + "</p>";
            str += "<span class='time_date'>" + chatService.displayTime(time) + "</span></div></div></div>";
         }
         msgHistory.append(str);
         msgHistory.animate({scrollTop:9999},'slow');
      }
      // 서버와 연결을 끊었을 때
      function onClose(evt) {
         alert("연결실패");
      }
      
      
      
   });
</script>
</main>
</html>