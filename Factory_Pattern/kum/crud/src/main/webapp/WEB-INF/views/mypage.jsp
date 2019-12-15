<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:import url="/WEB-INF/common/Top.jsp" />

<html>
<head>
<meta charset="utf-8">
<title>CSS</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/5.0.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
.gm-header {
	width: 50%;
	padding: 10px;
	margin-bottom: 10px;
	border: 3px solid #bcbcbc;
	text-align: center;
	display: contents;
}

.gm-content {
	width: 40%;
	padding: 20px;
	float : right;
	border: 2px solid #bcbcbc;
	text-align: center;
	margin-left: 30px;
}

.gm-content3 {
	width: 40%;
	margin-right: 30px;
	padding: 20px;
	
	border: 2px solid #bcbcbc;
	text-align: center;
}

.gm-content2 {
	width: 58%;
	text-align: center;
	padding: 20px;
	border: 2px solid #bcbcbc;
	margin: auto;
}
</style>
</head>

<body>
		<div class="container" style="border: 2px solid; border-bottom-color: black;">

		<div class="gm-header">
			<h3 class="h2 mb-2">My page</h3>
		</div>
		<br>

		
		<div class="col-md-6">
			<div class="gm-content" style="position: static;">
				<i class="fas fa-3x fa-gem text-primary mb-3"></i>
				<h3 class="h4 mb-2">List</h3>
				<p class="text-muted mb-0">
					<a href="myWatchList.list" style="color: black"> My Watched List </a>
				</p>
			</div>
			</div>
			
		<div class="col-md-6">
			<div class="gm-content3" style="position: static;">
				<i class="fas fa-3x fa-laptop-code text-primary mb-3"></i>
				<h3 class="h4 mb-2">Customer</h3>
				<p class="text-muted mb-0">
					<a href="mypageEdit.me" style="color: black" > 회원정보 변경 </a>
				</p>
			</div>
		</div>
		
		<br><br>
		<div class ="container" style="margin-top: 150px; min-height: 500px;">
			<div class="gm-content2">
				<i class="fas fa-3x fa-heart text-primary mb-3"></i>
				<p>[ ${sessionScope.id} ] 님 안녕하세요 ^^ </p>
				<br>
				<dl>
					<dt> 닉네임 </dt>
					<dd> ${sessionScope.nickname}</dd>
				</dl>
				<dl>
					<dt>이 메 일</dt>
					<dd>${sessionScope.id }</dd>
				</dl>
			</div>
	</div>
	</div>
	<br>

	<c:import url="/WEB-INF/common/Bottom.jsp" />
</body>
</html>





