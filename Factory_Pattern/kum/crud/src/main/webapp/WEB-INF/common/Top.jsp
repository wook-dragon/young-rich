<%@page import="kr.or.photic.dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.photic.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta name="keywords" content="" />

<script type="application/x-javascript">
   
      addEventListener("load", function () {
         setTimeout(hideURLbar, 0);
      }, false);

      function hideURLbar() {
         window.scrollTo(0, 1);
      }
      console.log(window.location.pathname);
      var href = window.location.pathname;
      console.log(href.indexOf("/20191129/notice.board"));
      console.log($(".nav navbar-nav").children());
      var sBtn = $("ul > li");
      $(function(){
    	      //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
    	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
    	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
    	   
    	   console.log($(this));
    	   $(this).addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
    	  });
    	 });
      console.log(sBtn.find("a"));
   
</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">

<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>

</head>

<body>
   <!--Header-->
   <c:set var="membercode" value="${sessionScope.usercode }"></c:set>

   <div class="header" id="home">
      <!--top-bar-w3-agile-->
      <div class="top-bar_w3agileits">
         <div class="top-logo_info_w3layouts">
            <div class="col-md-3 logo">
               <h1>
                  <a class="navbar-brand" href="loginOk.me" style="font-family: 'Noto Serif KR', serif;">Momory<span>Movie
                        Memory</span></a>
               </h1>
            </div>
            
            <div class="col-md-9 adrress_top" style="width: 50%; font-family: 'Noto Serif KR', serif;"">
               <div class="adrees_info">
                  <div class="col-md-6 visit">
                     <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                        <span class="fa fa-home" aria-hidden="true"></span>
                     </div>
                    <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                        <h4 style="font-family: 'Noto Serif KR', serif;"><a href="Zzonzzoni.jsp">Visit us</a></h4>
                        <p style="font-family: 'Noto Serif KR', serif;">Gangnam-gu, Korea</p>
                     </div>
                     <div class="clearfix"></div>
                  </div>
                  <div class="col-md-6 mail-us">
                     <div class="col-md-2 col-sm-2 col-xs-2 contact-icon">
                        <span class="fa fa-envelope" aria-hidden="true"></span>
                     </div>
                     <div class="col-md-10 col-sm-10 col-xs-10 contact-text">
                        <h4 style="font-family: 'Noto Serif KR', serif;">Mail us</h4>
                         <p style="font-family: 'Noto Serif KR', serif;"> bitcampgangnam@gmail.com </p>
                         </div>
                  </div>
               </div>
            </div>
            <div class="clearfix">
            </div>
         </div>
         <div class="header-nav">
            <div class="inner-nav_wthree_agileits">

               <nav class="navbar navbar-default">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                     <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> <span
                           class="icon-bar"></span> <span class="icon-bar"></span> <span
                           class="icon-bar"></span>
                     </button>
                  </div>
                  <!-- Collect the nav links, forms, and other content for toggling -->
                  <div class="collapse navbar-collapse nav-wil"
                     id="bs-example-navbar-collapse-1" style="display: auto;">
                     <nav>
                       <ul class="nav navbar-nav" >

                           <li><a href="loginOk.me"style="font-size: 15px;"><strong>Home</strong></a></li>
                           <c:choose>
                              <c:when test="${sessionScope.usercode==1}">
                                 <li><a href="mypageOk.me" style="font-size: 15px;"><strong><img alt="" src="images/user.png" style="width:25px;height:20px  "></strong></a></li>
                              </c:when>
                             </c:choose>
                                 <li><a href="shareOk.list" style="font-size: 15px;" > <strong>SHARED LIST </strong></a></li>
                           
                           
                           <li class="dropdown">
                       
                           <li><a href="qna.board" style="font-size: 15px;"><strong>Q & A</strong></a></li>
                           <li><a href="free.board" style="font-size: 15px;"><strong>FREE BOARD</strong></a></li>
                            <li><a href="notice.board" style="font-size: 15px;"><strong>NOTICE</strong></a></li>
                            <c:if test="${membercode==3 }">
                            <li><a href="adminManage.me" style="font-size: 15px;"><strong>MANAGE</strong></a></li>
                            </c:if>
                                                  
                           <li><a href="frontpage.jsp" style="font-size: 15px;"><strong>LOGOUT</strong></a></li>
                            <li readonly><a style="font-size: 15px;"><strong>${sessionScope.nickname }회원님 환영합니다.</strong></a></li>
                              </ul>

                          
                          
                       
                     </nav>
                  </div>
               </nav>

             
               <div class="clearfix"></div>
            </div>
         </div>
      </div>
      </div>
      </body>
      </html>
     
      <!--//top-bar-w3-agile-->