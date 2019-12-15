<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:import url="/WEB-INF/common/Top2.jsp" />

<!-- 모달창  -->
<!-- ----------------------------------------------------------------------------------------------- -->

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css" >


@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}

.display-none{ /*감추기*/
   display:none;
}
.navbar-nav {
    display: -ms-flexbox;
    display: table;
}


</style>

<script>
   // modal 자동완성
         var sum = 0;
      var director = new Array();
      var title = new Array();
      var image = new Array();
      var pubdate = new Array();
   function roll(a) {
                        var a;
                        //alert(a);
                        var b;
                        var alloc = document.getElementById(a);
                        console.log(alloc);
                        console.log(a);
                        console.log(image[a]);
               
                         if(image[a]==""|| image[a]==null){
                            $('#image').attr('src',"http://jjcp.or.kr/korean/bbs/skin/latest/img_news/noimage.gif");
                              $('#director').attr('value',director[a]);
                              $('#title').attr('value',title[a]);
                             $('#release').attr( 'value', pubdate[a]);
                         } else{
                         $('#image').attr('src',image[a]);
                          $('#director').attr('value',director[a]);
                          $('#title').attr('value',title[a]);
                         $('#release').attr( 'value', pubdate[a]);
                         }
                      }
     
   
   

   //crossDomain 해결코드
   $(function() {
      $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
         if (options.crossDomain && jQuery.support.cors) {
            options.url = "https://cors-anywhere.herokuapp.com/"
                  + options.url;
         }
      });
   });

   //조회할 날짜를 계산
   var dt = new Date();

   //0(1월)부터 시작하기때문에 1더해주기
   var m = dt.getMonth() + 1;
   if (m < 10) {
      var month = "0" + m;
   } else {
      var month = m + "";
   }

   //당일 박스오피스는 안나오기때문에 전날 박스오피를 가져오기위해 -1해줌
   var d = dt.getDate() - 1;
   if (d < 10) {
      var day = "0" + d;
   } else {
      var day = d + "";
   }

   var y = dt.getFullYear();
   var year = y + "";

   var result = year + month + day;

   //천단위마다 콤마찍어주는 함수
   function addComma(num) {
      // 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
      if (num.length <= 3) {
         return num;
      }
      // 3단어씩 자를 반복 횟수 구하기
      var count = Math.floor((num.length - 1) / 3);

      // 결과 값을 저정할 변수
      var result = "";

      // 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
      for (var i = 0; i < count; i++) {

         // 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
         var length = num.length;
         var strCut = num.substr(length - 3, length);
         // 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.

         // 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
         num = num.slice(0, length - 3);

         // 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
         result = "," + strCut + result;
      }
      // 마지막으로 루프를 돌고 남아 있을 입력값(value)을 최종 결과 앞에 추가
      result = num + result;

      // 최종값 리턴
      return result;
   }

   //박스오피스 로딩하는 함수시작
   $(function() {
      $
            .ajax({
               //&itemPerPage: 1-10위 까지의 데이터가 출력되도록 설정
               url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=8ebdfdb365e6a77b79320c6e30c51b3c&targetDt="
                     + result + "&itemPerPage=10",
               dataType : "xml",
               success : function(data) {
                  var $data = $(data)
                        .find(
                              "boxOfficeResult>dailyBoxOfficeList>dailyBoxOffice");
                  //데이터를 테이블 구조에 저장.
                  if ($data.length > 0) {
                     var table = $("<table/>").attr("class", "table");
                     //<table>안에 테이블의 컬럼 타이틀 부분인 thead 태그
                     var thead = $("<thead/>")
                           .append($("<tr/>"))
                           .append(
                                 //추출하고자 하는 컬럼들의 타이틀 정의
                                 $(
                                       "<th width='50px' style='background-color: rgba(0, 0, 0, 0);text-align:center'/>")
                                       .html("순위"),
                                 $(
                                       "<th width='200px' style='background-color: rgba(0, 0, 0, 0);text-align:center'/>")
                                       .html("영화 제목"),

                                 $(
                                       "<th width='150px' style='background-color: rgba(0, 0, 0, 0); text-align:center'/>")
                                       .html("오늘 관객수"));

                     var tbody = $("<tbody/>");
                     $.each(
                                 $data,
                                 function(i, o) {
                                    //오픈 API에 정의된 변수와 내가 정의한 변수 데이터 파싱
                                    var $rank = $(o).find("rank")
                                          .text(); // 순위
                                    var $movieNm = $(o).find(
                                          "movieNm").text(); //영화명
                                    //var $openDt = $(o).find("openDt").text();// 영화 개봉일
                                    var $audiCnt = $(o).find(
                                          "audiCnt").text(); //해당일의 관객수
                                    //var $audiAcc = $(o).find("audiAcc").text(); //누적 관객수

                                    //<tbody><tr><td>태그안에 파싱하여 추출된 데이터 넣기
                                    var row = $(
                                          "<tr style='background-color: rgba(0, 0, 0, 0);'/>")
                                          .append(
                                                $(
                                                      "<td style='background-color: rgba(0, 0, 0, 0);'/>")
                                                      .text(
                                                            $rank),
                                                $(
                                                      "<td style='background-color: rgba(0, 0, 0, 0);'/>")
                                                      .text(
                                                            $movieNm),
                                                $(
                                                      "<td style='background-color: rgba(0, 0, 0, 0);'/>")
                                                      .text(
                                                            addComma($audiCnt)));
                                    tbody.append(row);
                                 });// end of each 
                     table.append(thead);
                     table.append(tbody);
                     $(".wrap").append(table);
                  }
               } ,beforeSend:function(){
                   $('.wrap3').removeClass('display-none');

               },complete:function(){


                   $('.wrap3').addClass('display-none');
                   
               },
               error : function() {
                  alert("실시간 박스오피스 로딩중...");
               }
            });
   }); //박스오피스 로딩하는 함수끝
   
   
   // 검색 결과 비동거 처리
   $(document).ready(function() {

     $("#movieSearch").keyup(function(key) {
        if (key.keyCode == 13) {
           
           var offset = $("#movie_search").offset();
           $('html').animate({scrollTop : offset.top}, 400);
           
           $.ajax({
                  url : "<c:url value="/MovieServiceJSON"/>",
                  type : "post",
                  dataType : "json",
                  data : {
                     query : $("#movieSearch").val()
                  },
                  success : function(json) {
                     $("#movieResult").empty();
                     $.each(json.items,function(i,item){
                        // 추가 modal 조건 지우기
                        var yettitle1 = item.title.replace("<b>", "");
                        var yettitle2 = yettitle1.replace("</b>", "");
                        var yettitle3 = yettitle2.replace("\'", "");
                        var erasedirector = item.director.replace("|","");
                        var erasedirector2 = erasedirector.replace("|", "");
                        director.push(erasedirector2);
                        title.push(yettitle3);
                        image.push(item.image);
                        pubdate.push(item.pubDate);
                       
                        console.log(item);
                        $("#movieResult").append(
                             "<div class='w3l-movie-gride-agile requested-movies' style='width:300px'>" +
                                 "<a class='hvr-sweep-to-bottom' id='"+(sum++)+"' data-toggle='modal' data-target='#myModal' onmouseover='roll(this.id)'>" +
                                 "<img src='"+(item.image==""||item.image==null ? "http://jjcp.or.kr/korean/bbs/skin/latest/img_news/noimage.gif" : item.image)+"' title='"+item.title+"' class='img-responsive movie-images' alt=' '>" +
                                    "<div class='w3l-action-icon'>" +
                                       "<i class='fa fa-play-circle-o' aria-hidden='true'></i>" +
                                    "</div> " +
                                 "</a>" +
                                 "<div class='mid-1 agileits_w3layouts_mid_1_home'>" +
                                    "<div class='w3l-movie-text'> " +
                                       "<h6>"+item.title.substring(0, 12)+"</h6>" +
                                    "</div>" +
                                    "<div class='mid-2 agile_mid_2_home'>" +
                                       "<h6>"+item.pubDate+"</h6>" +
                                       "<div class='clearfix'></div>" +
                                    "</div>" +
                                 "</div>" +
                              "</div>"
                              
                             );
                     });
                     
                  },
                  error : function(err) {
                     alert("에러");
                  }
               });
        }
     });
 
                     
     $(document).ready(function(){
        $( '#release' ).attr( 'value', 'Hello' );
        $(".hvr-sweep-to-bottom").on("click", function() {
           console.log(this.id);
        })
    });

     
     
     
     
     

     /*
     function reply_click(clicked_id)
     {
         alert(clicked_id);
     }
     */
     
     
     
  });
  
 
   
</script>
<!-- banner-text -->

<div class="row" >
 <div class="col-lg-12" >
      <div class="col-lg-9" style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; ">
         <div class="slider" style="height: auto">
            <div class="callbacks_container">
               <ul class="rslides callbacks callbacks1" id="slider4">
                     <li>
                     <div class="gmkim-css" >
                        <div class="banner-info_agileits_w3ls">
                           <h3 style="font-family: 'Noto Serif KR', serif;">
                              <strong> Frozen 2 </strong>
                           </h3>
                          
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="gmkim-css1" >
                        <div class="banner-info_agileits_w3ls">
                            <h3 style=" font-family: 'Noto Serif KR', serif;"> Aladin </h3>
                        </div>

                     </div>
                  </li>
                  <li>
                     <div class="gmkim-css2">
                        <div class="banner-info_agileits_w3ls" >
                             <h3 style=" font-family: 'Noto Serif KR', serif;"> Toy Story </h3>
                        </div>

                     </div>
                  </li>
                  <li>
                     <div class="gmkim-css3" >
                        <div class="banner-info_agileits_w3ls">
                           <h3 style=" font-family: 'Noto Serif KR', serif;">La La Land</h3>
                        </div>

                     </div>
                  </li>
               </ul>
            </div>
            <div class="clearfix"></div>
         </div>

      </div>

       <div class="col-lg-3"
         style="padding-left: 0px; padding-right: 0px; min-height: 70%;">
         <div class="col-lg-12" style="background-color: #3c3d47; color: white; text-align: center; ">
            <h3 style="margin-top: 25px; margin-bottom: 25px; font-family: 'Noto Serif KR', serif;">Box Office</h3>
         </div>
         <div class="col-lg-12"
            style="background-color: #f9f9f9; color: #202040; text-align: center; margin-top: 5px; padding-bottom: 5px;   ">
            <div id="movieChart">

               <div id="mo_searchBox">
                  <h3 style="margin-top: 15px; margin-bottom: 15px; font-family: 'Noto Serif KR', serif;">- 실시간 박스오피스 -</h3>
                  <form name="serviceAPISearchForm" id="serviceAPISearchForm"
                     method="post" action="" onsubmit="return false;"
                     style="padding-bottom: 8px; padding-top: 8px ">
                     <div id="mo_inline"></div>

                  </form>
               </div>

               <div class="wrap">
                           
               </div>

            </div>
            <div class="wrap3" style="text-align: center; margin-top:200px ">
            <div><img src="./images/loading1.gif" /></div>
               <div id="close" onclick="$.close();" style="float: right;">
                      
               
               </div>
               <div class="wrap2" id="popup">
                  
               </div>
               
            </div>

            <div id="bottomSpace"></div>
         </div>

      </div>

   </div>
</div>
<!--//Slider-->

<div class="container" id="movie_search" >    
    <div class="col-sm-12" id="movieResult">
    
    </div>
</div>  

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" align="center">
          <h4 class="modal-title" style=" font-family: 'Noto Serif KR', serif;">WatchList Add</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="was-validated" action="addwatch.list" enctype="multipart/form-data" method="post">
          
          <div class="form-label-group" text-align="center" align="center">
              <img id="image" src="https://cdn.pixabay.com/photo/2019/09/22/18/12/wolf-4496659_960_720.jpg" width="15%" height="15%" align="center">
         </div>
  
  <hr class="my-4">
     <div class="row">
    <div class="col" width="33%" align="center" >Poster File</div>
    <div class="col" width="33%" align="center">Input Date</div>
    <div class="col" width="33%" align="center">Public or Private</div>
    <hr class="my-4">
    <div class="w-100"></div>
    <div class="col" width="33%">
      <div class="custom-file">
      <input type="file" id="file" name="file" class="custom-file-input" required>
      <label class="custom-file-label" for="validatedCustomFile">Poster</label>
      <div class="invalid-feedback">Select your movie poster file</div>
    </div>
    </div>
    <div class="col" width="33%">
      <div class="form-label-group">
        <input type="date" id="servdate" name="servdate" class="form-control" required>
        <label class="custom-date-label" for="validatedCustomDate"></label>
  </div>
    </div>
    <div class="col" width="33%" align="center">
    <div class="form-label-group">
    <input type="radio" name="ispublic" id="ispublic-1" value="0" checked>Public
     <input type="radio" name="ispublic" id="ispublic-2" value="1">Private
    </div>
    <div class="invalid-feedback">Do you want to get private?</div>
  </div>
    </div>
  
    <hr class="my-4">
    


  <div class="form-label-group">
        <label for="validationTextarea">Title</label>
        <input type="text" id="title" name="title" class="form-control" placeholder="Title" required readonly>
  </div>
  
  <div class="form-label-group">
        <label for="validationTextarea">Director</label>
        <input type="text" id="director" name="director" class="form-control" placeholder="Director" required readonly>
  </div>
  
  <div class="form-label-group">
        <label for="validationTextarea">Release</label>
        <input type="text" id="release" name="release" class="form-control" placeholder="Release" required readonly>
  </div>

  <div class="mb-3">
    <label for="validationTextarea">Comment</label>
    <textarea class="form-control is-invalid" id="comment" name="comment" placeholder="Required example textarea" required></textarea>
    <div class="invalid-feedback">
      Write message about this movie in 20 letters
    </div>
  </div>
    <button class="btn btn-sm btn-primary btn-block" type="submit" width="30%">Add</button>
        <br>
      <button class="btn btn-sm btn-primary btn-block" data-dismiss="modal" width="30%">Cancel</button>
  
</form>
        </div>
        
        <!-- Modal footer -->
        
        
        
      
          
        
        
      </div>
    </div>
  </div>






<c:import url="/WEB-INF/common/Bottom.jsp" />

</body>
<script>


</script>
</html>