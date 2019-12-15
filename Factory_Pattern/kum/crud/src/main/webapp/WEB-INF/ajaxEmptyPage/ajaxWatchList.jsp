
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>

    

    
   
     
      

  	<%
  
     	System.out.println("빈파일 도착");
		request.setCharacterEncoding("UTF-8");
		JSONObject jsonobject;
		jsonobject = JSONObject.fromObject(request.getAttribute("jsonobject"));
    	System.out.println("여기는 빈페이지 jsonobject: " + jsonobject);
    	out.print(jsonobject);
    	
    	
      %>
      
         <%--  <%= (JSONArray) request.getAttribute("jArray")%> --%>
          
