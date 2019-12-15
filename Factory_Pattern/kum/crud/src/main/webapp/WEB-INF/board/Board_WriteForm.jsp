<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	if (session.getAttribute("id") == null ) {
		response.sendRedirect("frontpage.jsp");
		return;
	}
		

	request.setAttribute("seq", request.getParameter("seq"));
	request.setAttribute("type", request.getParameter("type"));	
	
%>

<c:import url="/WEB-INF/common/Top.jsp" />

<head>

<!-- include summernote css/js-->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style type="text/css">
html, body {
   height: 100%;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
            height: 300,                 
            minHeight: null,           
            maxHeight: null,            
            focus: true                 
    });
});
        
 
      function check() {
         if (!bbs.title.value) {
            alert("제목을 입력하세요");
            bbs.subject.focus();
            return false;
         }
         if (!bbs.summernote.value) {
            alert("글 내용을 입력하세요");
            bbs.writer.focus();
            return false;
         }
         document.bbs.submit();
      }
        
   
</script>

</head>

<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>

<body data-spy="scroll" data-target=".site-navbar-target"
   data-offset="300">
   <!-- Top -->

<div class="container">
   <div class="content" >
      <div class="comment-form-wrap pt-xl-2">

      	<c:choose>
      		<c:when test="${type == 1 }">
      			<h3 class="text-center mb-5 bread" style="font-family: 'Noto Serif KR', serif;">자유 게시판</h3>
      			<br>
      		</c:when>
      		<c:when test="${type == 2 }">
      			<h3 class="text-center mb-5 bread" style="font-family: 'Noto Serif KR', serif;">공지사항</h3>
      			<br>
      		</c:when>
      		<c:when test="${type == 3 }">
      			<h3 class="text-center mb-5 bread" style="font-family: 'Noto Serif KR', serif;">QnA 게시판</h3>
      			<br>
      		</c:when>
      	</c:choose> 
      
      	
         <form name="NBW" class="p-5 bg-light" action="writeAct.board" method="POST">
         
         	<input type="hidden" value="${requestScope.type }" name="type">
     		<input type="hidden" value="${sessionScope.id }" name="userid">
     		
     		<input type="hidden" value="0" name="rw">
     		     		
            <table class="table table-bordered" id="dataTable" style="width: 60%;margin: auto;  border-collapse: collapse;">
               <tr>
                  <td>
                  	<input class="form-control" type="text" placeholder="제목" name="title">
                  </td>
               </tr>
               <tr>
                  <td>
	                  <textarea id="summernote" rows="10" cols="60" id="content" name="content" class="ckeditor">
	                  </textarea>
	              </td>
               </tr>
            </table>

         <br>
            <div class="mt-5 text-center" style=" display: block; ">
               	<input type="submit" class="btn btn-dark" value="확인 " onclick="check();"> 
				<input type="button" class="btn btn-dark" value="취소" onclick="history.back(-1);">
            </div>
            <br>
         </form>

      </div>
   </div>
   </div>
<c:import url="/WEB-INF/common/Bottom2.jsp" />
</body>

</html>