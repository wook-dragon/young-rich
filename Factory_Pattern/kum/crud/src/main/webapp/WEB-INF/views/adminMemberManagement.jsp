<%@page import="kr.or.photic.dto.Member"%>
<%@page import="kr.or.photic.dao.MemberDAO"%>
<%@page import="kr.or.photic.dao.CommunityDAO"%>
<%@page import="oracle.net.ns.Communication"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   MemberDAO dao = new MemberDAO();

   ArrayList<Member> memberlist = dao.MemberSelectAll();

   request.setAttribute("memberlist", memberlist);
%>

<c:import url="/WEB-INF/common/Top.jsp" />

<html>
<head>
<meta charset="utf-8">
<title>관리자 회원 확인페이지</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/5.0.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

</head>
<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>

<!-- 광민오빠 뷰단 -->
<body style="text-align: center;">
   <hr>
   <h3 style="font-family: 'Noto Serif KR', serif;">[회원 휴면계정 관리 페이지]</h3>
   <br>
   <div class="container" style="width: 60%; height: 450px">
      <table class="table table-hover">
         <thead>
            <tr style="text-align: center;">

               
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">아이디</th>
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">닉네임</th>
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">비밀번호</th>
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">생년월일</th>
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">성별</th>
               <th scope="col" style="text-align: center; font-family: 'Noto Serif KR', serif;">휴면 계정관리</th>
               
            </tr>
         </thead>
         <tbody>
            
            <c:forEach var="member" items="${requestScope.memberlist}">
            
                  
               <tr>
                  <td>${member.userid}</td>
                  <td>${member.nickname}</td>
                  <td>${member.pwd }</td>
                  <td>${member.birthdate}</td>
                  <td>${member.gender}</td>
                  <td>
                     <form action="adminEdit.list">
                     <input name="userid" type="hidden" value="${member.userid}">
                     <input name="usercode" style="width:30px;text-align:center ;background-color: rgba(0,0,0,0); "type="text" id="usercode" value="${member.usercode}">
                     <input type="submit" style="color: black;margin-right: 10px"value="수정"></form></td>
                  <!-- <td></td> -->
               </tr>

            </c:forEach>

         </tbody>
      </table>
   </div>
   <c:import url="/WEB-INF/common/Bottom.jsp" />
</body>
</html>




