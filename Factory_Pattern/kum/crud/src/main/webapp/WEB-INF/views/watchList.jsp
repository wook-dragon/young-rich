<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/WEB-INF/common/Top.jsp" />    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

    <title>WatchList</title>
    <link rel="stylesheet" type="text/css" href="assets/css/ticket.css" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <script type="text/javascript">
    
  	  var userid = <%= request.getAttribute("userid") %>;  
    </script>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    
<style type="text/css">
	body {
		overflow-y:scroll;
		height:900px;
		
}


</style>    
    
    
</head>

<body>



	<div class ="container" style="margin-top: 150px; min-height: 300px;">
	<div class="page-header">
		<h1> WatchList TimeLine</h1>
	</div>
		<ul class="timeline" id="timeline">

		</ul>
	</div>

<c:import url="/WEB-INF/common/Bottom.jsp" />
</body>
<script type="text/javascript">
var index = 0;

function checkI(i){
	if(i%2==0){
		mode = '<li class="timeline-inverted">';  //이게 오른쪽으로 붙음
	}else if(i%2!=0){
		mode = '<li class="left">';    //  왼쪽으로 붙음
	}

}
//인덱스가 짝수면 오른쪽 ,  인덱스가 홀수면 왼쪽으로 이미지가 붙음


$(window).on("scroll", function() {
	
	var scrollHeight = $(document).height();   // 문서의 길이 
	var scrollPosition = $(window).height() + $(window).scrollTop(); //모니터 화면의 길이 + 상단으로부터 스크롤의 위치값
	
	
	/*
	scrollHeight는 현재 문서의 길이, scrollPosition은 현재 스크롤 위치 입니다.
	위 코드는 스크롤의 위치가 밑에서 100px안에 들어갔을때 특정 액션을 하겠다는 뜻입니다.
	*/
							      				      
							    	
	if (scrollPosition > scrollHeight - 100) {	
		$.ajax({
			url:"data.ajax",
			datatype:"JSON",
			data: {"index": index },
			type:"POST",
			timeout: 500,
			success : function(data){
				if(data == null){
					return;
				}else if(data != null){
					
				var json1 = JSON.parse(data);
					console.log(json1.seq);
					checkI(index);
					$("#timeline").append(
							 
								mode
								+ '<div class="timeline-badge success">'
								+	'<i class="glyphicon glyphicon-time"></i>'
								+'</div>'
								+'<div class="timeline-panel">'
								+	'<div class="timeline-heading">'
								+		'<h4 class="timeline-title">'
								+ json1.servdate
								+ '</h4>'
								+	'</div>'
								+	'<div class="timeline-body">'
								+		'<p>'
								+		'<img src="uploads/'+json1.mypicsrc+'">'
								+       '</p>'
								+		'<p>'
								+		json1.content
								+		'</p>'		
								+	'</div>'
								+'</div>'
								+'</li>'
								
					)  // append 끝
				} // 	(받아온 데이터가 있을 때) if else문 끝 
			},  // success 끝 
			complete : function() {
		        index++;   
		    }
		})   //아작스 끝

	} //무한 스크롤 if문 끝
	
});        //윈도우 무한스크롤 끝



</script>
<script src="assets/js/watchList_psh_js/watchlist.js"></script>
</html>